import java.util.*;
import java.io.*;

//declare variables
boolean debug;

//map
static int baseWidth;
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
  rectMode(RADIUS);
  debug=false;

  //16 tiles by 12 tiles, each tile is 50px
  baseWidth = 50;
  mapWidth = 16;
  mapHeight = 12;
  
  keys = new boolean[4];

  p = new Player(width/2, height/2);
  
  try {
    setupMaps("./data/maps.txt");
  }
  catch(Exception e) {
    System.out.println("OMG " + e);
  }
  
  currentMap = maps[0][1];
}

void setupMaps(String input) throws Exception {
  BufferedReader reader = createReader(input);
  String line; 

  //read dimensions of world map (number of maps vertically & horizontally)
  line = reader.readLine();
  int mRows = Integer.parseInt(line.substring(0, 1));
  int mCols = Integer.parseInt(line.substring(2, 3));
  
  maps = new Map[mRows][mCols];
  //each map
  for (int mR=0; mR<mRows; mR++) {
    for (int mC=0; mC<mCols; mC++) {
      int[][] newMap = new int[mapHeight][mapWidth];
      //contents of each map
      for (int r=0; r<mapHeight; r++) {
        line = reader.readLine();
        for (int c=0; c<mapWidth; c++) {
          newMap[r][c] = Integer.parseInt(line.substring(c, c+1));
        }
      }
      reader.readLine();
      maps[mR][mC] = new Map(newMap, mC, mR);
    }
  }
}

void draw() {
  background(14, 240, 60);
  p.display();
  currentMap.display();
}

void keyPressed() {
  if (keyCode==UP) {
    keys[0] = true;
  }
  if (keyCode==RIGHT) {
    keys[1] = true;
  }
  if (keyCode==DOWN) {
    keys[2] = true;
  }
  if (keyCode==LEFT) {
    keys[3] = true;
  }
}

void keyReleased() {
  if (keyCode==UP) {
    keys[0] = false;
  }
  if (keyCode==RIGHT) {
    keys[1] = false;
  }
  if (keyCode==DOWN) {
    keys[2] = false;
  }
  if (keyCode==LEFT) {
    keys[3] = false;
  }
}
