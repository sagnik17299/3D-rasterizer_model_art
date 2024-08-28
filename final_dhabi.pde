PImage img;
float angleX = 0;  
float angleY = 0;  
float angleZ = 0;  
int tiles = 160;   
boolean clearerImage = true;

float rotationSpeedY = 0.10;  
int frameCountLimit = 300;

void setup() {
  size(990, 990, P3D);
  img = loadImage("C:/Users/smmuk/Downloads/dhabi_st.png");
  img.resize(990, 990);

  
  if (clearerImage) {
    pixelDensity(displayDensity());  
    noSmooth();                      
  }
}

void draw() {
  background(#f1f1f1);
  lights();

  float tileSize = width / (float) tiles; 

  
  translate(width / 2, height / 2, 0);
  
 
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  
  
  translate(-width / 2, -height / 2, 0);

  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = img.get(int(x * tileSize), int(y * tileSize));
      float b = map(brightness(c), 0, 255, 1, 0);
      float z = map(b,0,1,-100,100);
      pushMatrix();
      translate(x * tileSize, y * tileSize, z);
      
      // Use fill to set color and adjust transparency
      fill(c, 200); 
      
      ellipse(0, 0, tileSize * b, tileSize * b);
      
      popMatrix();
    }
  }

  // Update rotation angles to create 3D depth effect
  angleY += rotationSpeedY;
  if(frameCount <= frameCountLimit) {
    saveFrame("C:/Users/smmuk/OneDrive/Desktop/final_dhabi/frames/frame-######.png");
  }
}
