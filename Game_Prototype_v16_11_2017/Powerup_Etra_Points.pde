class Pu_exp{
  int numObstac = 1;
float posX [] = new float [numObstac];
float posY [] = new float [numObstac];
int velX, velY, h,w;

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
  //De loop dat de boost in een random lane terechtkomen
  for(int i = 0; i < numObstac; i++){
  posY[i] = lanes[(int) random(lanes.length)];
  posX[i] = random(100,width);
  }

h = 20;
w = 20;
velX = -5;
}

void draw(){
  //Het aanmaken van alle enemies
  for(int i = 0; i < numObstac; i++){
    fill(0,255,255);
  rect(posX[i], posY[i],w,h);
  posX[i] += velX;
  
  //Als de enemy voorbij de speler gaat spawned hij weer in een random lane
  if (posX[i] < 0) {
  posY[i] = lanes[(int) random(lanes.length)];
  posX[i] = width;
  }
  //Als de speler collide met de boost, dan krijgt hij 250 punten
  if (player.posX + player.w == posX[i] && player.posX <= posX[i] + w && player.posY == posY[i]){
obstacle1.punten += 250;
posX[i] = width;

}
  }


}

void update(){

}

}