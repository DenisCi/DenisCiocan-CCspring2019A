//Assignment 6: Balloon guy crying translated to p5.js

var radius = 200;  //radius of head
var step = 0;    //for inflation
var posx = 960;  //initial xpos of guy drawing
var posy = 800;  //starting ypos of guy drawing
var speedx = 0;  //for moving guy on screen
var w = 1280;
var h = 720;
var rightTear;

function setup(){
createCanvas(w, h);
background(220);

}

function draw(){
background(220)
scale(0.66)
//drop = new tear(posx + (radius/5),posy-500, 1, 0.1); use as example
rightTear = new crying(posx + (radius/5), posy-500, tears);
drawGuy(posx, posy, radius, 20);
inflateHead();
limitGuy();
//rightTear.cryMore();
rightTear.cry();

rightTear.showEyes();
//drop.fall();
//drop.show();

}

function drawGuy(posx, posy, headsize, weight){  //draws guy
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

function inflateHead(){ //inflate / deflate head
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

 function limitGuy(){  //limits guy's movement left to right uses user input from below
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

  function keyPressed(){ 
    if (key === 'w'){  //adds to step. inflates faster/ slows deflation
        step += 0.5;
      }
      if (key === 's'){  //subtracts from step. inflates slower/deflates
        step -= 0.5;
      }
      if (key === 'd'){  //increase speed to the right
        speedx += 1;
      }
      if (key === 'a'){  //increase speed to the left
        speedx -= 1;
      }
      if(key === 'c'){ //adds new tears to the array
        rightTear.cryMore();
      }
    }

//P.S There is definitely an issue somewhere in the code, probably in the Tears class,
//that causes new tears not to be added to the array, or be added in the wrong place.
// I'm also 2 days late with the assignment so I'm expecting a low grade. 
//(partial credit is still better than no credit)
//But I'll get the remaining assignments in on time to try to make up for it.