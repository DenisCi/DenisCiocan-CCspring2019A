//ball system class.

class ballSystem{
  
  //fields
  ArrayList<ball> balls = new ArrayList<ball>();
  coord start = new coord(0,0);
  
  //constructors
  public ballSystem(){        //blank constructor
  }
  
  public ballSystem(coord s){ //sets origin of ballsystem to a coordinate
    start.x = s.x;  
    start.y = s.y;
  }
  
  //methods
  public void roll(){          //cycles through balls, shows them, moves them, and removes them when they are caught
    for(int i = 0; i < balls.size(); i++){
      ball b = balls.get(i);
      b.show();                //shows ball
      b.move();                //moves ball (also holds method by which your mouse clicks can affect the acceleration)
      b.egrav();               //gives ball earth gravity (they fall)
      
      if(b.isCaught() || b.isGone()){
        balls.remove(i);       //removes caught or dead ball
      }
    }
  }

  public void addBall(){      //adds ball
    if (balls.size() <= 500){ //adds ball only if total balls are below 500. too many might cause lag. also poor eyesight.
  balls.add(new ball(start));
    }
  }

}
