import java.util.*;

public class Walker extends Enemy {
  boolean state;
  Random r;
  int oldTimer;
  int xMove;
  int yMove;

  public Walker(int x, int y) {
    health = 100;
    this.x = x;
    this.y = y;
    state = false;
    speed = 4;
    oldTimer = 0;
    xMove = 0;
    yMove = 0;

    r = new Random();
  }

  void move() {
    if (!state) {
      int direction = r.nextInt(5);
      xMove=0;
      yMove=0;

      if (direction==0) {
        yMove-=speed;
      } else if (direction==1) {
        xMove+=speed;
      } else if (direction==2) {
        yMove+=speed;
      } else if (direction==3) {
        xMove-=speed;
      } 
      oldTimer = timer;
      state=true;
    } else {
      if (timer > oldTimer + 25) {
        state = false;
      }

      if (tileCollision(x+xMove, y+yMove)) {
        xMove=0;
        yMove=0;
      }

      x+=xMove;
      y+=yMove;
    }
  }

  void display() {
    fill((int)(255 * (double)health/100), 0, 60);
    square(x, y, bw);
  }

  void run() {
    checkAttack();
    attack();
    move();
    display();
  }
}
