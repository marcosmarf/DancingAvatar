import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

public class avatarGnomon2 extends Avatar {

  ArrayList<AvatarPart> partes = new ArrayList<AvatarPart>();
  int numParts = 10;

  avatarGnomon2(String ruta) {
    partes.add( new AvatarPart(ruta+"brazoI.png", 0));        // elemento 0
    partes.add( new AvatarPart(ruta+"brazoD.png", 0));        // elemento 1
    partes.add( new AvatarPart(ruta+"antebrazoI.png", 0));    // elemento 2
    partes.add( new AvatarPart(ruta+"antebrazoD.png", 0));    // elemento 3

    partes.add( new AvatarPart(ruta+"cuerpo.png", 1));        // elemento 4
    partes.add( new AvatarPart(ruta+"cabeza.png", 0));        // elemento 5

    partes.add( new AvatarPart(ruta+"femurI.png", 0));       // elemento 6
    partes.add( new AvatarPart(ruta+"femurD.png", 0));       // elemento 7
    partes.add( new AvatarPart(ruta+"tibiaI.png", 0));       // elemento 8
    partes.add( new AvatarPart(ruta+"tibiaD.png", 0));       // elemento 9
  }

  void update(SkeletonData s, float dt) {

    //Actualizamos tamaños
    partes.get(0).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT].y*height);
    partes.get(1).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT].y*height);
    partes.get(2).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_LEFT].y*height);
    partes.get(3).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].y*height);

    partes.get(4).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_CENTER].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_CENTER].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].y*height);
    partes.get(5).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HEAD].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HEAD].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER].y*height);

    partes.get(6).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_LEFT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_LEFT].y*height);
    partes.get(7).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_RIGHT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT].y*height);
    partes.get(8).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_LEFT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT].y*height);
    partes.get(9).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT].y*height);
  }

  void display() {
    partes.get(4).display();
    partes.get(5).display();
    partes.get(6).display();
    partes.get(7).display();
    partes.get(8).display();
    partes.get(9).display();
    partes.get(0).display();
    partes.get(1).display();
    partes.get(2).display();
    partes.get(3).display();
    
  }
}