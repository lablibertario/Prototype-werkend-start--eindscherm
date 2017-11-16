public class Enemy{
  int numObstac = 2;
float posX [] = new float [numObstac];
float posY [] = new float [numObstac];
float velX;
int velY, punten,h,w;



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
  //De loop dat de enemies in een random lane terechtkomen
  for(int i = 0; i < numObstac; i++){
  posY[i] = lanes[(int) random(lanes.length)];
  posX[i] = random(800,width + 500);
  }

h = 100;
w = 50;
velX = -3;
}

void draw(){
  //Het aanmaken van alle enemies
  for(int i = 0; i < numObstac; i++){
    fill(0,255,0);
  rect(posX[i], posY[i],w,h);
  posX[i] += velX;
  
  //Als de enemy voorbij de speler gaat spawned hij weer in een random lane
  if (posX[i] <= 0) {
  posY[i] = lanes[(int) random(lanes.length)];
  posX[i] = width;
  }
  //Als de speler collide met de enemy, dan wordt de enemy weggehaald uit het scherm en verliest de speler een levenspunt.
  if (player.posX + player.w >= posX[i] && player.posY == posY[i]){
lives.aLives--;
posX[i] = width;
}
  }
//randomized de objectpositie bij ieder nieuw obstakel

}

void update(){

}

}