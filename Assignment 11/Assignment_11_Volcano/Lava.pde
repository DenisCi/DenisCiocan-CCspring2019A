//class for debris: lava chunks, smoke, and rocks

 public class lava extends coord{
   //fields
   public coord pos = new coord(random(800, 1080), 430);             //starting positions of debris
   public float speedY = 1;                                          //change in y position
   public coord velocity = new coord(random(-5, 5), random(-14, -7));//velocity of each debris object
   public float radius = 40;                                         //radius of debris
   public float gravity = 0.2;                                       //acceleration due to gravity
   public float type = random(0, 2);                                 //to determine the kind of debris (by color) that is shown. <0.5 = lava, .5 - 1 = rock, 1-2 = smoke.
   public float smokeLife = 240;                                     //lifetime of smoke.
   
   //constructors
   public lava(){} //blank constructor
   
   public lava(coord pos){ //constructor that takes position coordinate
     this.pos.x = pos.x;
     this.pos.y = pos.y;
   }
   
   //methods
   
   //show
   public void show(){
     noStroke();
     if(type <= 0.5){            //lava
       fill(255, 130, 10);
     }
     if(type > 0.5 && type <=1){ //rock
       fill(60, 60, 60);
     }
     if(type > 1){               //smoke
       fill(100, 220);
     }
     ellipse(pos.x, pos.y, radius, radius); //draws debris
   }
   
   //move
   public void move(){                    //updates velocity, position, and smokelife.
     pos.x += velocity.x;
     pos.y += velocity.y;
     if(type <= 1){
     velocity.y += gravity;
     }
     if(type > 1){
       velocity.y = -4;                   //sets a constant vvelocity for the smoke
       velocity.x = (velocity.x/2) * 1.9; //makes smoke stack slightly more conical and narrower
     }
     smokeLife -= 1;
     
   }
   //isGone
   public boolean isGone(){
     return(pos.y > 1080 || smokeLife < 0); //to make sure smoke gets deleted and doesn't just keep moving up forever, also to remove debris that hits the "ground".
   }
   
 }
