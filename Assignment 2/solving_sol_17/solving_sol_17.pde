//Solving sol prompt 2 of 2
//Wall Drawing #17 (1969)
//Four-part drawing with a different line direction in each part.

// my drawing is inspired by the solution for wall drawing 391 on the solving sol website

void setup(){
  size(1920,1080);
  int numlines = 10;
  int qx = width/40;          //starting x coordinate for lines on the left
  int qy = height/40;         //starting y coordinate for lines on the left
  int qx2 = (width/2) + qx;   //starting x coordinate for lines on right
  int qy2 = (height/2) + qy;  //starting y coordinate for lines on right
  
  background(0);              //black bg
  noFill(); 
  stroke(240);                //white lines
  strokeWeight(10);
  for(int i = 0; i < numlines; i++){ //first quadrant, horizontal lines
    line(0, qy, width/2, qy);
    qy += height/20 ;
  }
  qy = height/40;  //reset qy
  
  for(int i = 0; i < numlines; i++){ //second quadrant, vertical lines
    line(qx, height/2, qx, height);
    qx += width/20;
  }
  qx = width/40;  //reset qx
  
  for(int i = 0; i < numlines; i++){  //third quadrant. diagonal lines
     line(width/2, qy2, qx2, height/2);
    qx2 += width/10;
    qy2 += height/10;
  } 
  qx2 = (width/2) + qx;  //reset qx2
  qy2 = (height/2) - qy;  // sets up qy2 to work for 4th quadrant
  
  for(int i = 0; i < numlines; i++){  //fourth quadrant, diagonal lines in opposite orientation to lines in quadrant 3
     line(width/2, qy2, qx2, height/2);
     qx2 += width/10;
     qy2 -= height/10;
  }

  strokeWeight(15);
  stroke(200, 0, 0); //red dividers between quadrants, to clearly show 4 parts.
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
}

void draw(){
}
