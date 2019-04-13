//teardrop class
let dropY = posy-500;
let dropX = posx + (radius/5);
let speedY = 1;
let accel = 0.1;
class tear{
//constructor (and "fields" in it)
constructor(dropX, dropY, speedY, accel){
//this.dropX = posx + radius/5;
//this.dropY = posy-500;
this.speedY = 1;
this.accel = 0.1;
}

//methods

fall(){ //makes tears fall
dropY += speedY;
speedY += accel;
//console.log(dropY);
}

show(){ //draws tears
    fill(100,100,255,200);
    noStroke();
    ellipse(dropX, dropY, random(radius/7, radius/5), random(radius/7, radius/5));
}

onGround(){ //checks if tears have hit the ground
if(dropY > 1080){
    return true;
}
else{return false;
}
}

}