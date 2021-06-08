import java.util.*;
import java.io.*;

//declare variables
//map
int bw;
int hbw;
int mapWidth;
int mapHeight; 
Map currentMap;
Map[][] maps;
//misc
boolean[] keys;
int timer;
Player p;
ArrayList<Enemy> enemies;

void setup() {
  size(800, 600);
  noStroke();
  rectMode(CENTER);
  textAlign(CENTER);

  bw = 50;
  hbw = bw/2;
  mapWidth = 16;
  mapHeight = 12;

  keys = new boolean[5];
  timer = 0;
  p = new Player(width/2, height/2);
  enemies = new ArrayList<Enemy>();

  try {
    setupMaps("./data/maps.txt");
  }
  catch(Exception e) {
    System.out.println("OMG " + e);
  }

  currentMap = maps[0][0];
  
}

void draw() {
  timer++;
  //Game Over
  if (p.health <= 0) {
    background(0, 0, 0);
    fill(255, 255, 255);
    textSize(75);
    text("GAME OVER", width/2, height/2);
  } else {
    currentMap.display();
    p.run();
    System.out.println(enemies.size());
    
    p.damaged=false;
    for(int i=0; i<enemies.size(); i++){
      enemies.get(i).run();
      if(enemies.get(i).health<=0){
        enemies.remove(i);
        p.points+=500;
        p.health+=100;
      }
    }
  }
}
