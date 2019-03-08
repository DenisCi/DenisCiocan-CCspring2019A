//Assignment 5: Character drawing and animation.     //characters are the balloonheads

float posx = 700; //initial x position of first guy
float posy = 800; //initial y position of first guy
float radius = 200;  //radius of guy1's head
float speedx = 0;    //movement in x
float step = .5;      //speed of inflation

void setup(){
  size(1920, 1080); //size
  background(70, 120, 240); //blue sky
}

void draw(){
  background(70, 120, 240);  //refresh blue sky
  rectMode(CENTER);
  fill(50, 230, 100);  //green for grass
  noStroke();          //grass doesn't need an outline
  rect(width/2, height, width, height); //draws grassy area
  
  drawGuy(posx, posy, radius, 20);  //guy 1, thinner guy
  drawGuy(posx + 300, posy, radius+200, 30);  //guy 2, thiccer guy
  
  moveGuys();                    //move guys however you want
  inflateHeads();                //inflate heads however you want
}

void drawGuy(float posx, float posy, float headsize, float weight){  //draws guy
  strokeWeight(weight);                    //line weight determines thiccness
  stroke(0);                               //black outline
  line(posx-50, posy+200, posx, posy-100);     //left leg
  line(posx+50, posy+200, posx, posy-100);     //right leg
  line(posx, posy-100, posx, posy-500);        //torso
  line(posx-50, posy-100, posx, posy-400);     //left arm
  line(posx+50, posy-100, posx, posy-400);     //right arm
  fill(255, 80, 0);                        //red-orange head
  strokeWeight(3);                         //less outline on head for clarity of balloon
  ellipse(posx, posy-500, headsize, headsize); //head
}

void moveGuys(){  //moves guys left to right. uses user input from below
  posx += speedx;  
  
  if (posx <= 100){  //limits movement to the left
   posx = 100;
   speedx = 0;
  }
  if (posx >= 1520){  //limits movement to the right
   posx = 1520;
   speedx = 0;
  }
}

void inflateHeads(){ //inflate / deflate heads
   radius += step;  
   
  if (radius >= 500){   //limit on head size
   radius =  500;
   step = 0;
  }
  if (radius <= -500){  //limit on head size
    radius = -500;
    step = 0;
  }
}

void keyPressed(){
  if (key == 'd'){  //increase speed to the right
    speedx += 1;
  }
  if (key == 'a'){  //increase speed to the left
    speedx -= 1;
  }
  if (key == 'w'){  //adds to step. inflates faster. deflates if radius is negative
    step += 0.5;
  }
  if (key == 's'){  //subtracts from step. inflates slower/deflates. if radius becomes negative, inflates again.
    step -= 0.5;
  }
}
