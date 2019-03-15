//particle system that holds tear objects

class crying{
  
  //fields
  ArrayList<tear> tears = new ArrayList<tear>();
  public float cryX; //x position for where tears start
  public float cryY; //y position for where tears start
  
  //constructors
  //blank constructor
  public crying(){
  }
  
  //constructor that takes places the particle system at x,y
  public crying(float x, float y){
    cryX = x;
    cryY = y;
  }
  
  //methods
  public void showEyes(){ //shows eyes
  fill(255);
  strokeWeight(1);
  ellipse(posx-(radius/5), posy-500, radius/5, radius/5); //left eye
  ellipse(posx+(radius/5), posy-500, radius/5, radius/5); //right eye
  }
  
  public void cry(){  //cycles through each drop, uses methods from tear to draw and animate balloon guy crying
    for(int i = 0; i < tears.size(); i++){
      tear c = tears.get(i);
      c.show();  //shows tear
      c.fall();  //makes tear fall
      
      if(c.onGround()){
        tears.remove(c); //removes tears that hit the ground
      }
    }
  }
  
  public void cryMore(){  //adds more tears
    tears.add(new tear(cryX, cryY ));
  }
  
}
