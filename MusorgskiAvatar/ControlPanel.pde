import java.util.Date;

public class ControlPanel extends PApplet {

  PImage panel;
  PImage[] backIcon = new PImage[8];
  PImage[] avatIcon = new PImage[8];
  PImage[] extrIcon = new PImage[8];
  String path;
  public int[] state = new int[5];
  boolean send=false;

  ControlPanel(String f) {
    path=f;
  }

  public void settings() {
    size(600, 100);
  }

  public void setup() {
    panel=loadImage(path+"\\Data\\panel\\panel.png");
    for(int i=0; i<8; i++) backIcon[i] = loadImage(path+"\\Data\\panel\\b"+str(i)+".png"); 
    for(int i=0; i<8; i++) avatIcon[i] = loadImage(path+"\\Data\\panel\\a"+str(i)+".png"); 
    for(int i=0; i<8; i++) extrIcon[i] = loadImage(path+"\\Data\\panel\\e"+str(i)+".png"); 
  }

  public int[] update(int[] s, boolean changed) {
    if (changed) {
      state =s;
    } else {
    }
    return s;
  }

  public void draw() {
    background(255);

    //Pintamos los cuadros
    image(backIcon[state[0]],0,0,100,100);
    image(avatIcon[state[1]],100,0,100,100);
    image(avatIcon[state[2]],200,0,100,100);
    image(extrIcon[state[3]],300,0,100,100);
    image(extrIcon[state[4]],400,0,100,100);
    

    //pintamos el cuadro de enviado
    if (send) {
      fill(0, 0, 255, 60);
      rect(500, 0, 100, 100);
    } else {
      fill(0, 255, 0, 60);
      rect(500, 0, 100, 100);
    }

    // Pinamos la máscara superior
    image(panel, 0, 0, 600, 100);
  }
}