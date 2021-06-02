public class Player {
  int x;
  int y;
  int direction; //0, 1, 2, 3 are N, E, S, W
  int speed;
  int radius;

  Player(int x, int y) {
    this.x=x;
    this.y=y;
    direction = 0;
    speed = 2;
    radius = baseWidth/2;
  }

  void move() {
    int xMove=0;
    int yMove=0;
    if (keys[0]) {
      yMove-=speed;
    }
    if (keys[1]) {
      xMove+=speed;
    }
    if (keys[2]) {
      yMove+=speed;
    }
    if (keys[3]) {
      xMove-=speed;
    }

    if (xMove!=0 && yMove!=0) {
      xMove *= 0.8;
      yMove *= 0.8;
    }

    //check for collision
    int tileX = x/baseWidth;
    int tileY = y/baseWidth;
    if (tileX == mapWidth) tileX--;
    if (tileY == mapHeight) tileY--;
    
    System.out.println(tileX + "," + tileY);
    if (tileX>0 && xMove<0) {
      if (currentMap.terrain[tileY][tileX-1] == 1 && tileX * baseWidth > x + xMove - baseWidth/2) {
        xMove=0;
      }
    }

    if (tileX<mapWidth-1 && xMove>0) {
      if (currentMap.terrain[tileY][tileX+1] == 1 && (tileX+1) * baseWidth < x + xMove + baseWidth/2) {
        xMove=0;
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
    rectMode(RADIUS);
    fill(255, 255, 255);
    square(p.x, p.y, p.radius);
  }
}
