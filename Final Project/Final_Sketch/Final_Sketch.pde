//Final Project
//DISCLAIMER: I do not own the song used in this sketch. All rights to it and any money made from it go to its creators.

//bugs/issues: You can't jump and move at the same time. To move while in air, hit w, let go, and then hold A or D to move in that direction.
           //also, when you hit w and then don't hit another key before you hit the ground, your character jumps again. 

//objective: Get to the dot on the screen, and beat dummies on the way. You do that by shooting them with the color they're weak to.
//red beats green, green beats blue, blue beats red.
//Touching an enemy's head with your heads makes you lose. This resets the game.

//Controlls:
/*
W = jump
A = left
D = right
SPACE = change color
P = Pause/Resume
O = Restart
Click to the right of your character to shoot right, click to the left of your character to shoot left.

*/

import processing.sound.*; //importing processing.sound
SoundFile Song;

//global variables/ created objects.
PImage endpoint;   //endpoint image.
PImage won;        //win image
coord playerPos;   //player position
float colour = 0;  //color of your head
int deaths = 0;    //number of deaths
String tally;      //string for death counter
player one;        //creating player one.
coord two = new coord(1000, 470);   //coord for first enemy, second character on screen.
coord three = new coord(1200, 70);  //coord for second enemy
coord four = new coord(1600, 670);  //coord for third enemy
coord five = new coord(400, 470);   //coord for fourth enemy
ArrayList<enemy> enemies = new ArrayList<enemy>(); //arraylist for enemies
platform brick1;    //platforms
platform brick2;
platform brick3;
platform brick4;
platform brick5;
platform brick6;
platform brick7;
boolean playercoll = false;   //boolean that checks for collissions between your feet and platforms
boolean playerhit = false;    //boolean that checks if you have run into an enemy
boolean onFloor = false;      //boolean that checks if you are touching the floor.
boolean headcoll = false;     //boolean that checks if your head is touching a platform from below
ArrayList<bullet> shots = new ArrayList<bullet>();  //arraylist for bullets


void setup(){
  size(1920, 1080);  //the basics
  background(150);
  
  Song = new SoundFile(this, "NextEpisode.wav");
  endpoint = loadImage("endpoint.png");
  won = loadImage("smokingSnoop.jpg");
  
  enemies.add(new enemy(two));     //adding enemies to array. Done manually for now
  enemies.add(new enemy(three));
  enemies.add(new enemy(four));
  enemies.add(new enemy(five));
  playerPos = new coord(100, 800);              //restating player position
  one = new player(playerPos);                  //creating player one at playerPos
  brick1 = new platform(new coord(1200, 300));  //creating platforms. done manually for now.
  brick2 = new platform(new coord(1000, 700));
  brick3 = new platform(new coord(400, 700));
  brick4 = new platform(new coord(1600, 900));
  brick5 = new platform(new coord(550, 200));
  brick6 = new platform(new coord(0, 500));
  brick7 = new platform(new coord(-100, 300));
  
}

void draw(){
  background(150);                  //grey bg
  colorMode(RGB);  
  tally = "Deaths: " + deaths;      //death counter
  imageMode(CENTER);
  fill(255);                        //getting to this endpoint ends the game.
  image(endpoint, 1600, 200, 120, 120);
  
  
  for(int i = 0; i < enemies.size(); i++){    //moves enemies, takes care of interactions between enemies, player, and bullets.
    enemy e = enemies.get(i);
    for(int j = 0; j < shots.size(); j++){
      bullet n = shots.get(j);
      if((dist(e.start.x, e.start.y, n.pos.x, n.pos.y) < 50) && ((n.hue == 0 && e.eColor == 120) || (n.hue == 120 && e.eColor == 240) || (n.hue == 240 && e.eColor == 0))){
        e.smacked = true; 
      }
    }
    if(dist(playerPos.x, playerPos.y, e.start.x, e.start.y) < 50){     //what happens if you hit an enemy
      playerhit = true;
      if(playerhit){
        deaths ++;
        playerPos = (new coord(100, 800));
        one.bulletplace = playerPos;
        reset();
        playerhit = false;
      }
    }
    e.move();
    e.show();
    if(e.smacked){ //if enemy is hit by a bullet of a stronger color, they die
      enemies.remove(i);
    }
    
  }
  one.show();         //moving and showing player
  one.move();
  one.run();
  one.shoot();
  brick1.show();      //showing platforms
  brick2.show();
  brick3.show();
  brick4.show();
  brick5.show();
  brick6.show();
  brick7.show();
  fill(255);
  textSize(50);
  text(tally, 1600, 1000);            //death counter
  
  if(brick7.collission() || brick6.collission() || brick5.collission() || brick4.collission() || brick3.collission() || brick2.collission() || brick1.collission()){
    playercoll = true;                                                                                 //sets off feet collision boolean
  }
  else{
    playercoll = false;
  }
  
  if(playerPos.y >= 880){                                                                                              //sets off floor collision boolean
    onFloor = true;
  }
  else{
  onFloor = false;
  }
  
  if(brick7.ceiling() || brick6.ceiling() || brick5.ceiling() || brick4.ceiling() || brick3.ceiling() || brick2.ceiling() || brick1.ceiling()){ //sets off head collision boolean
  headcoll = true;
  }
  else{
    headcoll = false;
  }
  
  if((playerPos.x > 1550) && (playerPos.x < 1650) && (playerPos.y < 250) && (playerPos.y > 150)){
    win();
    playerPos.x = 1600;
    playerPos.y = 200;
    one.acceleration.y = 0;
  }
  
}


void reset(){                                    //function to reset screen, recreates everything that needs to be recreated.
  for(int i = 0; i < enemies.size(); i++){
    enemy e = enemies.get(i);
    e.smacked = true;
  }
  enemies.add(new enemy(new coord(1000, 470)));
  enemies.add(new enemy(new coord(1200, 70)));
  enemies.add(new enemy(new coord(1600, 670)));
  enemies.add(new enemy(new coord(400, 470)));
  playerPos = new coord(100, 800);
  one = new player(playerPos);
}

void win(){              //what happens when you win
  won = loadImage("smokingSnoop.jpg");
  rectMode(CENTER);
  colorMode(RGB);
  fill(0);
  imageMode(CENTER);
  image(won, 960, 540, 1920, 1080);
  fill(0);
  textSize(200);
  textMode(CENTER);
  text("YOU WIN",50, 350);          //you win announcement
  textSize(50);
  text(tally, 100, 450);            //death counter
  if(!Song.isPlaying()){             // plays song on win
   Song.play(); 
  }
}


void keyPressed(){                                                 
  if(key == ' '){                                           //press SPACE to change color
    colour = (colour+120)%360; //cycles through red, green, and blue.
    println(colour);           //just a test to make sure colors are rotating correctly.
  }
  
  if(key == 'p' || key == 'P'){                                           //PAUSE
    looping = !looping;
    }
  if(key == 'p' || key == 'P' && looping == false ){                      //UNPAUSE
    redraw();
    }
  if(key == 'o' || key == 'O' && looping == false){                       //RESTART    (also what to do when you win so you can play again)
  reset();
  deaths = 0;                                                            //(may be paused after you win, in which case press P again to unpause it)
  Song.stop();
  redraw();
    }
  
}
