// New sketch for assignment 3                                //WARNING: WILL PROBABLY LAG

//inspired by today and tuesday's in class sketches and the sketch that Leire showed me. 
//I thought it was cool so I added the WASD control for the directions just like she did

int z = 0;                                      // used to change size of ball later on
float posX = 200;                               // initial starting positions and speeds of the ball
float posY = 200;
float speedX = 1;
float speedY = 1;                                                                           
float[] ballSize = {100, 75, 50, 25};           //array for different sizes for the ball
                                                                                            
void setup(){                                   //just the basics
  size(1920, 1080);
  background(0);
  noStroke(); 
}

void draw(){
float[] bound = {50, width - 50, height - 50};  //array for boundaries. 50 away from zero and the opposite edge is so that the ball stays fully in frame
  colorMode(HSB, 360, 100, 100);                //sawp colorMode so that I can repeat the in class scale from 0 to 360
  background(0);
  for(float i = 0; i < width; i++){             //repeat of the in class drawing but stretched to fit the whole screen
    stroke(map(i, 0, width, 0, 360), 100, 100);
    line(i, 0, i, height); 
  }
  noStroke();
  ellipse(posX, posY, ballSize[z], ballSize[z]);//ellipse
  posX += speedX;                               //moving
  posY += speedY;
  if(posX < bound[0] || posX > bound[1]){      
   speedX *= -1;
 }                                              //screen boundaries set
  if(posY < bound[0] || posY > bound[2]){
   speedY *= -1;
 } 
 
}
void keyPressed(){
  if(key == 'w'|| key == 'W'){                  //directional controls
    speedY -= 1;
  }
  if(key == 's'|| key == 'S'){
    speedY += 1;
  }
  if(key == 'a'|| key == 'A'){
    speedX -= 1;
  }
  if(key == 'd'|| key == 'D'){
    speedX += 1;
  }
  if(key == 'f'|| key == 'F'){
    speedX = 0;                                //you have to stand still to pay respects
    speedY = 0;
  }
  if(key == ' '){
    fill(random(360), 100, 100);               //space bar makes the ball change to a random color
  }
}

void mousePressed(){                           //changes size of ball when you press your mouse
  z++;
    if(z > 3){
      z = 0;
    }
}
