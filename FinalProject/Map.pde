import java.util.*;

public class Map {
  int[][] terrain;
  int x;
  int y;

  Map(int[][] terrain, int x, int y/*, int[][] enemies*/) {
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
          square(c*bw, r*bw, bw);
        }
      }
    }
  }
  
  String toString(){
    return Arrays.deepToString(terrain);
  }
}
