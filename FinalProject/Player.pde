public class Player {
  int x;
  int y;
  int direction; //0, 1, 2, 3 are N, E, S, W
  int speed;
  int radius;
  int health;
  int timer;
  boolean attacking;
  int[] swordPos;

  Player(int x, int y) {
    this.x=x;
    this.y=y;
    direction = 0;
    speed = 2;
    health = 30;
    timer=0;
    attacking = false;

    swordPos = new int[2];
    swordPos[0] = 0;
    swordPos[1] = 0;
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
      int xF = x+xMove;
      int yF = y+yMove;
      
      int pL = xF-hbw;
      int pR = xF+hbw;
      int pU = yF-hbw;
      int pD = yF+hbw;
      
      for (int r=0; r<mapHeight; r++) {
        for (int c=0; c<mapWidth; c++) {
          if (currentMap.terrain[r][c] == 1) {
            int tL = c*bw;
            int tR = tL+bw;
            int tU = r*bw;
            int tD = tU+bw;
            
            if((pL <= tR && pR >= tL) && (pU <= tD && pD >= tU)){
              xMove = 0;
              yMove = 0;
            }
          }
        }
      }
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
    if (y>=height) {
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
    if (timer==0) {
      timer= (keys[4]?1:0) * 25;
      attacking = keys[4];
    } else {
      timer--;
    }
  }

  void run() {
    checkWarp();
    if (!attacking) {
      move();
    }
    attack();
  }

  void display() {
    fill(255, 0, 0);
    text("Health: " + health + "," + direction, x, y-bw, 10);
    fill(255, 255, 255);
    square(p.x, p.y, bw);

    if (attacking) {
      //display sword
      fill(0, 100, 255);

      if (direction==0) {
        rect(x, y-bw, bw/2, bw);
      } else if (direction==1) {
        rect(x+bw, y, bw, bw/2);
      } else if (direction==2) {
        rect(x, y+bw, bw/2, bw);
      } else if (direction==3) {
        rect(x-bw, y, bw, bw/2);
      }
    }
  }
}
