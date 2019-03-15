//Assignment 6: Own particle system. Balloon guy crying.

float radius = 200;  //radius of head
float step = 0;  //for inflation
float posx = 960;  //initial xpos of guy drawing
float posy = 800;  //starting ypos of guy drawing
float speedx = 0;  //for moving guy on screen
crying rightTear = new crying(posx + (radius/5), posy-500); //new particle system

void setup(){       //the basics
  size(1920, 1080);
  background(220);
  
}

void draw(){
  background(220);  //white bg
  
  drawGuy(posx, posy, radius, 20);  //guy 1, the thinner guy from last week. He's sad that his bro isn't here for this assignment
  inflateHead(); //inflate or deflate head with w&s
  moveGuy();     //move guy left and right with a&d
  rightTear.cry();  //makes guy cry

  if(mousePressed){
    rightTear.cryMore();  //adds new tears when you click the mouse

  }
  rightTear.showEyes();  //shows eyes.
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

void inflateHead(){ //inflate / deflate head
   radius += step;  
   
  if (radius >= 500){   // upper limit on head size
   radius =  500;
   step = 0;
  }
  if (radius <= 50){  // lower limit on head size
    radius = 50;
    step = 0;
  }
}

void moveGuy(){  //moves guys left to right. uses user input from below
  posx += speedx;  
  
  if (posx <= 250){  //limits movement to the left
   posx = 250;
   speedx = 0;
  }
  if (posx >= 1670){  //limits movement to the right
   posx = 1670;
   speedx = 0;
  }
}

void keyPressed(){ 
if (key == 'w'){  //adds to step. inflates faster/ slows deflation
    step += 0.5;
  }
  if (key == 's'){  //subtracts from step. inflates slower/deflates
    step -= 0.5;
  }
  if (key == 'd'){  //increase speed to the right
    speedx += 1;
  }
  if (key == 'a'){  //increase speed to the left
    speedx -= 1;
  }
}
