import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

public class AvatarPart {

  PImage foto;
  PVector anchor, forward, up;
  PVector position;
  PVector size;
  float ratio;
  int dir;

  AvatarPart ( String fileName, int d) {
    dir = d;
    foto = loadImage(fileName);
    anchor = new PVector((foto.width)/2, (foto.height*0.15));
    forward = new PVector(0, 1);
    ratio = float(foto.width)/float(foto.height);  //el ancho sera ratio * (distancia de un nodo a otro * algo más)
    size = new PVector(1, 1);
    if(dir ==0) {
      up = new PVector(0, 1);
    }else{
      up = new PVector(0, -1);
    }
  }

  // update simple
  void update() {
    //Ajuste del tamañno
    if (size.x < 0.01) size.x = size.y*ratio;
    anchor.x = size.x / 2;
    anchor.y =size.y*0.10;

    //Ajuste de la dirección
  }

  //update de extremidad
  void update(float origX, float origY, float finX, float finY) {
    //Ajuste de posición
    position = new PVector(origX,origY);
    
    //Ajuste del tamañno
    size.y = dist(origX, origY, finX, finY);
    size.x = size.y*ratio;
    anchor.x = size.x / 2;
    anchor.y =size.y*0.10;

    //Ajuste de la dirección
    forward.x = finX-position.x;
    forward.y = finY-position.y;
    forward.normalize();
  }

 // Update del cuerpo
 void update(float origX, float origY, float finX, float finY, float izqX, float izqY, float derX, float derY) {
    //Ajuste de posición
    position = new PVector(origX,origY);
    
    //Ajuste del tamañno
    size.y = dist(origX, origY, finX, finY);
    size.x = dist(izqX,izqY,derX,derY);
    anchor.x = size.x / 2;
    anchor.y =size.y*0.90;

    //Ajuste de la dirección
    forward.x = finX-position.x;
    forward.y = finY-position.y;
    forward.normalize();
  }


  void display() {
    pushMatrix();
    translate(position.x, position.y);
    int d = (dir==1) ? -1 : 1;        
    if (forward.x < up.x) {
      rotate(PVector.angleBetween(up, forward)*d);
    } else {
      rotate(-PVector.angleBetween(up, forward)*d);
    }
   // tint(255,127);
    translate(-anchor.x,-anchor.y);
    image(foto, 0, 0, size.x, size.y);
    popMatrix();
    //Debug Part
    fill(0, 255, 0);
    ellipse(position.x+anchor.x, position.y+anchor.y, 15, 15);
    strokeWeight(5);
    line(position.x+anchor.x, position.y+anchor.y, position.x+anchor.x+forward.x*30, position.y+anchor.y+forward.y*30);
    strokeWeight(1);
    fill(0, 0, 0);
  }
}