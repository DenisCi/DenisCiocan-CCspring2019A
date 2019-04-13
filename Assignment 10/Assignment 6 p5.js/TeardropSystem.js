//Teardrop Particle System
var tears = [];
//var c;
class crying{
//constructor and "fields"
constructor(cryX, cryY, tears){
this.cryX = posx + (radius/5);
this.cryY = posy - 500;
this.tears = tears;
}

//methods

showEyes(){ //draws eyes
    fill(255);
    strokeWeight(1);
    ellipse(posx-(radius/5), posy-500, radius/5, radius/5); //left eye
    ellipse(posx+(radius/5), posy-500, radius/5, radius/5); //right eye
}

cry(){  //cycles through tear objects, moves, shows, and deletes them.
for(let i = 0; i < tears.length; i++){
    let c = tears[i];
    c.show();  //shows tear
    c.fall();  //makes tear fall
    
    if(c.onGround()){
      tears.splice(i, 1); //removes tears that hit the ground
    } 
}
}

cryMore(){ //adds new tears to array
tears.push(new tear(posx + radius/5, posy-500, 1, 0.1));
}

}
