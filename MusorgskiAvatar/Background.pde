import processing.video.*;

public class Background {

  int state;
  int numStates=8;
  PImage imagen1;
  Movie video1, video2;
  PApplet p;

  Background(PApplet parent) {
    state=0;
    p=parent;
    imagen1 = loadImage("fondo6/fondo.png");
  //  video1 =  new Movie(parent, "fondo4/video.mp4");
 //   video2 =  new Movie(parent, "fondo5/video.mov");
  }

  void movieEvent(Movie m) {
    m.read();
  }

  void display() {
    switch(state) {
    case 0: //Negro
      background(0);
   //   video1.stop();
   //   video2.stop();
      break;
    case 1: //Negro Fade
      fill(0, 20);
   //   video1.stop();
   //   video2.stop();
      rect(0, 0, width, height);
      break;
    case 2: //Blanco
      background(255);
  //    video1.stop();
   //   video2.stop();
      break;
    case 3: //Blanco Fade
      fill(255, 20);
   //   video1.stop();
   //   video2.stop();
      rect(0, 0, width, height);
      break;
    case 4: //Video
      background(0);
 //     video2.stop();
  //    video1.loop();
   //   image(video1, 0, 0, width, height);
      break;
    case 5: //Video2
  //    video1.stop();
   //   video2.loop();
  //    image(video2, 0, 0, width, height);
      break;
    case 6: //Imagen1
      background(0);
  //    video1.stop();
   //   video2.stop();
      image(imagen1, 0, 0, width, height);
      break;
    case 7: //Imagen
      tint(255, 60);
   //   video1.stop();
  //    video2.stop();
      image(imagen1, 0, 0, width, height);
      noTint();
      break;
    }
  }
}