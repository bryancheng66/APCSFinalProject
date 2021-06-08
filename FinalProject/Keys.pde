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
  if (key==' ') {
    keys[4] = true;
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
  if (key==' ') {
    keys[4] = false;
  }
}
