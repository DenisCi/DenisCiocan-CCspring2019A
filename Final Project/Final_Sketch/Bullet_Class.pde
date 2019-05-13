//class for bullets


class bullet{
  //fields
  public float hue;                                //color of bullet
  public coord pos;                                //position of bullet
  public coord bvelocity = new coord(0, 0);        //velocity of bullet
  public float radius = 20;                        //radius of bullets. I may change the shape of them to show the direction they move in
  public float range = 500;                        //range of bullets. They should disappear after they hit this boundary.
  public coord begin = new coord(playerPos.x, playerPos.y); //used to fix a bug
  public float distance;                           //distance between bullet and the bullet's starting point
  public coord placement = begin;                  //used to fix a bug. 
                                                   //moving the bullet used to make the character move with it, but adding these 2 coordinates seems to have fixed it.
  
  //constructors
  public bullet(){} //blank constructor
  
  public bullet(coord place, float x){ //takes a coordinate.
    pos = placement;
    pos.x = place.x;
    pos.y = place.y;
    if(mouseX <= playerPos.x){         //shoots left if your mouse is to the left of your character
       this.bvelocity.x = -10;
     }
     if(mouseX > playerPos.x){         //shoots right if your mouse is to the right of your character.
       this.bvelocity.x = 10;
     }
    hue = x;                           //sets hue equal to the input x value.
  }
  //methods
  public void show(){
    colorMode(HSB, 360, 100, 100);
     fill(hue, 100, 100);
     ellipse(pos.x, pos.y, radius, radius); //draws bullet
     distance = dist(playerPos.x, playerPos.y, pos.x, pos.y);
   }
  
  public void move(){                    //updates position
     pos.x += bvelocity.x;
     pos.y += bvelocity.y;
   }
  
  public boolean isOut(){        //used to determine if the bullet is outside its range
     return(distance >= range);
   }
   
   public boolean isGone(){      //used to tell if bullet is offscreen
     return(pos.x > 1920 || pos.x < 0 || pos.y > 1080 || pos.y < 0); 
   }
   
  
}
