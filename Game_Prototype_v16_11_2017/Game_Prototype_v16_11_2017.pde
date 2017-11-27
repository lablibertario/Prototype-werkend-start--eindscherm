Obstacles obstacle1 =new Obstacles();
Player player = new Player();
Enemy enemies = new Enemy();
Pu_exp exp = new Pu_exp();        
Pu_slow slow = new Pu_slow();
Pu_lives livespu = new Pu_lives();
Lives lives = new Lives();
StartScreen start = new StartScreen();
EndScreen end= new EndScreen();
Score score = new Score();
float punten;
int stage = 1;
int again;
float[] lanes = new float[6];

import processing.sound.*;
SoundFile music;

//Initialization of all classes
void setup() {
  size(800, 600);
  background(51);
  player.init();
  lives.init();
  obstacle1.init();
  enemies.init();
  exp.init();
  slow.init();
  livespu.init();
  end.init();

  lanes[0] = 0;
  lanes[1] = 100;
  lanes[2] = 200;
  lanes[3] = 300;
  lanes[4] = 400;
  lanes[5] = 500;
  //inladen van soundfile, bij tools moet je eerst de libarie voor sound downloaden voordat SoundFile werkt.
  music = new SoundFile(this, "skyrim.mp3");
  music.play();
}

//Updating all classes
void updateGame() {
  player.update();
  enemies.update();
  exp.update();
  slow.update();
  lives.update();
  livespu.update();
  start.update();
  end.update();
  score.update();

  if (player.posY < 0) {
    player.posY = 0;
  }
  if (player.posY > height-100) {
    player.posY = height-100;
  }
}

void keyPressed() {
  if (keyCode == UP) {
    player.move(-height/6);
  } else if (keyCode == DOWN) {
    player.move(height/6);
  } else if (keyCode == 'P') {
    // noLoop(); zorgt ervoor dat de loop/draw wordt stopgezet met loop() gaat de loop/draw weer verder me waar het was voor de noLoop()
    if (looping)
      noLoop();
  } else if (keyCode == 'R') {
    loop();
  } else if (keyCode =='E') {
    exit();
  } else if (keyCode =='M') { //stopt de muziek
    music.stop();
  }
}

void keyReleased() {
  player.move(0);
}


void drawGame() {
  background(51);
  player.draw();
  obstacle1.draw();
  enemies.draw();
  exp.draw();
  slow.draw();
  lives.draw();
  livespu.draw();
  score.draw();
  textAlign(RIGHT);
  textSize(25);
  text("P = Pause", 790, 52);
  text("R = Resume", 790, 79);
  text("E = Exit", 790, 106);
  text("M = Sound OFF", 790, 131);
}

void draw() {

  if (stage ==1) {
    //haalt de setup en draw uit StartScreen
    start.setup();
    start.draw();
    //zorgt er voor dat elkaar als game start je na game over eerst naar endscreen gaat
  }
  if (stage ==2) {
    drawGame();
    updateGame();
    keyPressed();
    keyReleased();
  }
  if ( stage ==3) {
    //haalt de setup en draw uit EndScreen
    end.setup();
    end.draw();
    //vanuit de return van end.init() gaat hij naar juiste scherm, op dit moment nog alleen reset van game (werkt nog niet altijd even goed) 
    if (again == 1) {
      score.reset();
      setup();
      stage =1;
      again = 3;
    }
  }
}