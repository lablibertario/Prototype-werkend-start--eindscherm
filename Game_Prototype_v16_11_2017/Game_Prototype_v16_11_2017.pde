// Updates Prototype:
// Ik heb in de main de classes Lives en Powerup_Lives toegevoegd aan de setup, update en draw
// Ik heb de class Lives en Powerup_Lives aangemaakt
// Ik heb in de classes Enemy en Obstacles interacties op de levenspunten toegevoegd (wat er gebeurt als de player een object aanraakt)
// Ik heb in Game_Prototype draw() ingericht in stages en heb de classes StartScreen en EndScreen aangemaakt (siebe)
// Ik heb in de class Lives de exit vervangen voor stage=3 zodat bij game over naar Endscreen gaat
Obstacles obstacle1 =new Obstacles();
Player player = new Player();
Enemy enemies = new Enemy();
Pu_exp exp = new Pu_exp();
Pu_slow slow = new Pu_slow();
Pu_lives livespu = new Pu_lives();
Lives lives = new Lives();
StartScreen start = new StartScreen();
EndScreen end= new EndScreen();

int stage = 1;
int again;

//Initialization of all classes
void setup(){
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

}

//Updating all classes
void updateGame(){
player.update();
enemies.update();
exp.update();
slow.update();
lives.update();
livespu.update();

if (player.posY < 0){
player.posY = 0;
}
if (player.posY > height-100){
player.posY = height-100;
}

}

void keyPressed(){
if (keyCode == UP) {
player.move(-height/6);
}
if(keyCode == DOWN) {
player.move(height/6);
}}

void keyReleased(){
player.move(0);
}


void drawGame(){
background(51);
player.draw();
obstacle1.draw();
enemies.draw();
exp.draw();
slow.draw();
lives.draw();
livespu.draw();
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
    if (again == 1){
      setup();
      stage =1;
      again = 2;
    }
  }
}