void setup() { 
  size(500,500); 
}
void draw() {
  background(0);
  translate(width /2, height /2); 
  fill(255); 
  noStroke(); 
  rotate(millis() * 0.001 * TWO_PI);
  ellipse(0, 0, 40, 40); 
  strokeWeight(5); 
  stroke(255, 0, 0); 
  line(0, 0, 20, 0);
}

/* rotazione di un rettangolo
int a = 0; 
void setup() {
  size(600, 600); 
}
void draw() {
  background(0); 
  rotate(radians(a)); 
  rect(width/2, height/2, 50, 50); 
  a++;
}
*/

/* forza gravitazionale
float y = 0; 
float x;
float speed = 10; 
float gravity = 0.2; 

void setup() { 
  size(400,400); 
  x = width / 2; 
}
void draw() { 
  background(255); 
  stroke(0,255); 
  y += speed; 
  speed = speed + gravity; 
  fill(255,0,0);
  
  if(y > height - 25) { 
     speed *= -0.95; 
  }
  ellipse(x, y, 50, 50); 
}
*/

/* Agire sul testo e cambiare font
PFont c, a; 
size(700, 700); 
a = createFont("Arial", 50); 
c = createFont("Times New Roman", 120); 

textSize(20); 
textFont(a); 
text("Arial", 50, 70); 
textFont(c); 
text("Times New Roman", 100, 100); 

// possiamo anche importare i font volendo 
*/
/*
size(700, 700); 
textSize(20); 
text("Hello world", 10, 70); 
fill(0, 100, 150); 
text("Le mie palle", 10, 40);
fill(0, 100, 150, 100); 
text("Hello world, ma più chiaro", 10, 20); 
*/

/* Aggiungiamo rumore alla canvas
void setup() { 
  size(700, 700); 
}
void draw() { 
  background(200); 
  for(int x = 40; x < width; x += 40) { 
    // float rum = mouseX / 10; 
    float rum = map(mouseX, 0, width, 0, width / 10);
    float rumi = random(-rum, rum); 
    float rumf = random(-rum, rum); 
    line(x + rumi, 100, x + rumf, height -100); 
  }
}
*/

/* ora muoviamo l'occhio, fa figo però 
int raggio = 50; 
float lato = raggio * sqrt(2); 
float move = lato / 2; 

void setup() { 
  size(700,700); 
  ellipseMode(RADIUS); 
}
void draw() { 
    background(100); 
    fill(255); 
    ellipse(width/2, height/2, raggio, raggio); 
    float x = map(mouseX, 0, width, -move, move); 
    float y = map(mouseY, 0, height, -move, move); 
    fill(0); 
    ellipse(x + width / 2, y + height / 2, 5, 5); 
}
*/

/* mappiamo per la posizione
void setup() { 
  size(700, 700); 
}

void draw() { 
  float x = map(mouseX, 0, width, 250, 450); 
  float y = map(mouseY, 0, height, 250, 450); 
  ellipse(x, y, 40, 40); 
}
*/

/* ora si allarga il bro con mapping per il raggio 
void setup() { 
  size(700,700); 
  background(200); 
}
void draw() {
  background(0); 
  float r = map(mouseX, 0, width, 20, 250); 
  fill(255, r, 0); 
  ellipse(width /2, height /2, r, r); 
  println(mouseX); 
  println(r); 
  println("-------------------------"); 
}
*/

/* disegno cerchio crescente
int x; 
int y; 
int r=30; 
int dir=1; 

void setup() { 
size(1920,1080);   
x = width / 2; 
y = height / 2;
ellipseMode(RADIUS); 
}

void draw() { 
background(200); 
float d = dist(mouseX, mouseY, x, y); 

if(r == 20 || r == width / 2) { 
  dir = -dir; 
}

if(d < r) {
  r += dir; 
  fill(0); 
} 
else { 
  fill(255); 
}
ellipse(x, y, r, r); 
}
*/ 
