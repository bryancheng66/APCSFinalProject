public class Player {
  int x;
  int y;
  int direction; //0, 1, 2, 3 are N, E, S, W
  int speed;
  int radius;
  int health;
  int oldTimer;
  boolean attacking;
  int[] sword;
  int strength;
  int points;
  boolean damaged;

  Player(int x, int y) {
    this.x=x;
    this.y=y;
    direction = 0;
    speed=2;
    health=1000;
    oldTimer=0;
    attacking = false;
    damaged = false;

    sword = new int[2];
    sword[0] = 0;
    sword[1] = 0;

    strength = 1;
    points = 0;
  }

  void move() {
    int xMove=0;
    int yMove=0;

    if (keys[0]) {
      yMove-=speed;
      direction=0;
    } else if (keys[1]) {
      xMove+=speed;
      direction=1;
    } else if (keys[2]) {
      yMove+=speed;
      direction=2;
    } else if (keys[3]) {
      xMove-=speed;
      direction=3;
    }

    if (xMove!=0 || yMove!=0) {
      if (tileCollision(x+xMove, y+yMove)) {
        xMove=0;
        yMove=0;
      };
    }

    x+=xMove; 
    y+=yMove;
  }

  //if on edge move to next map
  //doesn't check if on edge of world map
  void checkWarp() {
    if (x>width) {
      currentMap = maps[currentMap.y][currentMap.x+1]; 
      x=0;
    }
    if (y>height) {
      currentMap = maps[currentMap.y+1][currentMap.x];
      y=0;
    }
    if (x<0) {
      currentMap = maps[currentMap.y][currentMap.x-1];
      x=width;
    }
    if (y<0) {
      currentMap = maps[currentMap.y-1][currentMap.x];
      y=height;
    }
  }

  void attack() {    
    if (!attacking && keys[4]==true) {
      oldTimer=timer;
      attacking = true;
    } else if (attacking && timer >= oldTimer+25) {
      attacking = false;
    }
  }

  void run() {
    checkWarp();
    if (!attacking) {
      move();
    }
    attack();
    display();
  }

  void display() {
    if (damaged) {
      fill(255, 255, 255);
    } else {
      fill(255, 255, 255);
    }
    square(p.x, p.y, bw);

    if (attacking) {
      //display sword
      fill(0, 100, 255);

      if (direction==0) {
        sword[0] = x;
        sword[1] = y-bw;
        rect(x, y-bw, bw/2, bw);
      } else if (direction==1) {
        sword[0] = x+bw;
        sword[1] = y;
        rect(x+bw, y, bw, bw/2);
      } else if (direction==2) {
        sword[0] = x;
        sword[1] = y+bw;
        rect(x, y+bw, bw/2, bw);
      } else if (direction==3) {
        sword[0] = x-bw;
        sword[1] = y;
        rect(x-bw, y, bw, bw/2);
      }
    }
    
    //info text
    fill(255, 0, 0);
    textSize(25);
    text("Health: " + health + " Points: " + points, width/2, bw);
  }
}
