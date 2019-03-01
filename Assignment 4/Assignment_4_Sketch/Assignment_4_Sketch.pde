//Assignment 4. Sketch showing harmonic motion with use of transformations

float posX = 110;     // width and height aren't defined in size yet so I used the raw numbers. Position X of square
float posY = 1080/2;  // position y of square
float angle = 0;      // original angle
float squareColor;    // color of square
float speedX = 4;     // speed in X of the moving square
float angleStep = 3;  // change in angle

void setup(){         
  size(1920, 1080);
  noStroke();
  colorMode(HSB, 360, 100, 100);                  //for easy color changes later on
  rectMode(CENTER);                               // to make drawing and moving the suqare easier
}


void draw(){
  background((squareColor + 180) % 360, 100, 100);    //fills Background with color complementary to square Color (using HSB, so cyan is the complementary color for red)                      
  moveSquare();                                       //moves square
  squareColor = map(posX, 110, width - 110, 0, 360);  // makes sure colors are consistent with boundaries set in moveSquare
  fill(squareColor, 100, 100);                        //fills square with color based on how far along the screen it is.
}


void moveSquare(){                  // moves square along the screen, changing angle and color as it moves
 pushMatrix();                          //Push
  translate(posX, posY);                    //moves origin to posX and posY
  rotate(radians(angle));                   //rotates based on angle
  rect(0, 0, 200, 200);                     //draws square
  popMatrix();                          //Pop
  angle += angleStep;                       //increments angle
  posX += speedX;                           //increments posX
  if (posX >= width - 110 || posX <= 110){  //makes sure square stays visible on screen. Sets boundaries for movement
    speedX *= -1;                           //changes direction of movement
    angleStep *= -1;                        //changes direction of rotation
  }
}
