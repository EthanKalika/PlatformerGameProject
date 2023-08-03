//import java.util.ArrayList;  //Debugging
public class StrongWalkingEnemy extends AnimatedSprite{
  boolean isDown;
  int downCounter;
  PImage[] standNeutralLeft, standNeutralRight;
  
  public StrongWalkingEnemy(float centerX, float centerY, float right, float left)
  {
    super(strongWalkingEnemy, centerX, centerY, smallSprite_Scale_Set2, smallSprite_Scale_Set2, 3 * randomNumberChooser(), 0);
    rightFacing = new PImage[2];
    leftFacing = new PImage[2];
    standNeutralLeft = new PImage[1];
    standNeutralRight = new PImage[1];
    leftFacing[0] = loadImage("data/character_0006.png");
    leftFacing[1] = loadImage("data/character_0007.png");
    rightFacing[0] = loadImage("data/rightFacingStrongWalkingEnemy1.png");
    rightFacing[1] = loadImage("data/rightFacingStrongWalkingEnemy2.png");
    standNeutralRight[0] = loadImage("data/rightFacingStrongWalkingEnemy3.png");
    standNeutralLeft[0] = loadImage("data/character_0008.png");
    rightBound = right;
    leftBound = left;
    currentImages = standNeutralRight;
    //System.out.println(currentImages.toString());  //Debugging
  }
  
  public void resolveCollisionsEnemy(Sprite sprite1, ArrayList<Sprite> list)
  {
    sprite1.change_y += sprite1.spriteGravity;
    sprite1.center_y += sprite1.change_y;
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
        sprite1.change_y = 0;
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
        sprite1.change_y = 0;
      }
    }
    if (!isDown)
    {
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
          sprite1.change_x *= -1;
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
          sprite1.change_x *= -1;
        }
      }
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
  
  public void cycleAnimatedSpriteForSWE()
  {
    frame++;
    if (frame % 5 == 0)
    {
      selectImageSetForSWE();
      advanceToNextImage();
    }
  }
  
  public void selectImageSetForSWE()
  {
    //System.out.println("\"selectImageSetForSWE\" has been entered");  //Debugging
    if (change_x > 0 && downCounter <= 60)
    {
      currentImages = standNeutralRight;
    }
    else if (change_x > 0)
    {
      currentImages = rightFacing;
    }
    else if (change_x < 0 && downCounter <= 60)
    {
      currentImages = standNeutralLeft;
    }
    else
    {
      currentImages = leftFacing;
    }
  }
}
