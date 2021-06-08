boolean tileCollision(int x, int y) {
  int pL = x-hbw;
  int pR = x+hbw;
  int pU = y-hbw;
  int pD = y+hbw;

  for (int r=0; r<mapHeight; r++) {
    for (int c=0; c<mapWidth; c++) {
      if (currentMap.terrain[r][c] == 1) {
        int tL = c*bw;
        int tR = tL+bw;
        int tU = r*bw;
        int tD = tU+bw;

        if ((pL <= tR && pR >= tL) && (pU <= tD && pD >= tU)) {
          return true;
        }
      }
    }
  }  
  return false;
}

boolean tileCollisionE(int x, int y) {
  int pL = x-hbw;
  int pR = x+hbw;
  int pU = y-hbw;
  int pD = y+hbw;

  for (int r=0; r<mapHeight; r++) {
    for (int c=0; c<mapWidth; c++) {
      if (currentMap.terrain[r][c] == 1 || r==0 || c==0 || r==mapHeight-1 || c==mapWidth-1) {
        int tL = c*bw;
        int tR = tL+bw;
        int tU = r*bw;
        int tD = tU+bw;

        if ((pL <= tR && pR >= tL) && (pU <= tD && pD >= tU)) {
          return true;
        }
      }
    }
  }  
  return false;
}

boolean checkCollision(int x1, int y1, int x2, int y2) {
  int l1 = x1-hbw;
  int r1 = x1+hbw;
  int u1 = y1-hbw;
  int d1 = y1+hbw;

  int l2 = x2-hbw;
  int r2 = x2+hbw;
  int u2 = y2-hbw;
  int d2 = y2+hbw;

  return (l1 <= r2 && r1 >= l2) && (u1 <= d2 && d1 >= u2);
}
