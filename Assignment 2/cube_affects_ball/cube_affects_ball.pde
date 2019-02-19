// Own sketch of object moving on canvas with some kind of user input
// lines drawn based on mouse input

int posX = 100;
int posY = 100;
int speedX = 5;
int speedY = 5;

void setup(){
  size(1920, 1080);
}

void draw(){
background(210);
ellipse(posX, posY, 100, 100);
  posX += speedX;
  posY += speedY;
  
  if (posX <= 50 || posX >= width - 50){
   speedX *= -1; 
  }
  
  if (posY <= 50 || posY >= height - 50){
   speedY *= -1; 
  }
  
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 50);
  if(posX == mouseX){
    speedX = speedX * -1;
    fill(random(255), random(255), random(255));
  }
  if(posY == mouseY){
    fill(random(255), random(255), random(255));
    speedY = speedY * -1;
  }
  
  
}
