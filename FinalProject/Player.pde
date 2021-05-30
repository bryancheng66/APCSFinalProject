public class Player{
 int x;
 int y;
 int direction; //0, 1, 2, 3 are N, E, S, W
 int speed;
 int radius;
 
 Player(int x, int y){
   this.x=x;
   this.y=y;
   direction = 0;
   speed = 5;
   radius = 20;
 }
 
 void move(){
   if(keys[0]){
     y-=speed;
   }
   if(keys[1]){
     x+=speed;
   }
   if(keys[2]){
     y+=speed;
   }
   if(keys[3]){
     x-=speed;
   }
 }
}
