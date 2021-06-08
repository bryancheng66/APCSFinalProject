public abstract class Enemy {
  int health;
  int x;
  int y;
  int speed;

  abstract void move();
  abstract void display();
  abstract void run();

  void checkAttack() {
    if (p.attacking && checkCollision(x, y, p.sword[0], p.sword[1])) {
      health-=p.strength;
    }
  }

  void attack() {
    if (checkCollision(x, y, p.x, p.y)) {
      p.health--;
      p.damaged = true;
    }
  }
}
