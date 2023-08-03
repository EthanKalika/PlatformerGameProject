public class UpsideDownEnemy extends AnimatedSprite{
  
  public UpsideDownEnemy(float centerX, float centerY)
  {
    super(loadImage("data/UpsideDownEnemy2.png"), centerX, centerY, smallSprite_Scale_Set2 * 1.55, smallSprite_Scale_Set2 * 1.55, 1, 0);
    rightFacing = new PImage[2];
    leftFacing = new PImage[2];
    rightFacing [0] = loadImage("data/UpsideDownEnemy2RightFacing.png");
    rightFacing [1] = loadImage("data/UpsideDownEnemy1RightFacing.png");
    leftFacing [0] = loadImage("data/UpsideDownEnemy2.png");
    leftFacing [1] = loadImage("data/UpsideDownEnemy1.png");
    currentImages = rightFacing;
    rightBound = 5280;
    leftBound = 4980;
  }
  
  public void cycleUpsideDownEnemy()
  {
    frame++;
    if (frame % 10 == 0)
    {
      selectImageSet();
      advanceToNextImage();
    }
  }
}
