import java.util.*;

boolean debug;
Player p; 

//0 = UP
//1 = RIGHT
//2 = DOWN
//3 = LEFT
boolean[] keys;

void setup() {
  size(1000, 1000);
  rectMode(RADIUS);
  
  debug=true;
  
  keys = new boolean[4];

  //initialize player
  p = new Player(width/2, height/2);
}

void draw() {
  if(debug){
    System.out.println(Arrays.toString(keys));
  }
  
  //draw player
  square(p.x, p.y, p.radius);
}

void keyPressed() {
  if(keyCode==UP){
    keys[0] = true;
  }
  if(keyCode==RIGHT){
    keys[1] = true;
  }
  if(keyCode==DOWN){
    keys[2] = true;
  }
  if(keyCode==LEFT){
    keys[3] = true;
  }
}

void keyReleased() {
  if(keyCode==UP){
    keys[0] = false;
  }
  if(keyCode==RIGHT){
    keys[1] = false;
  }
  if(keyCode==DOWN){
    keys[2] = false;
  }
  if(keyCode==LEFT){
    keys[3] = false;
  }
}
