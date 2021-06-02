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

    for (int r=0; r<mapHeight; r++) {
      for (int c=0; c<mapWidth; c++) {
        //check if collides with any terrain
        if (currentMap.terrain[r][c]==1) {
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
    System.out.println(currentMap.x + "," + currentMap.y);
  }

  void display() {
    move();
    checkWarp();
    rectMode(RADIUS);
    fill(255, 255, 255);
    square(p.x, p.y, p.radius);
  }
}
