import java.util.*;

public class Map {
  int[][] enemies;
  int[][] items;
  int[][] terrain;
  int x;
  int y;

  Map(int[][] terrain, int x, int y/*, int[][] enemies, int[][] items*/) {
    this.terrain = terrain;
    this.x = x;
    this.y = y;
  }

  void display() {
    rectMode(CORNER);
    for (int r=0; r<mapHeight; r++) {
      for (int c=0; c<mapWidth; c++) {
        if(terrain[r][c] == 1){
          fill(100,40,0);
          square(c*baseWidth, r*baseWidth, baseWidth);
        }
      }
    }
  }
  
  String toString(){
    return Arrays.deepToString(terrain);
  }
}
