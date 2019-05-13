//class for enemy objects

//Note: I couldn't think of a way to make the enemies shoot and keep the difficulty fair, so I just made them dummies that kill you on contact.

//plan: Enemies will be different colors on the HSB Spectrum and you change between them with some keyboard input. 
//defeat an enemy by being the winning color. blue beats red, red beats yellow, yellow beats blue. //start with rgb 

public class enemy{
  //fields
  ArrayList<bullet> bullets = new ArrayList<bullet>(); //arraylist of bullets which they will shoot at you and you back at them.
  public coord start;                                  //position
  
  coord velocity = new coord(0,0);                     //velocity
  public float eRange = 220;                           //range of their patrol. Since they don't fall off of platforms, they don't need acceleration
  public float stat;                                   //
  float vision = 500;                                  //how far they can see. Will probably be equal to bullet range.
  public float eColor;                                 //holds rgb value of enemy
  public float etype;                                  //decides color and movement of enemy
  boolean smacked = false;                             //checks if enemy has been hit by bullet
  
  //constructors
  public enemy(){}          //blank constructor
  
  public enemy(coord star){ //constructor that takes a coordinate value and assigns a direction based on type
  start = star;
  stat = start.x;
  etype = random(0, 3);
  if(etype >= 1.5){
      velocity.x = random(-3, -1);
    }
    if(etype < 1.5){
      velocity.x = random(1, 3);
    }
  }
  //methods
  
  void show(){                         //shows enemy with random color head.
  colorMode(RGB, 255, 255, 255);
  rectMode(CENTER);
  fill(0);
  strokeWeight(10);
  line(start.x, start.y, start.x, start.y + 100);           //torso
  line(start.x, start.y + 40, start.x - 30, start.y + 100); //left arm
  line(start.x, start.y + 40, start.x + 30, start.y + 100); //right arm
  line(start.x, start.y + 100, start.x - 30, start.y + 200);//left leg
  line(start.x, start.y + 100, start.x + 30, start.y + 200);//right leg
  strokeWeight(1);
  colorMode(HSB, 360, 100, 100);                                                     //color also based on type
  if(etype <= 1){                                          //red
  fill(0, 100, 100);
  eColor = 0;
  }
  if(etype > 1 && etype <=2){                              //green
  fill(120, 100, 100);
  eColor = 120;
  }
  if(etype > 2){
  fill(240, 100, 100); 
  eColor = 240;                                            //blue
  }
  ellipse(start.x, start.y, 50, 50);                       //head
  }
  
  void move(){   //move from side to side, patrolling the platform they are on
    start.x += velocity.x;
    start.y += velocity.y;
    
    if(start.x <= 0 || start.x >= 1920){
      velocity.x = 0;
    }
    if(start.y+200 >= 1080){
      velocity.y = 0;
      start.y = 880;
    }
    if(!(start.y+200 >= 1080)){
    }
    
    
    if(start.x > (stat + eRange) || start.x < (stat - eRange)){ //turns around at the edqe of the platform
      velocity.x *= -1;
    }
    
  }
  
  
}
