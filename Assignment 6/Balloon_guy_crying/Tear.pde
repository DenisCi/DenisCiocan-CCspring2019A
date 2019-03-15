//class for tear objects

 class tear{
  //fields
  
  public float dropX; //x position of tear
  public float dropY; //y position of tear
  public float speedY = 1; //speed of tear falling
  public float accel = 0.1; //acceleration of tear
  
  //constructors
  public tear(){ //blank constructor
  }
  public tear(float x, float y){  //constructor that takes position x,y  *needs some debugging. will iterate at a later date to make it work flawlessly*
    dropX = x;
    dropY = y;
    dropX = posx - radius/5;
    dropY = posy-500;;
  }
  
  //methods
  
  public void fall(){      //makes tears fall
    dropY += speedY;
    speedY+= accel;
  }
  
  public void show(){     //draws tears
    fill(100,100,255,200);
    noStroke();
    ellipse(dropX, dropY, random(radius/7, radius/5), random(radius/7, radius/5));  //radius  of tearchanges to more easily show the flow of tears
  }
  
  public boolean onGround(){  //checks if tears have hit the ground.
      return(dropY > height);
  }
  
}
