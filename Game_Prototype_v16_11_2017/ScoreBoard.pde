class ScoreBoard {
  String[] highScore = new String[5];
  String scoreList;

  void init() {
    highScore = loadStrings("highScore.txt");
    if (again == 3) {
      again = 3;
    }
  }

  void draw() {

    background(3, 236, 255);
    text("Highscore: ", width/2, 60);
    for (int i = 0; i < highScore.length; i++)
    {
      textAlign(CENTER);
      text(round(parseFloat(highScore[i])), width/2, 80 + 25*i);
    }
  }

  void highScore() {
    if (highScore.length<5)
    {
      highScore=append(highScore, str(punten)); //append vergroot een array en voegt nieuwe data toe//
    } else {
      if (parseInt(highScore[highScore.length-1])<punten) 
      {
        highScore[highScore.length-1]=str(punten);
        for (int i=highScore.length-1; i>0; i--)
        {
          if (parseInt(highScore[i])>parseInt(highScore[i-1]))
          {
            String setScoreLower=highScore[i-1];
            highScore[i-1]=highScore[i];
            highScore[i]=setScoreLower;
          }
        }
      }
      scoreList="";
      for (int i = 0; i < highScore.length; i++)
      {
        scoreList+=highScore[i]+" ";
      }
      saveStrings("highScore.txt", highScore);
    }
  }
}