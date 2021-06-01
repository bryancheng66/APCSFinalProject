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

  void display() {
    p.move();
    rectMode(RADIUS);
    fill(255,255,255);
    square(p.x, p.y, p.radius);
  }
}
