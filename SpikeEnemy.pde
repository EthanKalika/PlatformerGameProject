public class SpikeEnemy extends AnimatedSprite{
  public SpikeEnemy(float centerX, float centerY)
  {
    super(loadImage("data/character_0012.png"), centerX, centerY, smallSprite_Scale_Set2 * 1.55, smallSprite_Scale_Set2 * 1.55, 3, 0);
    leftFacing = new PImage[2];
    rightFacing = new PImage[2];
    leftFacing[0] = loadImage("data/character_0012.png");
    leftFacing[1] = loadImage("data/character_0013.png");
    rightFacing[0] = loadImage("data/rightFacingSpikeEnemy1.png");
    rightFacing[1] = loadImage("data/rightFacingSpikeEnemy2.png");
    currentImages = leftFacing;
  }
}
