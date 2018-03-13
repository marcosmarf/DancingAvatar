import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

public class avatarMask extends Avatar {

  Kinect kinect;
  
  avatarMask(Kinect _k) {
    kinect = _k;
  }

  void update(SkeletonData s, float dt) {
  
  }

  void display() {
    image(kinect.GetMask(),0,0,width,height);
  }
}