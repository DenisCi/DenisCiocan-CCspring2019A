//Midterm Project

// WHAT IT IS: moving ball on your mouse that becomes black or white based on where it is and
// catches moving colorful balls that are released by a red ball that is controlled by the WASD keys.                   (also what I wish was MY screensaver)

//Background: Inspired by the gravity based particle system from class and my friend Brandon's screensaver.

//demo time

//Notable moments in development: I came up with 3 different ideas. the first 2 failed miserably. This one worked.
//NEW* I couldn't implement the marker for a point of gravity. I got around this by using pmouseX and pmouseY, as explained to me by our lord and savior Dan Shiffman.


//conclusion:
//bugs: balls stop releasing when any key is pressed. (fixed through boolean: run)

//things to implement: 
//messing with gravity through inputs (implemented. press g. To stop, press any other accepted input), 
//points of gravity (implemented. press the mouse button to attract balls toward mouse. when you let go, they will accelerate to the last place you clicked your mouse)
//game elements or other cool ideas (not yet. maybe at some point in the future)


/* Instructions and shortcuts: 

WASD = movement of red ball
[SPACE BAR] = start making balls.
C = stop motion of red ball
V = stop production of balls
F = C + V & moves red ball back to its initial position.
L = removes all balls from screen & stops production of balls.

L + F = basically a hard reset. (clicked consecutively, not at the same time.)
F + G = also basically a hard reset, but the balls sink below the screen then die instead of just being instantly erased
Click Mouse = create a point of gravity.
*/


coord pos = new coord(200,200); //original starting position for red ball
coord speed = new coord(0,0);   //speed of red ball
float radius = 200;             //radius of mouse ball
ballSystem bruh = new ballSystem();  //ball system      (couldn't come up with a good name)
boolean run = false;            //checks if run is true. if it is, balls are created.

 
void setup(){                   //the basics
  size(1920, 1080);
  background(255);
  noStroke();
  
}

void draw(){
    background(255);            //white bg
    fill(0);
    rect(0,0, width/2, height); //black rectangle replaces bg on left side
    
    if(mouseX < width/2){       //makes the fill color white on the left side
      fill(255);
    }
    if(mouseX > width/2){       //and black on the right
      fill(0);
    }
    ellipse(mouseX, mouseY, radius, radius);
    bruh.start = new coord(pos.x, pos.y); //sets position of the ball system
    bruh.roll();                          //shows, moves, and removes balls
    if(run){
      bruh.addBall();                     //starts adding balls (when space is pressed, as space changes the state of the boolean: run)
    }
    
    
    fill(255,0,0);
    ellipse(pos.x, pos.y, 100, 100);    //red ball. basically the emitter but outside the class. (I made this before making the class ball system class)
    
    pos.x += speed.x; 
    pos.y += speed.y;
    if(pos.x > width-50 || pos.x < 50){ //bounces on edges of screen
    speed.x *= -1;
  }
  if(pos.y > height-50 || pos.y < 50){
    speed.y *= -1;
  }
  
} 

void keyPressed(){               //controlls.     (L, G, and Click are in the move method in the ball class)
  if (key == 'd' || key == 'D'){ //increase speed to the right
    speed.x+=1;
  }
  if (key == 'a'|| key == 'A'){ //increase speed to the left
    speed.x-=1; 
  }
  if (key == 'w'|| key == 'W'){ //increase speed up
    speed.y-=1;
  }
  if (key == 's'|| key == 'S'){ //increase speed down
    speed.y+=1;
  }
  if (key == 'f'|| key == 'F'){ //stops motion of red ball and creation of balls. sets red ball back at initial position
    speed.x = 0;
    speed.y = 0;
    run = false;
    pos.x = 200;
    pos.y = 200;
  }
  if(key == ' '){               //starts creation of balls by setting run to true
    run = true;
  }
  if(key == 'v' || key == 'V'){ //stops only creation of balls, not motion of red ball
    run = false;
  }
  if (key == 'c'|| key == 'C'){ //stops only motion of red ball, not creation of balls
    speed.y = 0;
    speed.x = 0;
  }
 
}
