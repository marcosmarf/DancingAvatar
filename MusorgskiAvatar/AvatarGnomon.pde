import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

public class avatarGnomon extends Avatar {

  ArrayList<AvatarPart> partes = new ArrayList<AvatarPart>();
  int numParts = 6;

  avatarGnomon(String ruta) {
    partes.add( new AvatarPart(ruta+"brazoI.png",0));    // elemento 0
    partes.add( new AvatarPart(ruta+"brazoD.png",0));    // elemento 1
    partes.add( new AvatarPart(ruta+"cuerpo.png",1));    // elemento 2
    partes.add( new AvatarPart(ruta+"cabeza.png",0));    // elemento 3
    partes.add( new AvatarPart(ruta+"piernaI.png",0));   // elemento 4
    partes.add( new AvatarPart(ruta+"piernaD.png",0));   // elemento 5
  }

  void update(SkeletonData s, float dt) {

    //Actualizamos tamaños
    partes.get(0).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_LEFT].y*height);
    partes.get(1).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].y*height);
    partes.get(2).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_CENTER].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_CENTER].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT].y*height);
    partes.get(3).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HEAD].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HEAD].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SPINE].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SPINE].y*height);
    partes.get(4).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_LEFT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT].y*height);
    partes.get(5).update(s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HIP_RIGHT].y*height, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT].x*width, s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT].y*height);
  }

  void display() {
    for (int i=0; i<numParts; i++) {
      partes.get(i).display();
    }
  }
}