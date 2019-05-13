//class for platforms

class platform{
  
  //fields
  public coord pos;      //position    //currently they are all specifically placed.
  float w = 50;          //width of platform
  float l = 500;         //length of platform
  
  //constructors
  public platform(){}    //blank constructor
  
  public platform(coord loc){ //constructor that takes location.
    pos = loc;
  }
  //methods
  
  void show(){                    //shows platform
    colorMode(RGB);
    fill(200, 0, 200);            //purple color
    rectMode(CENTER);
    rect(pos.x, pos.y, l, w);     //draws platforms
  }
  
  public boolean collission(){    //returns if the player has collided with a platform
    return(playerPos.x > (pos.x-250) && playerPos.x < (pos.x+250) && (playerPos.y + 200) > (pos.y-35) && (playerPos.y + 200 )< (pos.y+35));
  }
  
  public boolean ceiling(){      //returns true if player's head is colliding with the bottom of a platform.
    return(playerPos.x > (pos.x-250) && playerPos.x < (pos.x+250) && (playerPos.y) > (pos.y-35) && (playerPos.y) < (pos.y+35));
  }
  
}
