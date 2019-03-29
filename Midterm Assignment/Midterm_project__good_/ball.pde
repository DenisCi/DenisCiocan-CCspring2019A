
//ball class

class ball{
  
  //fields
  public coord place = new coord(0, 0); //position
  public coord fast = new coord(random(-2,2), random(1, 0)); //velocity
  public coord gravity = new coord(random(-.3,.3), random(-.3,.3)); //acceleration. called gravity for effect
  public float radius = random(10,40); //radius of balls
  public float rad = 100; //size of area in which they are caught. should be half of bw ball's radius
  public float life = 500; //lifespan of balls.
  public coord replace = new coord(0,0); //used for marker for points of acceleration
  public coord rep = new coord(-500, -500); //used for marker that remains after you click
  public float test = 0; //exists so that the balls go to the new value of rep, not the one listed above.
  
  //constructors
  public ball(){         //blank constructor
  }
  
  public ball(coord q){  //constructor that takes a coordinate
    this.place.x = q.x;
    this.place.y = q.y;
  }
  //methods
  
  void move(){           //moves ball
    fast.x += gravity.x; //again, gravity actually means acceleration here. sry for the confusion
    fast.y += gravity.y;
    place.x += fast.x;
    place.y += fast.y;
    life--;
    
    if( key == 'l' || key =='L'){ //clears balls from screen and stops production of more
      life = -1;
      run = false; 
    }
    
    if(mousePressed){             // makes your mouse a point of gravity (only when you hold down the mouse button, then stops acting on the acceleration)
       replace.x = mouseX;
       replace.y = mouseY;
       gravity.x = (replace.x - place.x) * 0.0005;
       gravity.y = (replace.y - place.y) * 0.0005;
       fill(0,50, 255);                             //blue for circle
       ellipse(replace.x, replace.y, 100, 100);     //blue circle inside b/w circle means you are affecting the acceleration of the balls. 
       fill(random(255), random(255), random(255)); //returns to random color so the rest of the balls aren't affected
       rep.x = pmouseX;                             //last x position where your mouse was clicked
       rep.y = pmouseY;                             //last y position where your mouse was clicked
       test = rep.x;
     }
     fill(0,50, 255);                      //blue for circle
     ellipse(rep.x, rep.y, 100, 100);      //blue circle left behind. (only affects balls on the screen when mouse was held down/clicked
                                           //after the last ball created in that time is removed, the blue marker disappears. (should be around 8 seconds)
                                      
       if(rep.x == test){                  //only allows marker to act once you have clicked, so that the balls don't gravitate towards the initial value of rep.
       gravity.x = (rep.x - place.x) * 0.0005;
       gravity.y = (rep.y - place.y) * 0.0005;
       }
     fill(random(255), random(255), random(255)); //back to random colors for small balls
  }
  
  
  void show(){                                            //shows ball
    fill(random(0, 255), random(0, 255), random(0, 255)); //alternating colors for every ball/ somewhat psychodelic effect
    ellipse(place.x, place.y, radius, radius);
    
    if(place.x > width || place.x < 0){ 
      fast.x *= -1;
    }                                                     //bounces balls off of screen walls
    if(place.y > height || place.y < 0){
      fast.y *= -1;
    }
  }
  
   boolean isCaught(){                                   //returns true if a ball is within the area of the bw ball.
     return(((mouseX - place.x) < rad && (mouseX - place.x) > -rad) && (mouseY - place.y) < rad && (mouseY - place.y) > -rad);
   }
   
   boolean isGone(){                                     //returns true if a ball's lifespan runs out.
     return(life < 0);
   }
   
   void egrav(){               //gives balls somewhat earthlike gravity. Intended as a way to clear balls off of the screen fast, but with a cool effect.
     if(key == 'g' || key == 'G'){
       gravity.y += .02;       //(technically changing acceleration is means there is a jerk, but it takes less time for all the balls to clear off the screen this way)
       
       fill(255, 0, 0);
       strokeWeight(20);
       stroke(255, 0, 0);
       line(width/2, height/4, width/2, height/4 - 80); //red arrow that shows that egrav() is active
       noStroke();
       triangle(width/2 - 40, height/4, width/2 + 40, height/4, width/2, height/4 + 80);
     } 
   }
      
}
