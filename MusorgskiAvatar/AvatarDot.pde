import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

public class avatarDot extends Avatar {

  int numDots=17;
  color c;

  class Dot {
    float x;
    float y;
    float size;
    float vel;
    float maxSize;
  }

  ArrayList<Dot> dots = new ArrayList<Dot>();

  avatarDot() {
    c = color(random(0, 255), random(0, 255), random(0, 255));
    for (int i=0; i<numDots; i++) {
      Dot d = new Dot();
      d.vel = random(30, 300);
      d.maxSize = random(9, 45);
      d.size = random(0, 45);
      dots.add(d);
    }
  }

  void update(SkeletonData s, float dt) {
    //Recalcular las posiciones
    dots.get(0).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HEAD].x*width;
    dots.get(0).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HEAD].y*height;
    dots.get(1).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER].x*width;
    dots.get(1).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER].y*height;
    
    dots.get(2).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].x*width;
    dots.get(2).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].y*height;
    dots.get(3).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].x*width;
    dots.get(3).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].y*height;
    
    dots.get(4).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT].x*width;
    dots.get(4).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT].y*height;
    dots.get(5).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT].x*width;
    dots.get(5).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT].y*height;
    
    dots.get(6).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_LEFT].x*width;
    dots.get(6).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_LEFT].y*height;
    dots.get(7).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].x*width;
    dots.get(7).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].y*height;
    
    dots.get(8).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT].x*width;
    dots.get(8).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT].y*height;
    dots.get(9).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].x*width;
    dots.get(9).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].y*height;
    
    dots.get(10).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT].x*width;
    dots.get(10).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT].y*height;
    dots.get(11).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT].x*width;
    dots.get(11).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT].y*height;
    
    dots.get(12).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_LEFT].x*width;
    dots.get(12).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_LEFT].y*height;
    dots.get(13).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_RIGHT].x*width;
    dots.get(13).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_RIGHT].y*height;
    
    dots.get(14).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_LEFT].x*width;
    dots.get(14).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_LEFT].y*height;
    dots.get(15).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT].x*width;
    dots.get(15).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT].y*height;
    
    dots.get(16).x = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_CENTER].x*width;
    dots.get(16).y = s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_CENTER].y*height;


    //Actualizar tamaños
    for (int i =0; i<numDots; i++) {
      dots.get(i).size +=dots.get(i).vel*dt;
      if (dots.get(i).size <0 || dots.get(i).size > dots.get(i).maxSize) dots.get(i).vel *= -1;
    }
  }

  void display() {
    noStroke();
    fill(c);
    for (int i=0; i< numDots; i++) {
      ellipse(dots.get(i).x, dots.get(i).y, dots.get(i).size, dots.get(i).size);
    }
  }
}