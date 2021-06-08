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
    background(14, 240, 60);
    for (int r=0; r<mapHeight; r++) {
      for (int c=0; c<mapWidth; c++) {
        if (terrain[r][c] == 1) {
          fill(100, 40, 0);
          square(c*bw+hbw, r*bw+hbw, bw);
        }
      }
    }
  }

  String toString() {
    return Arrays.deepToString(terrain);
  }
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
