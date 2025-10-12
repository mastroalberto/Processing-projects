int x; 
int y;

color Colors[] = new color[10]; 

int dirX; 
int dirY;

int diskWidth; 
int diskHeight; 

int n; 

boolean hit = false;

void setup() {
  size(1920, 1080); 

  x = width / 2; 
  y = height / 2; 
  
  dirX = 2; 
  dirY = 2; 

  Colors[0] = #F20000;
  Colors[1] = #E600F7;
  Colors[2] = #0BF700;
  Colors[3] = #F78000;
  Colors[4] = #00FF9F;
  Colors[5] = #951CFA;
  Colors[6] = #FA1C8B; 
  Colors[7] = #1C89FA;
  Colors[8] = #AEFF03; 
  Colors[9] = #E8A6E4; 
  
  textAlign(CENTER, CENTER);
  textSize(30); 
  noStroke(); 
  
  diskWidth = 200;
  diskHeight = 150; 
}

void draw() { 
  background(0); 
  
  fill(Colors[n]);
  ellipse(x, y, diskWidth, diskHeight); 
  
  fill(0);
  ellipse(x, y, diskWidth / 3, diskHeight / 3);
  
  fill(Colors[n]);
  text("DVD", x, y);
  
  x += dirX; 
  y += dirY; 
  
  if (hit) { 
    n = (n + 1) % 10;
    hit = false;
  }
  
  // il disco sbatte sulla parete destra
  if (x >= width - diskWidth / 2) { 
    x = width - diskWidth / 2;
    dirX *= -1; 
    hit = true;
  }
  // il disco sbatte sulla parete di sinistra 
  else if (x <= diskWidth / 2) {
    x = diskWidth / 2; 
    dirX *= -1; 
    hit = true;
  }
  
  // il disco sbatte sulla parete di sotto
  if (y >= height - diskHeight / 2) { 
    y = height - diskHeight / 2; 
    dirY *= -1; 
    hit = true;
  }
  // il disco sbatte sulla parete di sopra
  else if (y <= diskHeight / 2) { 
    y = diskHeight / 2; 
    dirY *= -1;
    hit = true;
  }
}
