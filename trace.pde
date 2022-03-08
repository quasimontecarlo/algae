class trace {

  int x, y, nextX, nextY, rightLoc, leftLoc, upLoc, downLoc, lenght, loc, nextLoc;

  // canvas setup

  int ratio = 8;
  int margin = width / ratio;
  int canvasBegin = margin;
  int figureWidth = width - margin;
  int figureHeight = height - margin;

  // choice max
  int max = 100;
  int logicMin = 1;
  int logicMax = 9;
  int logicChooser = int(random(logicMin, logicMax));

  // setting up color variation variables

  int count = int(random(0, 5000));
  int maxLenght = int(random(10, 8000));

  float r,internalChoice;
  float seed = 123;
  float choice = int(random(seed));

  trace() {
    x = abs(int(random(canvasBegin, figureWidth)));
    y = abs(int(random(canvasBegin, figureHeight)));
    nextX = x;
    nextY = y;
  }
  void render() {
    println("CHOICE " + choice);
    println("count " + count);
    println("maxLength" + maxLenght);
    if ( variationSelect >= 500 && variationSelect <= 800 && frameCount >= count && lenght <= maxLenght ) {
      pixels[loc] = auxColor;
      lenght++;
    } else {
      pixels[loc] = mainColor;
      //pixels[loc-width-1] = mainColor;
      //pixels[loc-width+1] = mainColor;
      //pixels[loc+1] = mainColor;
      //pixels[loc-1] = mainColor;
    }
    updatePixels();
  }

  void step(color mainColor, color auxColor) {
    loadPixels();
    choose();
    // TO DO : CHOOSE YOUR LOGIC
    println("LOOOGIC " + logicChooser);

    if(logicChooser == logicMin){
       logic_01();
     } else if(logicChooser == 2){
       logic_02();
     } else if(logicChooser == 3){
       logic_03();
     } else if (logicChooser == 4){
       logic_04();
     } else if (logicChooser == 5) {
       logic_05();
     } else if (logicChooser == 6) {
       logic_06();
     } else if (logicChooser == 7) {
       logic_07();
     } else {
       logic_08();
     }
  }

  void bugAvoid() {
    if ( nextX<= canvasBegin && nextY <= canvasBegin ) {
      x = figureWidth;
      y = figureHeight;
    } else if ( nextX >= figureWidth && nextY >= figureHeight ) {
      x = canvasBegin;
      y = canvasBegin + 1;
    } else if ( nextX <= canvasBegin ) {
      x = figureWidth;
      nextX = figureWidth-1;
    } else if ( nextY <= canvasBegin ) {
      y = figureHeight;
      nextY = figureHeight-1;
    } else if ( nextX >= figureWidth ) {
      x = canvasBegin;
      nextX = canvasBegin + 1;
    } else if ( nextY >= figureHeight ) {
      y = canvasBegin;
      nextY = canvasBegin + 1;
    }
  }

  void conditional() {
    loc = abs(x+y*width);
    nextLoc = abs(nextX+nextY*width);
    rightLoc = abs(x+1+y*width);
    leftLoc = abs(x-1+y*width);
    upLoc = abs(x+y+1*width);
    downLoc = abs(x+y-1*width);
    bugAvoid();
    //println("this is my actual location " + loc);
    //println("this is my next location " + nextLoc);
    if (nextLoc < pixels.length-1 && nextLoc > pixels[0]) {
      //println("x " + x," y " + y," width " + figureWidth," loc " + loc);
      //println("this is pixels loc " + pixels[loc]);
      color nextColor = pixels[nextLoc];
      float nextRed = red(nextColor);
      //println("r " + nextRed, "g " + g, "b " + b);
      if (nextRed != red(auxColor) && nextRed != red(mainColor)) {
        render();
      }
    }
  }
  void choose() {
    if (random(1, 999999) % 2 < 0.05) {
      seed = map(random(123), 1, 123, 1, 100);
      choice = int(random(seed));
    }
  }

  //// VARIOUS LOGICS

  void logic_01() {
    if (choice >= 1 && choice <= max/4) {
      bugAvoid();
      x++;
      nextX = x+1;
      conditional();
    } else if (choice > max/4 && choice <= max/2) {
      bugAvoid();
      x--;
      nextX = x-1;
      conditional();
    } else if (choice > max/2 && choice <= max/1.32) {
      bugAvoid();
      y++;
      nextY = y+1;
      conditional();
    } else if (choice > max/1.32) {
      bugAvoid();
      y--;
      nextY = y-1;
      conditional();
    }
  }

  void logic_02() {
    if (choice >= 1 && choice <= max/4) {
      bugAvoid();
      x = x+2;
      nextX = x+2;
      conditional();
    } else if (choice > max/4 && choice <= max/2) {
      bugAvoid();
      x = x-2;
      nextX = x-2;
      conditional();
    } else if (choice > max/2 && choice <= max/1.32) {
      bugAvoid();
      y = y+2;
      nextY = y+2;
      conditional();
    } else if (choice > max/1.32) {
      bugAvoid();
      y = y-2;
      nextY = y-2;
      conditional();
    }
  }

  void logic_03() {
    if (choice >= 1 && choice <= max/8) {
      bugAvoid();
      x++;
      nextX = x+1;
      conditional();
    } else if (choice > max/8 && choice <= max/4) {
      bugAvoid();
      x--;
      nextX = x-1;
      conditional();
    } else if (choice > max/4 && choice <= max/2) {
      bugAvoid();
      y++;
      nextY = y+1;
      conditional();
    } else if (choice > max/2) {
      bugAvoid();
      y--;
      nextY = y-1;
      conditional();
    }
  }

  void logic_04() {
    if (choice >= 1 && choice <= max/8) {
      bugAvoid();
      x++;
      nextX = x+1;
      conditional();
    } else if (choice > max/8 && choice <= max/6) {
      bugAvoid();
      x--;
      nextX = x-1;
      conditional();
    } else if (choice > max/6 && choice <= max/1) {
      bugAvoid();
      y++;
      nextY = y+1;
      conditional();
    } else if (choice > max/1) {
      bugAvoid();
      y--;
      nextY = y-1;
      conditional();
    }
  }

  void logic_05() {
    if (choice >= 1 && choice <= max/2) {
      bugAvoid();
      x++;
      nextX = x+1;
      conditional();
    } else if (choice > max/2 && choice <= max/2.25) {
      bugAvoid();
      x--;
      nextX = x-1;
      conditional();
    } else if (choice > max/2.25 && choice <= max/2.5) {
      bugAvoid();
      y++;
      nextY = y+1;
      conditional();
    } else if (choice > max/2.5) {
      bugAvoid();
      y--;
      nextY = y-1;
      conditional();
    }
  }

  void logic_06() {
    if (choice >= 1 && choice <= max/10) {
      bugAvoid();
      x++;
      nextX = x+1;
      conditional();
    } else if (choice > max/10 && choice <= max/2) {
      bugAvoid();
      x--;
      nextX = x-1;
      conditional();
    } else if (choice > max/1.5 && choice <= max/1.25) {
      bugAvoid();
      y++;
      nextY = y+1;
      conditional();
    } else if (choice > max/1.25) {
      bugAvoid();
      y--;
      nextY = y-1;
      conditional();
    }
  }

  void logic_07() {
    int stepSize = int(random(0, 10));
    if (choice >= 1 && choice <= max/4) {
      bugAvoid();
      x = x + stepSize;
      nextX = x + 1 + stepSize;
      conditional();
    } else if (choice > max/4 && choice <= max/2) {
      bugAvoid();
      x = x - stepSize;
      nextX = x-1 - stepSize;
      conditional();
    } else if (choice > max/2 && choice <= max/1.32) {
      bugAvoid();
      y = y + stepSize;
      nextY = y + 1 + stepSize;
      conditional();
    } else if (choice > max/1.32) {
      bugAvoid();
      y = y - stepSize;
      nextY = y - 1 - stepSize;
      conditional();
    }
  }

  void logic_08() {
    int xSinValue = int(abs(2 * sin(x * HALF_PI)));
    int ySinValue = int(abs(2 * cos(y * HALF_PI)));
    println(" CHOICE IS BEFORE FACT " + choice );
    if (choice < random(0, 100)) {
      internalChoice = abs(choice * sin(choice + random(1, TWO_PI))) * random(1, seed);
      println(" BELOW 50 so we go in " + choice );
    } else {
      internalChoice = abs(choice * cos(choice + random(1, TWO_PI))) * random(1, seed);
      println(" it was bigger than 50 so " + choice );
    }
    if (internalChoice >= 1 && internalChoice <= max/4) {
      bugAvoid();
      x = x + 1 + xSinValue;
      nextX = x + 2 + xSinValue;
      conditional();
    } else if (internalChoice > max/4 && internalChoice <= max/2) {
      bugAvoid();
      x = x - 1 - xSinValue;
      nextX = x - 2 - xSinValue;
      conditional();
    } else if (internalChoice > max/2 && internalChoice <= max/1.32) {
      bugAvoid();
      y = y - 1 - ySinValue;
      nextY = y - 2 - ySinValue;
      conditional();
    } else if (internalChoice > max/1.32) {
      bugAvoid();
      y = y + 1 + ySinValue;
      nextY = y + 2 + ySinValue;
      conditional();
    }
  }
}
