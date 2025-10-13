void setup() {
  background(121, 204, 245);
  size(1200,768);
  flappyX = width / 4.25;
  flappyY = height / 2;
  textSize(30);
  
  flappyImg = loadImage("flappySprite.png");
  tubeImg = loadImage("tubeSprite.png");
}

void draw() {
   background(121, 204, 245);
   
   // viene applicato il principio di fisica nei videgiochi dove la gravità tira verso il basso le figure
   // un oggetto che cade verso il basso accellera nel tempo -> aumentiamo la velocità di discesa per ogni fotogramma
   
   if (!gameOver) {
     velocity += gravity; 
     flappyY += velocity;
 
     // sprite di flappybird     
     image(flappyImg, flappyX, flappyY, flappyWidth, flappyHeight);
     
     
     /*
     // ---- tubi ----
     fill(0,200,0);
     // tubo superiore 
     rect(pipeX, 0, pipeWidth, gapY - gapHeight / 2);
     // tubo inferiore
     rect(pipeX, gapY + gapHeight/2, pipeWidth, height - (gapY + gapHeight/2));
     */
     
     
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
