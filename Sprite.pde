//import java.util.Arrays;

final static float sprite_Scale_Set1 = 60.0 / 128.0;
final static float smallSprite_Scale_Set1 = 30.0 / 128.0;
final static float sprite_Scale_Set2 = 60.0 / 18.0;
final static float smallSprite_Scale_Set2 = 30.0 / 18.0;
final static float sprite_Size = 60;
final static float smallSprite_Size = 30;
final static float gravity = 0.6;

public class Sprite{
  PImage object;
  float center_x, center_y, w, h, scale_x, scale_y, change_x, change_y, spriteGravity;
  
  public Sprite(String filename, float x, float y, float scaleX, float scaleY, float changeX, float changeY)
  {
    center_x = x;
    center_y = y;
    object = loadImage(filename);
    scale_x = scaleX;
    scale_y = scaleY;
    w = object.width * scale_x;
    h = object.height * scale_y;
    change_x = changeX;
    change_y = changeY;
    spriteGravity = gravity;
  }
  
  public Sprite(String filename, float x, float y, float scaleX, float scaleY)
  {
    this(filename, x, y, scaleX, scaleY, 0, 0);
  }
  
  public Sprite(PImage img, float x, float y, float scaleX, float scaleY, float changeX, float changeY)
  {
    object = img;
    center_x = x;
    center_y = y;
    scale_x = scaleX;
    scale_y = scaleY;
    w = object.width * scale_x;
    h = object.height * scale_y;
    change_x = changeX;
    change_y = changeY;
    spriteGravity = gravity;
  }
  
  public Sprite(PImage img, float x, float y, float scaleX, float scaleY)
  {
    this(img, x, y, scaleX, scaleY, 0, 0);
  }
  
  public void displaySprite()
  {
    object.resize((int)w, (int)h);
    image(object, center_x, center_y);
  }
  
  public void setLeft(float newLeft)
  {
    center_x = newLeft + w / 2;
  }
  
  public void setRight(float newRight)
  {
    center_x = newRight - w / 2;
  }
  
  public void setBottom(float newBottom)
  {
    center_y = newBottom - h / 2;
  }
  
  public void setTop(float newTop)
  {
    center_y = newTop + h / 2;
  }
  
  public float getLeft()
  {
    return center_x - w / 2;
  }
  
  public float getRight()
  {
    return center_x + w / 2;
  }
  
  public float getBottom()
  {
    return center_y + h / 2;
  }
  
  public float getTop()
  {
    return center_y - h / 2;
  }
   //<>//
  public boolean isOnPlatform(Sprite sprite1, ArrayList<Sprite> floors)
  {
    sprite1.center_y++;
    ArrayList<Sprite> plat = collisionList(sprite1, floors);
    sprite1.center_y--;
    return plat.size() > 0;
  }
}
