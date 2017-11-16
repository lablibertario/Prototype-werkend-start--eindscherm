//class zorgt ervoor dat je bij game over een endscreen hebt met mogelijke meer keuzes
//op dit moment alleen keuze voor terug naar startscreen.

//Update:

class EndScreen {
  //declareert startscreen als afbeelding 
  PImage startScreen;
  //declareert title als een font
  PFont gameOver;
  PFont endText; 
  
  void setup() {
    //laad de afbeelding in het mapje met met naam startScreen.jpg
    startScreen = loadImage("startScreen.jpg");
    //geeft de grote aan de eerste 2 nullen weet ik niet precies wat is ik denk draai, de achterste 2 zijn de verhoudingen
    image(startScreen, 0, 0, 800, 600);
    //koppelt de juiste font aan de juiste PFont (via tools>lettertype maken, kan je een .vlw bestand maken met een font en grote)
    gameOver = loadFont("gameOverFont.vlw");
    endText = loadFont("endTextFont.vlw");
    }
  
  void init() {
    //return vallue zodat er in Game_prototype gereset kan worden, of later naar andere schermen)
    if (again == 1){
      again = 1;
      }
  }


  void draw() {
    textAlign(CENTER);
    fill(255,3,3);
    textFont(gameOver);
    text("Game Over",400, 225);
    textFont(endText);
    text("TRY AGAIN PRESS LEFT", 200, 250);
    text("EXIT PRESS RIGHT", 600, 250);
    //keycode left zorgt ervoor dat je terug gaat naar stage 1 uiteindelijk
    if (keyCode == LEFT) {      
      again = 1; //gaat terug naar startscherm
    } else if (keyCode == RIGHT){
      exit(); // 
    }
  }
}