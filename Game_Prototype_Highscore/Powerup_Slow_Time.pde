class Pu_slow{
int numObstac = 1;
float posX [] = new float [numObstac];
float posY [] = new float [numObstac];
int velX, velY, h,w;
int t = 0;

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
    fill(255,255,255);
  rect(posX[i], posY[i],w,h);
  posX[i] += velX;
  
  //Als de enemy voorbij de speler gaat spawned hij weer in een random lane
  if (posX[i] <0 ) {
  posY[i] = lanes[(int) random(lanes.length)];
  posX[i] = width;
  
  }
  //Als de speler collide met de boost, dan vertraagt de tijd
  if (player.posX + player.w == posX[i] && player.posX <= posX[i] + w && player.posY == posY[i]){
obstacle1.velX = -2.5;
enemies.velX = -1.5;
}
  }
  t++;
if(t > 300){
obstacle1.velX = -5;
enemies.velX = -2.5;
t=0;
}
}

void update(){

}





}