public class Player extends Sprite{
  boolean powerActivated, isPowerActivated, isUpPressed, canTakeDamage;
  float crouchHeight, normalHeight;
  int numLives, numCoins, powerCounter, canTakeDamageCounter, jumpCounter;
  
  public Player(float x, float y, float scale_x, float scale_y)  // This is old, possibly get rid of this
  {
    super("data/player.png", x, y, scale_x, scale_y);
    numCoins = 0;
    numLives = 4;
    crouchHeight = h / 2;
    normalHeight = h;
    powerCounter = 0;
    spriteGravity = gravity;
    canTakeDamage = true;
  }
  
  public Player(float x, float y, float scale_x, float scale_y, int lives)
  {
    super("data/player.png", x, y, scale_x, scale_y);
    numCoins = 0;
    numLives = lives;
    crouchHeight = h / 2;
    normalHeight = h;
    powerCounter = 0;
    spriteGravity = gravity;
    canTakeDamage = true;
  }
  
  public void updatePlayerCounter()
  {
    if (isPowerActivated == true)
    {
      powerCounter ++;
    }
    else if (isPowerActivated == false)
    {
      powerCounter --;
    }
    if (powerCounter < 0)
    {
      powerCounter = 0;
    }
  }
  
  public void powerDecider()
  {
    //System.out.println("Power Decider Activated");  //Debugging
    if (isUpPressed && powerActivated && powerCounter <= 60)
    {
      //System.out.println("Power Decider if Statement Activated");  //Debugging
      isPowerActivated = true;
      disablePlayerGravity();
    }
    else
    {
      isPowerActivated = false;
      enablePlayerGravity();
    }
    //System.out.println("Player Gravity in power decider: " + Player1.spriteGravity());  //Debugging
  }
  
  public void disablePlayerGravity()
  {
    spriteGravity = 0;
  }
  
  public void enablePlayerGravity()
  {
    spriteGravity = gravity;
  }
  
  public void displayText()
  {
    textSize(32);
    fill(0, 255, 0);
    text("Lives: " + numLives, 10, 30);
    fill(0, 255, 0);
    text("Coins: " + numCoins, 10, 70);
  }
  
  public boolean isUnderPlatform(Sprite sprite1, Sprite sprite2)
  {
    //System.out.println("\"isUnderPlatform\" message:\t" + !(sprite1.getRight() < sprite2.getLeft() || sprite1.getLeft() > sprite2.getRight())); //Debugging
    return !(sprite1.getRight() < sprite2.getLeft() || sprite1.getLeft() > sprite2.getRight());
  }
  
  public ArrayList<Sprite> whichPlatforms(Sprite player, ArrayList<Sprite> list)
  {
    ArrayList<Sprite> returnList = new ArrayList<Sprite>();
    for(Sprite s: list)
    {
      if(isUnderPlatform(player, s))
      {
        returnList.add(s);
      }
    }
    return returnList;
  }
  
  public boolean isCloseUnderPlatform(Sprite player, ArrayList<Sprite> list)
  {
    float value = getBottom() - normalHeight;
    ArrayList<Sprite> list1 = whichPlatforms(player, list);
      for(Sprite s: list1)
      {
        if(value < s.getBottom() && getBottom() >= s.getBottom())
        {
          return true;
        }
      }
    return false;
  }
  
  public void uncrouchPlayer(Sprite player, ArrayList<Sprite> list)
  {
    //System.out.println("\"uncrouchPlayer\" has been activated");  //Debugging
    //System.out.println("Booleans for \"uncrouchPlayer()\":\t" + sReleased + ", " + !Player1.isCloseUnderPlatform());  //Debugging
    if(sReleased && !isCloseUnderPlatform(player, list))
    {
      //System.out.println("\"if\" statement in \"uncrouchPlayer\" has been activated");  //Debugging
      h = normalHeight;
      sReleased = false;
    }
  }
  
  public boolean isCollidedWithEnemy(Sprite enemy)
  {
    boolean case1 = getRight() < enemy.getLeft() || getLeft() > enemy.getRight();
    boolean case2 = getTop() > enemy.getBottom() || getBottom() < enemy.getBottom();
    //System.out.println("Cases in \"isCollidedWithEnemy\":\t" + case1 + ", " + case2);  //Debugging
    return !(case1 || case2);
  }

  public boolean jumpedOnEnemy(Sprite enemy)
  {
    boolean case1 = getBottom() >= enemy.getTop() && getBottom() < enemy.getBottom();
    boolean case2 = getLeft() > enemy.getRight() || getRight() < enemy.getLeft();
    return case1 && !case2;
  }

  public ArrayList<Sprite> collidedEnemies(Sprite player, ArrayList<Sprite> listOfEnemies)
  {
    ArrayList<Sprite> returnList = new ArrayList<Sprite>();
    for (Sprite s: listOfEnemies)
    {
      if (((Player)player).isCollidedWithEnemy(s))
      {
        returnList.add(s);
      }
    }
    return returnList;
  }
  
  public ArrayList<Sprite> jumpedOnEnemies(Sprite player, ArrayList<Sprite> listOfEnemies)
  {
    ArrayList<Sprite> returnList = new ArrayList<Sprite>();
    for(Sprite s: listOfEnemies)
    {
      if (((Player)player).jumpedOnEnemy(s))
      {
        returnList.add(s);
      }
    }
    return returnList;
  }
  
  public void jumpOnEnemies(Sprite player, ArrayList<Sprite> listOfEnemies, ArrayList<Sprite> bigListOfEnemies, ArrayList<Sprite> biggerListOfEnemies, ArrayList<Sprite> otherListOfEnemy)
  {
    for(Sprite s: listOfEnemies)
    {
      biggerListOfEnemies.remove(s);
      bigListOfEnemies.remove(s);
      otherListOfEnemy.remove(s);
      player.change_y = 0;
      player.change_y -= (s.change_y + 5);
      if(jumpCounter > 0)
      {
        player.change_y -= 14;
      }
    }
  }

  public void decrementHealth(ArrayList<Sprite> list)
  {
    if (canTakeDamage && list.size() > 0)
    {
      numLives -= list.size();
      canTakeDamage = false;
      canTakeDamageCounter = 0;
    }
  }
  
  public void completeDecrement(Sprite player, ArrayList<Sprite> list)
  {
    if (canTakeDamage && collisionList(player, list).size() > 0)
    {
      numLives -= list.size();
      canTakeDamage = false;
      canTakeDamageCounter = 0;
    }
  }
  
  public void updateDamageAbility()
  {
    canTakeDamageCounter++;
    if (canTakeDamageCounter >= 60)
    {
      canTakeDamage = true;
    }
  }
  
  public boolean isPlayerOnPlatform(Sprite player, ArrayList<Sprite> floors, ArrayList<Sprite> enemies)
  {
    center_y++;
    ArrayList<Sprite> plat = collisionList(player, floors);
    ArrayList<Sprite> otherPlat = ((Player)player).jumpedOnEnemies(player, enemies);
    center_y--;
    return plat.size() > 0 || otherPlat.size() > 0;
  }
  
  public void decrementJumpCounter()
  {
    jumpCounter--;
  }
  
  public void jumpOnStrongEnemy(Sprite player, ArrayList<Sprite> strongEnemyList)
  {
    for(Sprite s: strongEnemyList)
    {
      ((StrongWalkingEnemy)s).downCounter = 0;
      ((StrongWalkingEnemy)s).isDown = true;
      player.change_y = 0;
      player.change_y -= (s.change_y + 5);
      if(jumpCounter > 0)
      {
        player.change_y -= 14;
      }
    }
  }
}
