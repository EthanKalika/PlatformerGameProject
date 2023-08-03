public class PerannaEnemy extends AnimatedSprite{
  float topBound, bottomBound;
  int timer;
  
  public PerannaEnemy(float centerX, float centerY)
  {
    super(loadImage("data/character_0002.png"), centerX, centerY, sprite_Scale_Set2 * 7.5 / 10, 2 * sprite_Scale_Set2); 
    topBound = centerY;
    bottomBound = topBound + h + 10;
    standNeutral = new PImage[2];
    standNeutral[0] = loadImage("data/character_0002.png");
    standNeutral[1] = loadImage("data/character_0003.png");
    currentImages = standNeutral;
  }
  
  public void retrude()
  {
    if (center_y <= topBound)
    {
      change_y = 2;
    }
  }
  
  public void protrude()
  {
    if (center_y >= bottomBound)
    {
      change_y = -2;
    }
  }
  
  public void perannaEnemyBehavior()
  {
    timer++;
    //System.out.println("perannaEnemy Timer:\t" + timer);  //Debugging
    if (timer <= 60)
    {
      //System.out.println("First if statement in \"perannaEnemyBehavior\" has been entered");  //Debugging //<>//
      retrude();
    }
    else if (timer < 90)
    {
      protrude(); //<>//
    }
    else
    {
      timer = 0; //<>//
    }
    updatePerannaEnemy();
  }
  
  public void cycleAnimatedSpriteForPE()
  {
    frame++;
    if (frame % 5 == 0)
    {
      advanceToNextImage();
    }
  }
  
  public void updatePerannaEnemy()
  {
    center_y += change_y;
    if (center_y < topBound)
    {
      center_y = topBound;
      change_y = 0;
    }
    else if (center_y > bottomBound)
    {
      center_y = bottomBound;
      change_y = 0;
    }
  }
}
