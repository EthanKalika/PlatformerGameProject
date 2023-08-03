public class CommonEnemy extends CommonEnemyUnbounded{
  
  public CommonEnemy(float centerX, float centerY, float scaleX, float scaleY, float left, float right)
  {
    super(centerX, centerY, scaleX, scaleY, 3, 0);
    rightBound = right;
    leftBound = left;
  }
  
  public CommonEnemy(float centerX, float centerY, float left, float right)
  {
    this(centerX, centerY, smallSprite_Scale_Set2, smallSprite_Scale_Set2, left, right);
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
}
