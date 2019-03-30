class Player {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int [] x;
  int [] y;
  int [] trail;
  //PVector [] trail;
  int num;
  float r;
  float rad;
  float xPos;
  float yPos;
  float col;

  Player (float r) {
    location = new PVector(0, height/2);
    velocity = new PVector(2.5, 2.5);
    acceleration = new PVector(0, 0);
    rad = r;
    r = 20;
    x = new int [20];
    y = new int [20];
    //trail = new PVector[20];
    num = 20;
    enemies = new ArrayList<Enemies>();

    col = 20;

    for (int i = 0; i < num; i++) {
      x[i] = 0;
      y[i] = 0;
    }
  }

  void displayScore() {
    //  fill(255);
    //  noStroke();
    //  ellipse(location.x, height/2, r*2, r*2);

    //Timeing score
    textSize(22);
    int score_t = millis();
    fill(255);
    text ("Score:", 600, 30);
    text(score_t, 670, 30);
    // println(score_t);
  }
  void moveP() {


    // velocity.add(acceleration);
    location.add(velocity);
    // velocity.limit(50);
    //  acceleration.mult(0);

    for (int i = num-1; i > 0; i--) {
      x[i] =  x[i-1];
      y[i] = y[i-1];
    }

    x[0] = 0;
    y[0] = mouseY;
    // trail[0] = velocity;
    for (int i = 0; i < num; i++) {
      //trail[i] = x[i]; 
      noStroke();

      fill(i*15, 80, 250);
      //   ellipse(trail[i]+i*5+12, y[i]+mouseY, 20, 20);
      float xPos = x[i]+i*(-5)+150;
      float yPos = y[i]+mouseY;
      ellipse(xPos, yPos, rad, rad);
    }
  }
}
