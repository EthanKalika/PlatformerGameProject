public class Obsticle extends Sprite{
  
  public void displayObsticle()
  {
    image(object, center_x, center_y);
  }
  
  public Obsticle(PImage img, float x, float y, float scaleX, float scaleY)
  {
    super(img, x, y, scaleX, scaleY, 0, 0);
  }
}
