public class Projectile extends Sprite{
  public Projectile (PImage type, float centerX, float centerY, float changeX, float changeY)
  {
    super(type, centerX, centerY, 1, 1, changeX, changeY);
  }
  
  public void updateProjectile()
  {
    center_x += change_x;
    center_y += change_y;
  }
}
