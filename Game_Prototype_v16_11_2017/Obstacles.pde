public class Obstacles{
  int numObstac = 6;
float posX [] = new float [numObstac];
float posY [] = new float [numObstac];
float h,w;
float randomLane;
int direction;
float velX, velY;
//color clr [] = new color [numObstac];
int punten = 0;

//array voor het lanesysteem
float[] lanes = new float[6]; {
lanes[0] = 0;
lanes[1] = 100;
lanes[2] = 200;
lanes[3] = 300;
lanes[4] = 400;
lanes[5] = 500;

}
void init(){
  for(int i = 0; i < numObstac; i++){
  posY[i] = lanes[(int) random(lanes.length)];
  posX[i] = random(800,width + 500);
 // clr[i] = color(random(255), random(255), random (255));
  }

h = 100;
w = 50;
velX = -5;
}

void draw(){

  for(int i = 0; i < numObstac; i++){
  //fill (clr[i]);
  fill(0,0,255);
  rect(posX[i], posY[i],w,h);
  posX[i] += velX;
  
  if (posX[i] <= 0) {
  posY[i] = lanes[(int) random(lanes.length)];
  posX[i] = width;
  punten ++;
  }
//Als de speler een obstakel raakt, verliest hij een levenspunt en verdwijnt het obstakel van het scherm.
  if (player.posX + player.w >= posX[i] && player.posY == posY[i]){
lives.aLives--;
posX[i] = width;
}
  }
//randomized de objectpositie bij ieder nieuw obstakel
fill(255,0,0);
  textSize(20);
text(punten,750, 25);

}

void update(){

}

}