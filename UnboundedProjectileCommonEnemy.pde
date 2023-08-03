public class UnboundedProjectileCommonEnemy extends AnimatedSprite{
  public UnboundedProjectileCommonEnemy(float centerX, float centerY)
  {
    super(loadImage("data/character_0000.png"), centerX, centerY, 2 * smallSprite_Scale_Set2, 2 * smallSprite_Scale_Set2, 2, 0);
    rightFacing = new PImage[2];
    leftFacing = new PImage[2];
    rightFacing[0] = loadImage("data/LeftFacingCommonEnemy_0000.png");
    rightFacing[1] = loadImage("data/RightFacingCommonEnemy_0001.png");
    leftFacing[0] = loadImage("data/character_0000.png");
    leftFacing[1] = loadImage("data/character_0001.png");
    currentImages = leftFacing;
  }
}
