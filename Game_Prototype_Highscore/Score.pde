//Zorgt er op dit moment alleen voor dat punten opscherm komen

class Score {
  Pu_exp exp = new Pu_exp();
  void setup() {
    for (int i=0; i<highScore.length; i++) {
      highScore[i] = 1000;
    }
  }

  void draw() {
    if (stage==2) {

      //Dit laat de punten op het scherm zien
      fill(255, 0, 0);
      textSize(20);
      //laat de punten afgerond zien op het scherm

      text(round(punten), 750, 25);
      //inplaats van dat je punten krijgt voor elke vijand die voorbij komt krijg je nu 0.1 punt per frame
      punten = punten + 0.1;
    } else if (stage==4) {
      scoreBoard(punten);
      background(0, 250, 0);
      text("Highscore: ", 50, 60);
      for (int i = 0; i<highScore.length; i++) {
        text(round(highScore[i]), 50, 120+60*i);
      }
      if (keyCode =='M') {
        again = 3;
      }
    }
  }

  void scoreBoard(float punten) {
    for (int i=0; i<highScore.length; i++) {
      if (punten>=highScore[i]) {
        for (int j=highScore.length-1; j<=max(i, 1); j--) {
          highScore[j]=highScore[j-1];
        }
        highScore[i] = punten;
        break;
      }
    }
  }

  void reset() {
    punten = 0;
  }

  void update() {
  }
}