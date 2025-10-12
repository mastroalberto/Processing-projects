int flappyWidth = 50; 
int flappyHeight = 20;

float flappyX;
int flappyY;

float velocity = 0.0; 
float gravity = 0.6;
float jump = -10;

float pipeX;
float pipeWidth = 80;
float gapY; // coordinata y del buco 
float gapHeight = 200; // altezza del buco 

boolean gameOver = false;

int point = 0;

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

void setup() {
  background(121, 204, 245);
  size(1200,768);
  flappyX = width / 4.25;
  flappyY = height / 2;
  textSize(30);
}

void draw() {
   background(121, 204, 245);
   
   // viene applicato il principio di fisica nei videgiochi dove la gravità tira verso il basso le figure
   // un oggetto che cade verso il basso accellera nel tempo -> aumentiamo la velocità di discesa per ogni fotogramma
   
   if (!gameOver) {
     velocity += gravity; 
     flappyY += velocity;
   
     fill(255, 198, 44);
     ellipse(flappyX, flappyY, flappyWidth, flappyHeight);
     // becco dell'uccello 
     fill(240,139,15);
     ellipse(flappyX + 20, flappyY + 2, flappyWidth / 2, flappyHeight / 2);
     fill(255);
     ellipse(flappyX + 10, flappyY - 1, flappyWidth / 4, flappyHeight / 4 );
     
     // ---- tubi ----
     fill(0,200,0);
     // tubo superiore 
     rect(pipeX, 0, pipeWidth, gapY - gapHeight / 2);
     // tubo inferiore
     rect(pipeX, gapY + gapHeight/2, pipeWidth, height - (gapY + gapHeight/2));
       
     // muovi il tubo verso sinistra
     if(point > 1000) { 
       pipeX -= 15;
     } else {
       pipeX -= 10;
     }
     // quando esce dallo schermo, ricrealo
     if (pipeX + pipeWidth < 0) {
       pipeX = width;
       gapY = random(200, height - 200); // nuova posizione casuale del buco
     }
      
     // un pochino di calcoli per non fare cadere di sotto e di sopra l'uccello 
     
     if(flappyY > height - flappyHeight / 2) { 
       flappyY = height - flappyHeight /2; 
       velocity = 0; 
     }
     
     if(flappyY < flappyHeight / 2) { 
       flappyY = flappyHeight / 2; 
       velocity = 0; 
     }
     
     boolean colX = flappyX + flappyWidth / 2 > pipeX && flappyX - flappyWidth / 2 < pipeX + flappyWidth; 
     boolean colY = flappyY - flappyHeight / 2 < gapY - gapHeight / 2 || flappyY + flappyHeight / 2 > gapY + gapHeight /2;
     
     if (colX && colY) { 
       gameOver = true;
     } 
     
     if(flappyX > pipeX) { 
       point++;
     } 
     
     fill(0);
     text("Punteggio: " + point, width / 8, height / 8);
     
   } else {
    // ---- schermata game over ----
    fill(0);
    textSize(60);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width / 2, height / 2);
    textSize(30);
    text("Punteggio: " + point, width / 2, height / 2 + 60); 
    textSize(40);
    text("Premi r o R per ricominciare", width / 2, height / 2 + 120);
  }
}

void keyPressed() { 
  if(key == ' ' && !gameOver) { 
    velocity = jump; // spinta instantanea di -10 -> salita verso l'alto
  } else if(key == 'r' || key == 'R') { 
    restart();
  }
}
