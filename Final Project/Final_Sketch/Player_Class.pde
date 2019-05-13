//class for player character. 

class player{
  //fields
  public boolean left = false;  //boolean for moving left
  public boolean right = false; //boolean for moving right
  public boolean jump = false;  //boolean to jump
  public coord position = new coord(playerPos.x, playerPos.y);  //sets position equal to playerPos. This is bc of everything being hand placed for now instead of randomized or having presets.
  public coord velocity = new coord(0, 0);                      //velocity of player
  public coord acceleration = new coord(0, 0.2);                //acceleration of player.  Includes gravity
  public coord bulletplace = playerPos;                         //place where bullets shoot from. can be changed so that you shoot from your hands or feet if you want
  public boolean collided = false;                              //checks if player is touching any platforms.
  
  //constructors
  
  public player(){}       //blank constructor
  
  public player(coord x){ //constructor that takes a coordinate
    position = x;
  }
  //methods
  
  public void show(){     //shows player character
  colorMode(RGB, 255, 255, 255);
  rectMode(CENTER);
  fill(0);
  strokeWeight(10);
  line(playerPos.x, playerPos.y, playerPos.x, playerPos.y + 100);           //torso
  line(playerPos.x, playerPos.y + 40, playerPos.x - 30, playerPos.y + 100); //left arm
  line(playerPos.x, playerPos.y + 40, playerPos.x + 30, playerPos.y + 100); //right arm
  line(playerPos.x, playerPos.y + 100, playerPos.x - 30, playerPos.y + 200);//left leg
  line(playerPos.x, playerPos.y + 100, playerPos.x + 30, playerPos.y + 200);//right leg
  strokeWeight(5);
  colorMode(HSB, 360, 100, 100);
  fill(colour, 100, 100);
  ellipse(playerPos.x, playerPos.y, 50, 50);                               //head
  } 
  
  void move(){
    playerPos.x += velocity.x;
    playerPos.y += velocity.y;                                             //updating vecotrs
    velocity.x += acceleration.x;
    velocity.y += acceleration.y;
    
    if(playerPos.x <= 0 || playerPos.x >= 1920){                           //limits
      velocity.x = 0;
      acceleration.x = 0;
    }
    if(playerPos.y+200 >= 1080){
      velocity.y = 0;
      acceleration.y = 0;
      playerPos.y = 880;
    }
    
    if((key == 'w' || key == 'W') && (playercoll || onFloor)){ //jumping with W
    jump = true;
    if(jump){
    velocity.y = -10;
    jump = false;
    key = 's';
    }
  }
   if((key == 'a' || key == 'A') && playerPos.x > 0){      //move to the left
     left = true;
     if(left){
    playerPos.x-=10;
    left = false;
    key = 's';
     }
  }
  if((key == 'd' || key == 'D') && playerPos.x < 1920){    //move to the right
    right = true;
    if(right){
    playerPos.x+=10;
    right = false;
    key = 's';
    }
  }
  if(key == 'd' && key == 'w'){
    jump = true;
    if(jump){
    velocity.y = -10;
    jump = false;
    right = true;}
    key = 's';
    if(right){
    playerPos.x+=10;
    right = false;
    key = 's';
       }
    } 
                                            //feet collisions wwith platforms.
    if(playercoll && (velocity.y > 0)){
      collided = true;
      if(collided){
      acceleration.y = 0;
      velocity.y = 0;
      collided = false;
      playercoll = false;
      }
    }
    
    if(headcoll && (velocity.y < 0)){       //head collision with platforms
      velocity.y *= -1;
    }
    
    if(!(playerPos.y >= 880) && !playercoll){ //player is affected by gravity unless you are on the ground or are standing on a platform
      acceleration.y = 0.2;
    }
     
  }
  
   public void run(){
    for(int i = 0; i < shots.size(); i++){ //moves, shows, and removes bullets.
      bullet l = shots.get(i);
      l.move();
      l.show();
        if(l.isGone() || l.isOut()){ //removes bullets that are off screen or out of range  (they don't disappear when you hit an enemy, so you can kill multiple with one shot if you are close enough)
          shots.remove(i);                                                                  //(also you can't kill yourself with your own bullets)
        }
    }
  }
  public void shoot(){ //adds new bullets to arraylist
    if(mousePressed && (shots.size() < 1)){                //limited to one for now.
      shots.add(new bullet(bulletplace, colour));
    }
  }
  
}
