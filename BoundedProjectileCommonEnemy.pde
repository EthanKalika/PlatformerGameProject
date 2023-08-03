public class BoundedProjectileCommonEnemy extends UnboundedProjectileCommonEnemy{
  
  public BoundedProjectileCommonEnemy(float centerX, float centerY, float left, float right)
  {
    super(centerX, centerY);
    rightBound = right;
    leftBound = left;
  }
  
  
  public void resolveCollisionsEnemy(Sprite sprite1, ArrayList<Sprite> list)
  {
    super.resolveCollisionsEnemy(sprite1, list);
    if (sprite1.getRight() >= rightBound)
    {
      sprite1.setRight(rightBound);
      sprite1.change_x *= -1;
    }
    else if (sprite1.getLeft() <= leftBound)
    {
      sprite1.setLeft(leftBound);
      sprite1.change_x *= -1;
    }
  }
  
  public void launchProjectile(Sprite player, ArrayList<Sprite> pList, ArrayList<Sprite> eList)
  {
    if (frame % 90 == 0)
    {
      Projectile p = new Projectile(loadImage("data/character_handRed.png"), center_x, center_y, getxVelocity(player), getyVelocity(player));
      pList.add(p);
      eList.add(p);
    }
  }
  
  public float getxVelocity(Sprite player)
  {
    float deltax = player.center_x - center_x;
    float deltay = player.center_y - center_y;
    float hyp = (float)Math.pow(Math.pow(deltax, 2) + Math.pow(deltay, 2), 0.5);
    //System.out.println("Projectile's x velocity:\t" + deltax / hyp);  //Debugging
    return 4 * deltax / hyp;
  }
  
  public float getyVelocity(Sprite player)
  {
    float deltax = player.center_x - center_x;
    float deltay = player.center_y - center_y;
    float hyp = (float)Math.pow(Math.pow(deltax, 2) + Math.pow(deltay, 2), 0.5);
    //System.out.println("Projectile's y velocity:\t" + deltay / hyp);  //Debugging
    return 4 * deltay / hyp;
  }
}
