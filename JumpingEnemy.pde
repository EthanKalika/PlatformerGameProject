public class JumpingEnemy extends AnimatedSprite{
  float surfaceTouches;
  boolean justLanded;
  
  public JumpingEnemy(float centerX, float centerY, float scaleX, float scaleY)
  {
    super(jumpingEnemy, centerX, centerY, scaleX, scaleY, 4 * randomNumberChooser(), -10);
    currentImages = new PImage[2];
    currentImages [0] = loadImage("data/character_0004.png");
    currentImages [1] = loadImage("data/character_0005.png");
    surfaceTouches = 0;
    frame = (int)(150 * Math.random());
  }
  
  public JumpingEnemy(float centerX, float centerY)
  {
    this(centerX, centerY, smallSprite_Scale_Set2, smallSprite_Scale_Set2);
  }
  
  public void resolveCollisionsJumpingEnemy(Sprite sprite1, ArrayList<Sprite> list)
  {
    sprite1.change_y += sprite1.spriteGravity;
    sprite1.center_y += sprite1.change_y;
    ArrayList<Sprite> colList = collisionList(sprite1, list);
    //System.out.println("List size in resolve: " + colList.size());  //Debugging
    if (colList.size() > 0)
    {
      //System.out.println("First if in resolve activated");  //Debugging
      if (sprite1.change_y > 0)
      {
        //System.out.println("Second if in resolve activated");  //Debugging
        float highest = colList.get(0).getTop();
        for(Sprite s: colList)
        {
          if (s.getTop() < highest)
          {
            highest = s.getTop();
          }
        }
        sprite1.setBottom(highest);
        sprite1.change_y = 0;
        sprite1.change_x = 0;
      }
      else if (sprite1.change_y < 0)
      {
        float lowest = colList.get(0).getBottom();
        for(Sprite s: colList)
        {
          if (s.getBottom() > lowest)
          {
            lowest = s.getBottom();
          }
        }
        sprite1.setTop(lowest);
        sprite1.change_y *= (float)1 / -2;
      }
    }
    sprite1.center_x += sprite1.change_x;
    colList = collisionList(sprite1, list);
    //System.out.println("Enemy collision list size: " + colList.size());
    if (colList.size() > 0)
    {
      if (sprite1.change_x > 0)
      {
        float leftMost = colList.get(0).getLeft();
        for(Sprite s: colList)
        {
          if (s.getLeft() < leftMost)
          {
            leftMost = s.getLeft();
          }
        }
        sprite1.setRight(leftMost);
        //System.out.println("Reached sign reverse in resolve enemy collisions");
        sprite1.change_x *= (float)1 / -2;
        sprite1.change_y *= (float)1 / 2;
        surfaceTouches++;
      }
      else if (sprite1.change_x < 0)
      {
        float rightMost = colList.get(0).getRight();
        for(Sprite s: colList)
        {
          if (s.getRight() > rightMost)
          {
            rightMost = s.getRight();
          }
        }
        sprite1.setLeft(rightMost);
        sprite1.change_x *= (float)1 / -2;
        sprite1.change_y *= (float)1 / 2;
        surfaceTouches++;
      }
    }
    ((AnimatedSprite)sprite1).frame++;
  }
}

public void cycleJumpingEnemyFace(ArrayList<Sprite> jumpingEnemyList)
{
  for(Sprite je: jumpingEnemyList)
  {
    if (((AnimatedSprite)je).activateObject(je, 100, 100))
    {
      if(((JumpingEnemy)je).frame % 150 < 15)
      {
        je.object = ((AnimatedSprite)je).currentImages[1];
      }
      else if(((JumpingEnemy)je).frame % 150 < 120)
      {
        je.object = ((AnimatedSprite)je).currentImages[0];
      }
      else
      {
        je.object = ((AnimatedSprite)je).currentImages[1];
      }
    }
  }
}

public void jump(ArrayList<Sprite> jumpingEnemy)
{
  for (Sprite sprite1: jumpingEnemy)
  {
    if (((AnimatedSprite)sprite1).frame % 150 == 0 && sprite1.isOnPlatform(sprite1, spriteList))
      {
        if (((JumpingEnemy)sprite1).surfaceTouches % 2 == 0)
        {
          sprite1.change_x = 4;
          sprite1.change_y = -10  - (int)(4 * Math.random());
        }
        else
        {
          sprite1.change_x = -4;
          sprite1.change_y = -10  - (int)(4 * Math.random());
        }
      }
  }
}
