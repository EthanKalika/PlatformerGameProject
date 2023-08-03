public class FlyingEnemy extends AnimatedSprite{
  
  public FlyingEnemy(float centerX, float centerY, int right, int left)
  {
    super(loadImage("data/character_0009.png"), centerX, centerY, smallSprite_Scale_Set2, smallSprite_Scale_Set2);
    rightBound = right;
    leftBound = left;
    rightFacing = new PImage[3];
    leftFacing = new PImage[3];
    leftFacing[0] = loadImage("data/character_0009.png");
    leftFacing[1] = loadImage("data/character_0010.png");
    leftFacing[2] = loadImage("data/character_0011.png");
    rightFacing[0] = loadImage("data/rightFacingFlyingEnemy1.png");
    rightFacing[1] = loadImage("data/rightFacingFlyingEnemy2.png");
    rightFacing[2] = loadImage("data/rightFacingFlyingEnemy3.png");
    currentImages = leftFacing;
  }
  
  public void standStill()
  {
    change_x = 0;
    change_y = 0;
  }
  
  public void flyRandom()
  {
    float xrand = (float)(Math.random() * Math.pow(10, 20) * randomNumberChooser());
    float yrand = (float)(Math.random() * Math.pow(10, 20) * randomNumberChooser());
    float hyp = (float)Math.pow(Math.pow(xrand, 2) + Math.pow(yrand, 2), (float)1 / 2);
    change_x = 4 * xrand / hyp;
    change_y = 4 * yrand / hyp;
  }
  
  public void flyTowardsPlayer(Sprite player)
  {
    float xchange = player.center_x - center_x;
    float ychange = player.center_y - center_y;
    float hyp = (float)Math.pow(Math.pow(xchange, 2) + Math.pow(ychange, 2), (float)1 / 2);
    change_x = 4 * xchange / hyp;
    change_y = 4 * ychange / hyp;
  }
  
  public void flyingEnemyBehavior(Sprite player)
  {
    if (frame % 60 == 0)
    {
      spriteGravity = 0;
      int rand = (int)(Math.random() * 3);
      if (rand == 0)
      {
        standStill();
      }
      else if (rand == 1)
      {
        flyRandom();
      }
      else if (rand == 2)
      {
        flyTowardsPlayer(player);
      }
    }
  }
  
  public void selectImageSetForFE()
  {
    if (change_x > 0)
    {
      currentImages = rightFacing;
    }
    else
    {
      currentImages = leftFacing;
    }
  }
  
  public void cycleAnimatedSpriteForFE()
  {
    frame++;
    if (frame % 5 == 0)
    {
      selectImageSetForFE();
      advanceToNextImage();
    }
  }
  
  public void resolveFlyingEnemyCollisionsEnemy(Sprite sprite1, ArrayList<Sprite> list)
  {
    center_y += change_y;
    change_y += spriteGravity;
    ArrayList<Sprite> colList = collisionList(sprite1, list);
    //System.out.println("List size in resolve: " + colList.size());  //Debugging
    if (colList.size() > 0)
    {
      //System.out.println("First if in resolve activated");  //Debugging
      if (sprite1.change_y > 0)  //I can potentially remove this
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
        sprite1.change_y = -1;
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
        sprite1.spriteGravity = 0.6;
        change_y = 0;
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
        sprite1.change_x *= -(float)1 / 2;
        sprite1.spriteGravity = 0.6;
        change_y = 0;
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
        sprite1.change_x *= -(float)1 / 2;
        sprite1.spriteGravity = 0.6;
        change_y = 0;
      }
    }
  }
}
