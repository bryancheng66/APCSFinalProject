public abstract class Enemy {
  int health;
  int x;
  int y;

  abstract void move();
  abstract void display();

  void checkAttack() {
    if(p.attacking){
      
    }
  }
}
