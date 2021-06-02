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
    if (keys[0]) {
      y-=speed;
    }
    if (keys[1]) {
      x+=speed;
    }
    if (keys[2]) {
      y+=speed;
    }
    if (keys[3]) {
      x-=speed;
    }
  }

  void checkWarp() {
    if (x>width) {
      currentMap[1]++; 
      x=0;
    }
    if (y>height) {
      currentMap[0]++;
      y=0;
    }
    if (x<0) {
      currentMap[1]--; 
      x=width;
    }
    if (y<0) {
      currentMap[0]--;
      y=height;
    }
  }

  void display() {
    move();
    checkWarp();
    rectMode(RADIUS);
    fill(255, 255, 255);
    square(p.x, p.y, p.radius);
  }
}
