public class CommonEnemyUnbounded extends AnimatedSprite{
  
  public CommonEnemyUnbounded(float centerX, float centerY, float scaleX, float scaleY, float changeX, float changeY)
  {
    super(commonEnemyBounded1, centerX, centerY, scaleX, scaleY, changeX, changeY);
    rightFacing = new PImage[2];
    leftFacing = new PImage[2];
    rightFacing[0] = loadImage("data/LeftFacingCommonEnemy_0000.png");
    rightFacing[1] = loadImage("data/RightFacingCommonEnemy_0001.png");
    leftFacing[0] = loadImage("data/character_0000.png");
    leftFacing[1] = loadImage("data/character_0001.png");
    currentImages = leftFacing;
  }
  
  public CommonEnemyUnbounded(float centerX, float centerY, float changeX, float changeY)
  {
    this(centerX, centerY, smallSprite_Scale_Set2, smallSprite_Scale_Set2, changeX, changeY);
  }
  
  public CommonEnemyUnbounded(float centerX, float centerY)
  {
    this(centerX, centerY, 3, 0);
  }
}
