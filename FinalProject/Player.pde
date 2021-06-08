public class Player {
  int x;
  int y;
  int direction; //0, 1, 2, 3 are N, E, S, W
  int speed;
  int radius;
  int health;
  int timer;

  Player(int x, int y) {
    this.x=x;
    this.y=y;
    direction = 0;
    speed = 2;
    health = 30;
    timer=0;
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

    //check for collision
    if (xMove != 0 || yMove != 0) {
      int tileX = x/bw;
      int tileY = y/bw;
      if (tileX == mapWidth) tileX--;
      if (tileY == mapHeight) tileY--;

      System.out.println(tileX + "," + tileY);
      if (tileX>0) {
        if (currentMap.terrain[tileY][tileX-1] == 1 && tileX * bw >= x + xMove - bw/2) {
          xMove -= (tileX * bw) - (x + xMove - bw/2);
        }
      }

      if (tileX<mapWidth-1) {
        if (currentMap.terrain[tileY][tileX+1] == 1 && (tileX+1) * bw <= x + xMove + bw/2) {
          xMove -= ((tileX+1) * bw) - (x + xMove + bw/2);
        }
      }
      if (tileY>0) {
        if (currentMap.terrain[tileY-1][tileX] == 1 && tileY * bw >= y + yMove - bw/2) {
          yMove -= (tileY * bw) - (y + yMove - bw/2);
        }
      }

      if (tileY<mapHeight-1) {
        if (currentMap.terrain[tileY+1][tileX] == 1 && (tileY+1) * bw <= y + yMove + bw/2) {
          yMove -= ((tileY+1) * bw) - (y + yMove + bw/2);
        }
      }
    }

    for (int r=0; r<mapHeight; r++) {
      for (int c=0; c<mapWidth; c++) {
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
    if(timer==0 && keys[4]){
      timer=25;
    }
    
    if (timer>0) {
      //display sword
      fill(0, 100, 255);
      rectMode(CENTER);
      
      if (direction==0) {
        rect(x,y-bw, bw/2, bw);
      } else if (direction==1){
        rect(x+bw,y, bw, bw/2);
      } else if (direction==2){
        rect(x,y+bw, bw/2, bw);
      } else if (direction==3){
        rect(x-bw,y, bw, bw/2);
      } 
      timer--;
    }
  }

  void display() {
    checkWarp();
    move();
    attack();
    fill(255, 0, 0);
    text("Health: " + health + "," + direction, x, y-bw, 10);
    rectMode(CENTER);
    fill(255, 255, 255);
    square(p.x, p.y, bw);
  }
}
