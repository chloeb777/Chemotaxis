Predator aPredator;
Prey[] preyArray;
Food[] foodArray;
int n = 1000;
void setup() {
  size(500, 500);
  preyArray = new Prey[n];
  for (int i =0; i<n; i++) {
    preyArray[i] = new Prey(color(133, 115, 16));
  }
  aPredator = new Predator();
 foodArray = new Food[n];
  for (int i =0; i<500; i++) {
    foodArray[i] = new Food();
  }
}

void draw() {
  background(0);
 for (int i = 0; i<500; i++) {
    (foodArray[i]).show();
    }
  if (mousePressed) {
     for (int i = 0; i<500; i++) {
      (foodArray[i]).repopulate();
    }}
    
  for (int i = 0; i<n; i++) {
    (preyArray[i]).show();
    (preyArray[i]).walk();
     }
  aPredator.show();
  aPredator.walk();
  aPredator.run();
 for (int i = 0; i<n; i++) {
  if (dist((preyArray[i]).myX, (preyArray[i]).myY, aPredator.myX, aPredator.myY) < 25) {
      (preyArray[i]).die();
 }}
for (int i = 0; i<500; i++) {
  for (int j = 0; j<1000; j++) {
    if (dist((foodArray[i]).myX, (foodArray[i]).myY, (preyArray[j]).myX, (preyArray[j]).myY) < 2) {
      (foodArray[i]).eaten();
 }}}
 
 }
class Predator {
  int myX, myY, myC;
  Predator() {
    myC = color(255,0,0);
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
   
  void walk() {
    myX += ((int)(Math.random()*3) - 1)*2;
    myY += ((int)(Math.random()*3) - 1)*2;
  }

void run() {
    if (myX > mouseX)
      myX += (int)(Math.random()*3) - 3;//-3, -2, -1
    else
      myX += (int)(Math.random()*3) + 3;//3, 4, 5
    if (myY > mouseY)
      myY += (int)(Math.random()*3) - 3;//-3, -2, -1
    else
      myY += (int)(Math.random()*3) + 3;//3, 4, 5
  }

  void show() {
    fill(myC);
    circle(myX, myY, 50);
  }
}
class Food {
  int myX, myY;
  Food() {
    myX = (int) (Math.random()*500);
    myY = (int) (Math.random()*500);
  }
   
  void show() {
    fill(color(0,255,0));
    ellipse(myX, myY, 2, 2);
  }
  void eaten() {
    myX = -100;
    myY = -100;
  }
  void repopulate() {
    myX = (int) (Math.random()*500);
    myY = (int) (Math.random()*500);
  }
}

class Prey {
  int myX, myY, myC;
  Prey(int c_) {
    myC = c_;
    myX = (int) (Math.random()*500);
    myY = (int) (Math.random()*500);
  }
   
  void walk() {
    myX += ((int)(Math.random()*3) - 1)*2;
    myY += ((int)(Math.random()*3) - 1)*2;
  }

  void show() {
    fill(myC);
    ellipse(myX, myY, 10, 10);
  }
  void die() {
    myX = -10;
    myY = -10;
    //I chose for the dead ones to simply go to the right and above of the screen so that they could repopulate the screen later
  }
}
