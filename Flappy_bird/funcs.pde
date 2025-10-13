void restart() {
  background(135, 206, 235); // pulisce lo schermo

  // resetta tutte le variabili di gioco
  flappyX = width / 4;
  flappyY = height / 2;
  velocity = 0;
  pipeX = width;
  gapY = random(200, height - 200);
  point = 0;
  gameOver = false;
}

void keyPressed() { 
  if(key == ' ' && !gameOver) { 
    velocity = jump; // spinta instantanea di -10 -> salita verso l'alto
  } else if(key == 'r' || key == 'R') { 
    restart();
  }
}
