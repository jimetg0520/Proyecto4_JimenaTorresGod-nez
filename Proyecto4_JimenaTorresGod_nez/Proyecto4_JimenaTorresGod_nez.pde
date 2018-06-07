//Jimena Torres Godínez
//Práctica 4-Video
//NUA 146016


//Crear una simulación mediante la detección de un objeto o persona, utilizando como referencia el estilo de las pinturas de la corriente del puntillismo



import gab.opencv.*;
import processing.video.*;
import java.awt.*;
OpenCV opencv;


int x,y; 

float r=0.1;


color rojo= color(108, 52, 131 );
color azul = color(255, 196, 15 );

int numPixels;
int i,j;

Capture cam;






  void setup(){ 
   
   
  

 
 size(640,480);

  cam = new Capture(this, width, height);
  
  cam.start();
  numPixels = cam.width * cam.height;
 } 
 
 
 
 
 void draw() {
  
 
  if (cam.available()) {
  
    cam.read();
    cam.loadPixels();
  for (int i = 0 ; i<640; i+=2){ 
    for (int j = 0; j<480; j+=2){ 
      noStroke(); 
      pushMatrix();
      fill(cam.pixels[i+j*640]);
      
      translate(x,y);
      rotate(random(r*0.8));
    float tamano = map(((red(cam.pixels[i+j*480]) + green(cam.pixels[i+j*640]) + blue(cam.pixels[i+j*480]))/(255*3)),0,3,5,0);

    rect(i,j,random(tamano), random(tamano));
   popMatrix();
   

  
   
     
    }
  } 
  }     
   
 
    //cambia de color
    
     
      if (cam.available()) {
    cam.read();
    cam.loadPixels();
    int iluminacion = 60; 
    float distorsion;
    
    loadPixels();
    for (int i = 0; i < numPixels; i+=3) {
      
      distorsion = brightness(cam.pixels[i]);
      if (distorsion > iluminacion) { 
        pixels[i] = rojo; 
      } 
      else { 
        pixels[i] = azul; 
      }
    }
    
    
    updatePixels();
    
      fill(0);
    textSize(15);
  text("Presiona la tecla 'a' y 'd' para modificar la posición de x ",100,420);
    text("Presiona la tecla 'w' y 's' para modificar la posición de y ",100,460);
    
    textSize(15);
      text("Cambio de color 1 = tecla'g' ",425,90);
       text("Cambio de color 2 = tecla'h' ",425,120);
        text("Cambio de color 3 = tecla'j' ",425,150);
      }
      
      
      
  }
  

    
 
  
  
 
  

   
 //NOTA: Cuando se compila el programa en ocasiones aparece un tipo de error que no detecta el void keyPressed

 
 
 void keyPressed(){
 
 //modifica x,y para mover la pantalla y crear un rastro 
   if(key=='d'){
 
 x++;

 }
 
 if(key=='a'){
 
 x--;

 }
 
 
 if(key=='w'){
 
 y++;

 }
 
 if(key=='s'){
 
 y--;

 }
 
 
 
   
 
 
 
 //cambiar color
 
 
 if(key=='h'){
rojo=color(255, 30, 100 );
 }
 
 
  if(key=='g'){
rojo=color(0, 150, 100 );
 }
 
 if(key=='j'){
 rojo=(cam.pixels[i+j*640]);
 }
 
 }
 
 
