//class for volcano

public class volcano{ //bc lava comes out of a volcano
  //fields
  ArrayList<lava> debris = new ArrayList<lava>();
  public coord place = new coord(960, 700);
  //constructors
  public volcano(){} //blank constructor
  
  public volcano(coord p){
    p.x = place.x;
    p.y = place.y;
  }
  
  //methods
  
  //run
  public void run(){
    for(int i = 0; i < debris.size(); i++){
      lava l = debris.get(i);
      l.move();
      l.show();
        if(l.isGone()){
          debris.remove(i);
        }
    }
  }
  
  //erupt
  public void erupt(){ //adds new debris to arraylist
    if(debris.size() < 500 && pompeii == true){
      debris.add(new lava(place));
    }
  }
  public void see(){
    fill(255, 100, 0);
    triangle(920, 400, 1000, 400, 960, 430);
  }
  
}
