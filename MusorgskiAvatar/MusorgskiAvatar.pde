import processing.video.*;

import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

ArrayList <SkeletonData> bodies;
ArrayList <Avatar> avatars;
Kinect kinect;
Background background;
ControlPanel panel;

float lastFrame, dt;
int[] state = {0, 0, 0, 0, 0};
int numAvatar = 7;
int numExtras = 1;

public void settings() {
  size(800, 600);
  smooth();
  fullScreen(1);
}

void setup() {
  // Building interface
  String[] args ={"Interfaz"};
  panel = new ControlPanel(sketchPath());
  PApplet.runSketch(args, panel);
  background = new Background(this);

  // Instanciamos la Kinect, los cuerpos y los avatares
  kinect = new Kinect(this);
  bodies = new ArrayList<SkeletonData>();
  avatars = new ArrayList<Avatar>();
  avatars.add(new Avatar());
  avatars.add(new avatarMask(kinect));
  avatars.add(new avatarDot());
  avatars.add(new avatarDot());
  avatars.add(new avatarGnomon2("avatar3/"));
  avatars.add(new avatarGnomon2("avatar4/"));
  avatars.add(new avatarGnomon("avatar5/"));

  background.state=state[0];
}

void draw() {
  //Cálculo del deltaTime
  dt = (millis()-lastFrame) / 1000. ;
  lastFrame = millis();

  //Pintamos el fondo
  background.display();

  //Pintamos los cuerpos
  for (int i=0; i< bodies.size(); i++) {
    if (bodies.get(i).trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) {
      disappearEvent(bodies.get(i));
    } else { 
      Avatar a = avatars.get(state[i+1]);
      a.update(bodies.get(i), dt);
      a.display();
    }
  }

  //Leemos el panel de control
  state = panel.update(state, false);
}

void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}

void keyReleased() {
  switch(key) {
  case 'q':
  case 'Q':
    println("Background: "+background.state);
    state[0] = (state[0]+1) % background.numStates;
    break;

  case 'a':
  case 'A':
    println("Background: "+background.state);
    if (state[0]>0) state[0] = (state[0]-1) % background.numStates;
    break;

  case 'w':
  case 'W':
    state[1] = (state[1]+1)% numAvatar;
    break;

  case 's':
  case 'S':
    if (state[1]>0) state[1] = (state[1]-1)% numAvatar;
    break;

  case 'e':
  case 'E':
    state[2] = (state[2]+1)% numAvatar;
    break;

  case 'd':
  case 'D':
    if (state[2]>0) state[2] = (state[2]-1)% numAvatar;
    break;

  case 'r':
  case 'R':
    state[3] = (state[3]+1)% numExtras;
    break;

  case 'f':
  case 'F':
    if (state[3]>0) state[3] = (state[3]-1)% numExtras;
    break;
  case 't':
  case 'T':
    state[4] = (state[4]+1)% numExtras;
    break;

  case 'g':
  case 'G':
    if (state[4]>0) state[4] = (state[4]-1)% numExtras;
    break;
  }
  background.state = state[0];
  panel.update(state, true);
}