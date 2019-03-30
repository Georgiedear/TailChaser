//TAILCHASERS BY GEORGINA YEBOAH

//REFERENCES:
//GRADIENT REFERENCE FROM PROCESSING AND LATER SORTED IN A CLASS BY YOURS TRULY: https://processing.org/examples/lineargradient.html
//ELLIPSE ARRAY TAIL REFERENCE: https://forum.processing.org/beta/num_1264911247.html




//CLASSES
Gradient grad;
Player [] player = new Player[20];
//Enemies [] enemies = new Enemies[100]; 
ArrayList<Enemies> enemies;

int frame = 0;

void setup() {
  size(800, 250);

  //INSTANTIATE GRADIENT OBJECT
  grad = new Gradient(0, 0, width, height, color(0, 255, 210), color(255, 193, 244), 1);
  //INSTANTIATE PLAYER OBJECT
  for (int i = 0; i < player.length; i++) {
    player[i] = new Player(20);
  }

  enemies = new ArrayList<Enemies>();

  //INSTANTIATE ENEMY OBJECT 
  //for (int i = 0; i < enemies.length; i++) {
  //  enemies[i] = new Enemies();
}
void draw() {


  drawGrad();
  //ENEMIES Make an enemy every frame...you probably don't want this...
  //enemies.add(new Enemies()); 
  spawn();

  for (int i = 0; i < enemies.size(); i++) {
    Enemies e = enemies.get(0);
    e.display();
    e.move();

    //Return boolean from class of whether object has exceeded bounds
    if (e.isDead()) {
      // Remove from array
      enemies.remove(i);
      // println(enemies.size());
    }
  }

 //  if ( collision( player, Enemies <enemies>()) == true ) fill (255, 128);
  //else fill(0, 255, 0, 128);
}

void spawn() {
  enemies.add(new Enemies());
}


//////////////////////////////////////////////////////////
void drawGrad() {
  //GRADIENT TIMING

  int score_t = millis();

  // grad.setGradient(color(0, 255, 210), color(255, 193, 244));
  grad.setGradient(color(0, 255, 210), color(255, 193, 244,40));
  if (score_t > 10000) {
    grad.setGradient(color(66, 60, 238), color(255, 193, 244,40));
  } 
  if (score_t > 20000) {

    grad.setGradient(color(87, 35, 219), color(255, 100, 116,40));
  }


  if (score_t > 30000) {

    grad.setGradient(color(17, 36, 174), color(0));
  }

  for (int i = 0; i < player.length; i++) {

    player[i].moveP();
    player[i].displayScore();
    
  }
  ///////////////////////////////////////////////////////////////
}


/*
boolean collision (Player p, Enemies enemy) {
 float d = dist(p.xPos, p.yPos, enemy.size, enemy.size);
 if ( p.rad + enemy.size < d ) {
 
 return false; //they do not
 } else {
 return true; // they do
 }
 
 
 }
 */
