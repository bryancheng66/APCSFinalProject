Player p; 

void setup(){
  size(1000, 1000);
  rectMode(RADIUS);
  
  //initialize player
  p = new Player(width/2, height/2);
}

void draw(){
  
  //draw player
  square(p.x, p.y, 50);
}
