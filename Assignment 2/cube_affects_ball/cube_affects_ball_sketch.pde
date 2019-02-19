// Own sketch of object moving on canvas with some kind of user input
// lines drawn based on mouse input

int posX = 100;  //starting positions for ellipse
int posY = 100;
int speedX = 5;  //speeds of ellipse
int speedY = 5;

void setup(){
  size(1920, 1080);
}

void draw(){
background(210);
ellipse(posX, posY, 100, 100);  //moving ellipse that bounces on contact with borders
  posX += speedX;
  posY += speedY;
  
  if (posX <= 50 || posX >= width - 50){ 
   speedX *= -1; 
  }
  
  if (posY <= 50 || posY >= height - 50){
   speedY *= -1; 
  }
  
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 50);  //rectangle that emphasizes the position of the mouse. 
  if(posX == mouseX){            //causes ellipse to switch direction like a boundary, controlled by user
    speedX = speedX * -1;
    fill(random(255), random(255), random(255));
  }
  if(posY == mouseY){
    fill(random(255), random(255), random(255));  //fills changing are just to show that you have caused the ellipse to change direction
    speedY = speedY * -1;
  }
  
  
}
