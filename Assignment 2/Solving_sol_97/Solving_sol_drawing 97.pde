// Solving sol problem one of two.
//prompt: Wall Drawing #97 (1971)
//Within an 80 inch (200cm) square, 10,000 straight lines. Next to it is an 80 inch (200 cm) square with 10,000 not straight lines.

int numLines = 100;  //100 lines per side, not 10000 because that would be too much of a clutter. I could split the lines to make more lines, but it wouldn't look as good imo
int down = 0;  //y values of straight lines 
int down2 = 0; //y values of curved lines

void setup(){
size(1600, 800);        //scaled to two 800 by 800 squares next to each other
  background(230);
  noFill();
  stroke(0, 0, 255);  //blue bc it looks better than basic black
  int half = width / 2;  //divides sides
  for(int i = 0; i < numLines; i++){  //draws new line 8 pixels down, repeats to 100
    line(5, down, half, down); // lines stay straight
    down += 8;
  }
  stroke(255, 0, 0); //red to differentiate from the previous lines
  for(int n = 0; n < numLines; n++){  // draws new line every 8 pixels down, repeats to 100
    arc(half, down2, width-10, down2, 0, 1.56); //arc replaces line for "not straight lines"
    down2 += 8;
  }


}

void draw(){
  
}
