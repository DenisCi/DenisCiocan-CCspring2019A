//assignment 11
//physical/natural phenomenon
//I made a volcano. It looks pretty cool. Inspired by a Youtube video I was watching on volcanoes.

//global variables:
volcano boom = new volcano();
public boolean crater = false;
public boolean pompeii = false; //reference to the ancient destruction of
//on that note I should have named the volcano object "Vesuvius"

void setup(){
  size(1920, 1080);
  background(120, 120, 250); //sky
}


void draw(){
  background(120, 120, 250); //sky
  boom.place = new coord(960, 430);
  boom.run();
    if(pompeii == true){
      boom.erupt();
    }
  landScape(); 
    if(crater == true){
    boom.see();
    }
}

void landScape(){ //draws bg and volcano

  //sky
  noStroke();                      //no outline
  fill(255, 235);                  //white
  ellipse(500, 50, 300, 100);      //clouds
  ellipse(600, 50, 200, 100);
  ellipse(1500, 150, 400, 150);
  ellipse(100, 100, 200, 100);
  ellipse(1550, 100, 300, 100);
  ellipse(750, 150, 100, 50);
  ellipse(1750, 50, 100, 40);
  ellipse(150, 150, 200, 80);
  ellipse(1050, 0, 500, 100);
  ellipse(1850, 0, 300, 150);
  ellipse(850, 160, 200, 100);
  ellipse(100, 0, 200, 50);
  
  //land
  rectMode(CENTER);
  noStroke();                
  fill(160, 130, 60);                     //dirt color
  rect(width/2, height, width, height/2); //dirt drawn
  
  //volcano
  fill(80, 70, 70);     //dark rocky exterior
  beginShape();
  vertex(620, 810);
  vertex(920, 400);    //actual shape of it
  vertex(1000, 400);
  vertex(1300, 810);
  endShape();
}

void keyPressed(){
  if(key == ' '){
    pompeii = true;  //sets pompeii to true, starts eruption
    crater = true;   //shows eruption crater (cannot be undone once it is there, that would be unrealistic)
  }
  if(key == 'f' || key == 'F'){
    pompeii = false; //sets pompeii to false, stops eruption
  }
}
