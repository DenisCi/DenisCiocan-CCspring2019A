                              // This is Assignment 1. Recreating a painting found online through processing.
                              
void setup(){
  size(600, 750);               //size of screen is approximately the size and dimensions of artwork as it shows up on my laptop
  background(205, 205, 210);    //light gray bg color
  rectMode(CENTER);
  fill(40);                     
  rect(290, 375, 520, 670);     //Black rectangle
  
  fill(130, 132, 140);
  quad(100, 100, 440, 100, 480, 650, 100, 650);  //dark quad inside black rectangle. Could not make it look stoney like the painting.
  
  strokeWeight(10);
  stroke(205, 205, 210);         //lines are the same color as the bg
  strokeCap(SQUARE);             
  line(100, 100, 480, 100);      //top line
  line(100, 650, 480, 650);      //bottom line
  line(100, 95, 100, 655);       //middle line
  
  stroke(120,0,0);
  strokeWeight(3);
  line(480, 645,440, 105);       //redish brownish lines along the side of the quad
  strokeWeight(4);
  line(439, 105, 480, 105);
  
  strokeWeight(0);
  stroke(150, 130, 50);
  fill(150, 130, 50);                             //yellowish internal ellipse
  ellipse(300, 360, 180, 270);
  
  fill(220);
  stroke(40);
  strokeWeight(40);                              // black ellipse for lines inside other ellipses
  ellipse(300, 360, 60, 240);
  
  noFill();
  strokeWeight(40);
  stroke(220);                                     //white outline ellipse that is see through.
  ellipse(300, 360, 220, 310);
  
  stroke(160, 20, 0);
  fill(160, 20, 0);
  strokeWeight(0);
  triangle(300, 345, 308, 365, 290, 365);         //red triangle in middle
  
}
void draw(){  
}
