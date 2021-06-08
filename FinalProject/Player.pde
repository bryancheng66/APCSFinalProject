public class Player {
  int x;
  int y;
  int direction; //0, 1, 2, 3 are N, E, S, W
  int speed;
  int radius;
  int health;
  boolean attack;

  Player(int x, int y) {
    this.x=x;
    this.y=y;
    direction = 0;
    speed = 2;
    radius = baseWidth/2;
    health = 0;
    attack = false;
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
    if (xMove != 0 || xMove== 0) {
      int tileX = x/baseWidth;
      int tileY = y/baseWidth;
      if (tileX == mapWidth) tileX--;
      if (tileY == mapHeight) tileY--;

      System.out.println(tileX + "," + tileY);
      if (tileX>0) {
        if (currentMap.terrain[tileY][tileX-1] == 1 && tileX * baseWidth >= x + xMove - baseWidth/2) {
          xMove -= (tileX * baseWidth) - (x + xMove - baseWidth/2);
        }
      }

      if (tileX<mapWidth-1) {
        if (currentMap.terrain[tileY][tileX+1] == 1 && (tileX+1) * baseWidth <= x + xMove + baseWidth/2) {
          xMove -= ((tileX+1) * baseWidth) - (x + xMove + baseWidth/2);
        }
      }
      if (tileY>0) {
        if (currentMap.terrain[tileY-1][tileX] == 1 && tileY * baseWidth >= y + yMove - baseWidth/2) {
          yMove -= (tileY * baseWidth) - (y + yMove - baseWidth/2);
        }
      }

      if (tileY<mapHeight-1) {
        if (currentMap.terrain[tileY+1][tileX] == 1 && (tileY+1) * baseWidth <= y + yMove + baseWidth/2) {
          yMove -= ((tileY+1) * baseWidth) - (y + yMove + baseWidth/2);
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

  void display() {
    checkWarp();
    move();
    fill(255, 0, 0);
    text("Health: " + health + "," + direction, x, y-baseWidth, 10);
    rectMode(RADIUS);
    fill(255, 255, 255);
    square(p.x, p.y, p.radius);
  }
}
