//final static int neutralFacing = 0;
//final static int facingright = 1;
//final static int facingLeft = 2;

public class AnimatedSprite extends Sprite{
  PImage[] rightFacing, leftFacing, standNeutral, currentImages;
  float rightBound, leftBound;
  int frame;
  int index;
  //int direction;
  
  public AnimatedSprite(PImage img, float x, float y, float scaleX, float scaleY, float changeX, float changeY)
  {
    super (img, x, y, scaleX, scaleY, changeX, changeY);
    index = 0;
    //direction = neutralFacing;
    frame = 0;
  }
  
  public AnimatedSprite(PImage img, float x, float y, float scaleX, float scaleY)
  {
    this(img, x, y, scaleX, scaleY, 0, 0);
  }
  
  public void cycleAnimatedSprite()
  {
    frame++;
    if (frame % 5 == 0)
    {
      selectImageSet();
      advanceToNextImage();
    }
  }
  
  public void selectImageSet()
  {
    if (change_x > 0)
    {
      currentImages = rightFacing;
    }
    else if (change_x < 0)
    {
      currentImages = leftFacing;
    }
    else
    {
      currentImages = standNeutral;
    }
  }
  
  public void advanceToNextImage()
  {
    index++;
    if (index > currentImages.length - 1)
    {
      index = 0;
    }
    object = currentImages[index];
  }
  
  public boolean activateObject(Sprite sprite1, float pastViewX, float pastViewY)
  {
    return !((sprite1.getLeft() >= view_x + width + pastViewX) || (sprite1.getRight() <= view_x - pastViewX) || (sprite1.getTop() >= view_y + height + pastViewY) || (sprite1.getBottom() <= view_y - pastViewY));
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
  }
}
