//Assignment 13 sketch including outside images or sounds.

//Summary: Snoop Dog comes from the left, hits a blunt, and leaves to the right
//inspired by the ridiculous youtube video edits of Snoop. A very simple sketch, but I still like it.

import processing.sound.*; //so I can use sound
                      //initializing images
PImage dankGlasses;
PImage snoop;
PImage blunt;
float posX = -300;    //initial X position of snoop as he prepares to smoke
float posY = 600;     //y position of snoop
float bluntPos = 360;

SoundFile Song;       //initiating soundfile

void setup(){         //basics
  size(1920, 1080); 
  background(100);
  
  //idk if i have to use a disclaimer since I'm using it for educational purposes but I will just to be safe.
  Song = new SoundFile(this, "NextEpisode.wav"); //Disclaimer: I don't own this song. I just cut 30 seconds of the clean version to use for this hw.
  //All rights to the song & any money made from this snippet of sound go to Snoop
  
  //loading images
  snoop = loadImage("SnoopDogg.png"); //image of snoop
  dankGlasses = loadImage("dankSunglasses.png"); //the classic pixelated dank sunglasses
  blunt = loadImage("Blunt.png");       //the blunt he will hit
  imageMode(CENTER);
}

void draw(){
  background(100);
  
  tint(150, map(posX, 400, width, 150, 255), 150); //he gets greener as he moves to the right
  image(snoop, posX, posY, 1000, 1000);            //actually drawing the image of snoop
  noTint();                                        //removing tint
  image(dankGlasses, posX-80, 200, 160, 90);       //drawing sunglasses
  
  posX+=3;                                         //moving snoop and sunglasses
  
  image(blunt, bluntPos, 260, 80, 20);             //draw blunt
  
  if(bluntPos < posX-30){                          //sets blunt to stay with snoop once he hits it.
    bluntPos = posX-30;
  }
  
  if(posX > 400 && !Song.isPlaying()){             //plays song when he hits the blunt.
   Song.play(); 
  }
   //note he doesn't turn around, I didn't make a boundary as that wouldn't fit with the idea of him hitting the blunt and just walking away
}
