import java.util.*;
import java.io.*;

//declare variables
//map
static int bw;
static int hbw;
static int mapWidth;
static int mapHeight; 
static Map currentMap;
static Map[][] maps;
//misc
static boolean[] keys;
Player p;

void setup() {
  size(800, 600);
  noStroke();
  rectMode(CENTER);
  textAlign(CENTER);

  //
  bw = 50;
  hbw = bw/2;
  mapWidth = 16;
  mapHeight = 12;

  keys = new boolean[5];
  p = new Player(width/2, height/2);

  try {
    setupMaps("./data/maps.txt");
  }
  catch(Exception e) {
    System.out.println("OMG " + e);
  }

  currentMap = maps[0][1];
}

void draw() {
  //Game Over
  if (p.health <= 0) {
    background(0, 0, 0);
    fill(255, 255, 255);
    textSize(75);
    text("GAME OVER", width/2, height/2);
  } else {
    currentMap.display();
    p.run();
    p.display();
  }
}
