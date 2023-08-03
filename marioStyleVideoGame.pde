import java.util.ArrayList;

Player Player1;
PImage commonEnemyBounded1;
PImage commonEnemyBounded2;
PImage commonEnemyUnbounded;
PImage perannaEnemy;
PImage jumpingEnemy;
PImage strongWalkingEnemy;
PImage flyingEnemy;
PImage flyingProjectileEnemy;
PImage walkingProjectileEnemy;
PImage jumpingProjectileEnemy;
PImage boss;
PImage brownBrick;
PImage crate;
PImage redBrick;
PImage snow;
PImage leftCornerGrass;
PImage middleGrass;
PImage rightCornerGrass;
PImage dirtBlockType1;
PImage dirtBlockType2;
PImage singleDirtPlatform;
PImage leftDirtPlatform;
PImage midDirtPlatform;
PImage rightDirtPlatform;
PImage hardBlock1;
PImage hardBlock2;
PImage hardBlock3;
PImage leftHardBlock;
PImage midHardBlock;
PImage rightHardBlock;
PImage leftCornerGround;
PImage midGround;
PImage rightCornerGround;
PImage upPipe1;
PImage upPipe2;
PImage flag;
PImage flagPole;
PImage leftPipe;
PImage rightPipe;
PImage downPipe;
PImage downSpawnPipe;
PImage coin;
PImage upMidPipe1;
PImage upMidPipe2;
PImage upMidPipe3;
PImage sideMidPipe;
PImage exclamationBlock;
PImage spawnUpPipe;
PImage upsideDownEnemy;
PImage hardWall1;
PImage flyingEnemy2;
PImage spikeEnemy;
PImage topRightCornerDirt;
PImage apexDirt;
PImage leftBoarderDirt;
PImage topLeftCornerDirt;
String[] csvLines;
ArrayList<Sprite> spriteList;
ArrayList<Sprite> jumpablePlatforms;
ArrayList<Sprite> animatedCoinList;
ArrayList<Sprite> animatedCommonEnemyList;
ArrayList<Sprite> animatedUnboundedCommonEnemyList;
ArrayList<Sprite> animatedUpsideDownEnemyList;
ArrayList<Sprite> animatedJumpingEnemyList;
ArrayList<Sprite> strongWalkingEnemyList;
ArrayList<Sprite> flyingEnemyList;
ArrayList<Sprite> perannaEnemyList;
ArrayList<Sprite> projectileList;
ArrayList<Sprite> boundedProjectileEnemyList;
ArrayList<Sprite> spikeEnemyList;
ArrayList<Sprite> allEnemy;
float view_x, view_y, rightMargin, leftMargin, downMargin, upMargin, rightBoundary, leftBoundary, topBoundary, bottomBoundary;
Sprite TesterEnemy;
boolean sReleased;
Sprite thePipe;
//int keypressedNum = 0;  //debugging

void setup()
{
  size(1000, 480);
  imageMode(CENTER);
  view_x = 0;
  view_y = 0;
  rightMargin = 450;
  leftMargin = 60;
  downMargin = 60;
  upMargin = 60;
  Player1 = new Player(100, 100, 7.0 / 8.0, 100.0 / 110.0, 10);
  commonEnemyBounded1 = loadImage("data/character_0000.png");
  commonEnemyBounded2 = loadImage("data/character_0000.png");
  commonEnemyUnbounded = loadImage("data/character_0000.png");
  perannaEnemy = loadImage("data/character_0003.png");
  jumpingEnemy = loadImage("data/character_0004.png");
  strongWalkingEnemy = loadImage("data/character_0007.png");
  flyingEnemy = loadImage("data/character_0009.png");
  flyingProjectileEnemy = loadImage("data/character_0009.png");
  walkingProjectileEnemy = loadImage("data/character_0015.png");
  jumpingProjectileEnemy = loadImage("data/character_0004.png");
  boss = loadImage("data/character_robot_duck.png");
  brownBrick = loadImage("data/brown_brick.png");
  crate = loadImage("data/crate.png");
  redBrick = loadImage("data/red_brick.png");
  snow = loadImage("data/snow.png");
  leftCornerGrass = loadImage("data/tile_0021.png");
  middleGrass = loadImage("data/tile_0022.png");
  rightCornerGrass = loadImage("data/tile_0023.png");
  dirtBlockType1 = loadImage("data/tile_0122.png");
  dirtBlockType2 = loadImage("data/tile_0025.png");
  singleDirtPlatform = loadImage("data/tile_0040.png");
  leftDirtPlatform = loadImage("data/tile_0041.png");
  midDirtPlatform = loadImage("data/tile_0042.png");
  rightDirtPlatform = loadImage("data/tile_0043.png");
  hardBlock1 = loadImage("data/tile_0047.png");
  hardBlock2 = loadImage("data/tile_0047.png");
  hardBlock3 = loadImage("data/tile_0047.png");
  leftHardBlock = loadImage("data/tile_0048.png");
  midHardBlock = loadImage("data/tile_0049.png");
  rightHardBlock = loadImage("data/tile_0050.png");
  leftCornerGround = loadImage("data/tile_0061.png");
  midGround = loadImage("data/tile_0062.png");
  rightCornerGround = loadImage("data/tile_0063.png");
  upPipe1 = loadImage("data/tile_0095.png");
  upPipe2 = loadImage("data/tile_0095.png");
  flag = loadImage("data/tile_0111.png");
  flagPole = loadImage("data/tile_0131.png");
  leftPipe = loadImage("data/tile_0132.png");
  rightPipe = loadImage("data/tile_0134.png");
  downPipe = loadImage("data/tile_0135.png");
  downSpawnPipe = loadImage("data/tile_0135.png");
  coin = loadImage("data/tile_0151.png");
  upMidPipe1 = loadImage("data/tile_0115.png");
  upMidPipe2 = loadImage("data/tile_0115.png");
  upMidPipe3 = loadImage("data/tile_0115.png");
  sideMidPipe = loadImage("data/tile_0133.png");
  exclamationBlock = loadImage("data/tile_0010.png");
  spawnUpPipe = loadImage("data/tile_0095.png");
  flyingEnemy2 = loadImage("data/character_0009.png");
  upsideDownEnemy = loadImage("data/UpsideDownEnemy1RightFacing.png");
  hardWall1 = loadImage("data/tile_0047.png");
  spikeEnemy = loadImage("data/character_0012.png");
  topRightCornerDirt = loadImage("data/tile_0024.png");
  apexDirt = loadImage("data/tile_0020.png");
  leftBoarderDirt = loadImage("data/tile_0121.png");
  topLeftCornerDirt = loadImage("data/tile_0025.png");
  csvLines = loadStrings("data/Video Game CSV File - Sheet1.csv");
  jumpablePlatforms = new ArrayList<Sprite>();
  spriteList = new ArrayList<Sprite>();
  animatedCoinList = new ArrayList<Sprite>();
  animatedCommonEnemyList = new ArrayList<Sprite>();
  animatedUnboundedCommonEnemyList = new ArrayList<Sprite>();
  animatedUpsideDownEnemyList = new ArrayList<Sprite>();
  animatedJumpingEnemyList = new ArrayList<Sprite>();
  strongWalkingEnemyList = new ArrayList<Sprite>();
  flyingEnemyList = new ArrayList<Sprite>();
  perannaEnemyList = new ArrayList<Sprite>();
  boundedProjectileEnemyList = new ArrayList<Sprite>();
  spikeEnemyList = new ArrayList<Sprite>();
  projectileList = new ArrayList<Sprite>();
  allEnemy = new ArrayList<Sprite>();
  populatePlatformsArrayList(csvLines);
  TesterEnemy = new Sprite (jumpingEnemy, 5134, -9.4, smallSprite_Scale_Set2, smallSprite_Scale_Set2);
  sReleased = false;
  thePipe = new Sprite(sideMidPipe, 8430, 390, sprite_Scale_Set2, sprite_Scale_Set2);  //7650, 720
  spriteList.add(thePipe);
}

void draw()
{
  background(255);
  //System.out.println("Display Stats: Player center: (" + Player1.center_x + ", " + Player1.center_y + ")\tPlayer falling velocity: " + Player1.change_y + "\tPlayer size: (" + Player1.w + ", " + Player1.h + ")");  //Debugging
  //System.out.println("Player gravity: " + Player1.spriteGravity());  //Debugging
  resolveCollisions(Player1, spriteList, allEnemy, jumpablePlatforms, animatedCommonEnemyList, animatedUnboundedCommonEnemyList, animatedJumpingEnemyList, strongWalkingEnemyList, flyingEnemyList, boundedProjectileEnemyList, spikeEnemyList);
  Player1.displayText();
  scrollMethod();
  displayAllSprite(spriteList, animatedCoinList, animatedCommonEnemyList, animatedUnboundedCommonEnemyList, animatedUpsideDownEnemyList, animatedJumpingEnemyList, strongWalkingEnemyList, flyingEnemyList, perannaEnemyList, boundedProjectileEnemyList, projectileList, spikeEnemyList);
  Player1.displaySprite();
  Player1.updatePlayerCounter();
  Player1.uncrouchPlayer(Player1, spriteList);
  //Player1.decrementHealth(Player1.collidedEnemies(Player1, allEnemy));
  Player1.updateDamageAbility();
  Player1.decrementJumpCounter();
  //Player1.jumpOnEnemies(Player1, Player1.jumpedOnEnemies(Player1, animatedCommonEnemyList), animatedCommonEnemyList, allEnemy, jumpablePlatforms);
  //Player1.jumpOnEnemies(Player1, Player1.jumpedOnEnemies(Player1, animatedUnboundedCommonEnemyList), animatedUnboundedCommonEnemyList, allEnemy, jumpablePlatforms);
  //Player1.jumpOnEnemies(Player1, Player1.jumpedOnEnemies(Player1, animatedJumpingEnemyList), animatedJumpingEnemyList, allEnemy, jumpablePlatforms);
  collectCoin(Player1, animatedCoinList);
  animateAllAnimatedSprite(animatedCoinList);
  animateAllAnimatedSprite(animatedCommonEnemyList);
  resolveAllCommonEnemyCollisions(animatedCommonEnemyList);
  animateAllCommonUnboundedEnemy(animatedUnboundedCommonEnemyList);
  resolveAllUnboundedCommonEnemyCollisions(animatedUnboundedCommonEnemyList);
  updateAllUpsideDownEnemy(animatedUpsideDownEnemyList);
  animateAllUpsideDownEnemy(animatedUpsideDownEnemyList);
  jump(animatedJumpingEnemyList);
  cycleJumpingEnemyFace(animatedJumpingEnemyList);
  resolveAllJumpingEnemyCollisions(animatedJumpingEnemyList);
  animateAllStrongWalkingEnemy(strongWalkingEnemyList);
  resolveAllStrongWalkingEnemyCollisions(strongWalkingEnemyList);
  incrementDownCounter(strongWalkingEnemyList);
  animateAllFlyingEnemy(flyingEnemyList);
  controlAllFlyingEnemy(flyingEnemyList, Player1);
  resolveAllFlyingEnemyCollisions(flyingEnemyList, spriteList);
  animateAllPerannaEnemy(perannaEnemyList);
  controlAllPerannaEnemy(perannaEnemyList);
  animateAllAnimatedSprite(boundedProjectileEnemyList);
  resolveAllBoundedProjectileCommonEnemyCollisions(boundedProjectileEnemyList);
  launchAllProjectileEnemyP(Player1, boundedProjectileEnemyList, projectileList, allEnemy);
  updateAllProjectile(projectileList);
  flyAway(projectileList, allEnemy);
  animateAllSpikeEnemy(spikeEnemyList);
  resolveAllSpikeEnemyCollisions(spikeEnemyList, spriteList);
  //System.out.println("view coordinates: (" + view_x + ", " + view_y);  //Debugging
  //System.out.println("Snow Height: " + snow.height + "\tSnow Width: " + snow.width);  //Debugging
  //System.out.println("Player Dimensions: " + Player1.w + ", " + Player1.h);  //Debugging
  //System.out.println("Key Activation: " + keypressedNum + "\tPower Counter: " + Player1.powerCounter +"\tButton: " + Player1.isUpPressed + "\tPower: " + Player1.isPowerActivated);  //Debugging
  //System.out.println("Player center: (" + Player1.center_x + ", " + Player1.center_y + ")\tPlayer falling velocity: " + Player1.change_y + "\tPlayer size: (" + Player1.w + ", " + Player1.h + ")");  //Debugging
  //System.out.println("Position of unbounded enemy: (" + animatedUnboundedCommonEnemyList.get(0).center_x + ", " + animatedUnboundedCommonEnemyList.get(0).center_y + ")");  //Debugging
  //System.out.println("Velocity of unbounded enemy:\t" + animatedUnboundedCommonEnemyList.get(0).change_x + "\tVelocity of common enemy:\t" + animatedCommonEnemyList.get(0).change_x);  //Debugging
  //System.out.println("Jumping enemy position:\t(" + animatedJumpingEnemyList.get(0).center_x + ", " + animatedJumpingEnemyList.get(0).center_y + ")");  //Debugging
  //System.out.println("Jumping enemy 1 jump number:\t" + ((JumpingEnemy)animatedJumpingEnemyList.get(0)).jumpCounter);  //Debugging
  //System.out.println("sReleased is:\t" + sReleased + "\t\"isCloseUnderPlatform\" is:\t" + Player1.isCloseUnderPlatform());  //Debugging
  //System.out.println("Strong Walking Enemy 1 Position:\t" + strongWalkingEnemyList.get(0).center_x + ", " + strongWalkingEnemyList.get(0).center_y);  //Debugging
  //System.out.println("Enemy Array:\t" + allEnemy.toString());  //Debugging
  //System.out.println("Collided enemies string:\t" + Player1.collidedEnemies(Player1, allEnemy));  //Debugging
  //System.out.println("Can player take damage: " + Player1.canTakeDamage);  //Debugging
  //System.out.println("Jumped On Enemy:\t" + Player1.jumpedOnEnemies(Player1, jumpablePlatforms));  //Debugging
  //System.out.println("Player vertical velocity:\t" + Player1.change_y);  //Debugging
  //System.out.println("Player can jump:\t" + Player1.isPlayerOnPlatform(Player1, spriteList, jumpablePlatforms) + ", " + !Player1.isPowerActivated);  //Debugging
  //System.out.println("Player1's jumpCounter: " + Player1.jumpCounter);  //Debugging
  //System.out.println("First strong walking enemies \"currentImages\" and \"downCounter\":\t" + ((AnimatedSprite)strongWalkingEnemyList.get(1)).currentImages.toString() + ", " + ((StrongWalkingEnemy)strongWalkingEnemyList.get(0)).downCounter);  //Debugging
  //System.out.println(Math.random());  //Debugging
  //System.out.println("12345678901234567890");  //Debugging
  //System.out.println("First flying enmey coordinates:\t(" + flyingEnemyList.get(0).center_x + ", " + flyingEnemyList.get(0).center_y + ")");  //Debugging
  //System.out.println("First Peranna Enemy center:\t(" + perannaEnemyList.get(0).center_x + ", " + perannaEnemyList.get(0).center_y + ")");  //Debugging
  //System.out.println("First Peranna Enemy rate of change vector:\t(" + perannaEnemyList.get(0).change_x + ", " + perannaEnemyList.get(0).change_y + ")");  //Debugging
  //System.out.println("____________________");  //Debugging
}

public void keyPressed()
{
  //keypressedNum ++;  //debugging
  if(keyCode == 49 && Player1.numCoins >= 15 && !Player1.powerActivated || key == 'p')  //This may need debugging later
  {
    Player1.powerActivated = true;
    Player1.numCoins -= 15;
  }
  else if(key == 'o')  //debugging
  {
    Player1.powerActivated = false;
  }
  if (keyCode == UP)
  {
    Player1.isUpPressed = true;
  }
  Player1.powerDecider();
  if (key == 's' && Player1.isPowerActivated)
  {
    Player1.change_y = 5;
  }
  else if (key == 's' && !Player1.isPowerActivated && Player1.isOnPlatform(Player1, spriteList))  //Add in and player is not on the ground
  {
    Player1.h = Player1.crouchHeight;  //I will have to add in a crouching animation here. I will also have to change the hitbox
  }
  if (key == 'd')
  {
    //System.out.println("d has been pressed");  //Debugging
    Player1.change_x = 5;
  }
  if (key == 'a')
  {
    Player1.change_x = -5;
  }
  if (key == 'w')
  {
    Player1.jumpCounter = 6;
    if (Player1.isPlayerOnPlatform(Player1, spriteList, jumpablePlatforms) && !Player1.isPowerActivated)
    {
      Player1.change_y = -14;
      //System.out.println("Player has jumped"); //Debugging
    }
    else if (Player1.isPlayerOnPlatform(Player1, spriteList, jumpablePlatforms) && Player1.isPowerActivated)
    {
      Player1.change_y = -5;
    }
  }
}
  
public void keyReleased()
{
  if (keyCode == UP)
  {
    Player1.isUpPressed = false;
    Player1.isPowerActivated = false;
    Player1.enablePlayerGravity();
  }
  if (key == 'd')
  {
    Player1.change_x = 0;
  }
  if (key == 'a')
  {
    Player1.change_x = 0;
  }
  if (key == 's')
  {
    //System.out.println("Is \"isCloseUnderPlatform\" Working " + Player1.isCloseUnderPlatform(Player1));  //Debugging
    Player1.change_y = 0;
    sReleased = true;
  }
}

public void populatePlatformsArrayList(String[] lines)
{
  //int counter1 = 0;  //Debugging
  //int counter2 = 0;  //Debugging
  //String[] lines = loadStrings(filename);
  //System.out.println("Array of lines: " + Arrays.toString(lines));  //Debugging
  //System.out.println();  //Debugging
  for (int row = 0; row < lines.length; row++)
  {
    String[] elements = split(lines[row], ",");
    //System.out.println(Arrays.toString(elements));  //Debugging
    for (int col = 0; col < elements.length; col++)
    {
      if (elements[col].equals("1"))
      {
        //counter1++;  //Debugging
        Obsticle s = new Obsticle(brownBrick, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set1, sprite_Scale_Set1);
        //System.out.println("populatePlatformsArrayList statement1 dimensions: " + s.w + ", " + s.h);  //Debugging
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("2"))
      {
        //counter2++;  //Debugging
        Obsticle s = new Obsticle(snow, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set1, sprite_Scale_Set1);
        //System.out.println("populatePlatformsArrayList statement2 dimensions: " + s.w + ", " + s.h);  //Debugging
        spriteList.add(s);
      }
      else if (elements[col].equals("3"))
      {
        Obsticle s = new Obsticle(crate, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set1, sprite_Scale_Set1);
        spriteList.add(s);
      }
      else if (elements[col].equals("4"))
      {
        AnimatedCoin s = new AnimatedCoin(coin, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2); //<>//
        animatedCoinList.add(s);
        //spriteList.add(s);
        //System.out.println(s.w + " ," + s.h);  //Debugging
      }
      else if (elements[col].equals("5"))
      {
        Obsticle s = new Obsticle(redBrick, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set1, sprite_Scale_Set1);
        spriteList.add(s);
      }
      else if (elements[col].equals("6"))
      {
        CommonEnemy s = new CommonEnemy(smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, findLeftBound(col, row, csvLines), findRightBound(col, row, csvLines));
        animatedCommonEnemyList.add(s);
        allEnemy.add(s);
        jumpablePlatforms.add(s);
      }
      else if (elements[col].equals("7"))
      {
        Obsticle s = new Obsticle(hardBlock1, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("8"))
      {
        Obsticle s = new Obsticle(upMidPipe1, smallSprite_Size + (col + 1) * smallSprite_Size, smallSprite_Size + (row - 15) * smallSprite_Size, 2 * sprite_Scale_Set2, 2 * sprite_Scale_Set2);
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("9"))
      {
        Obsticle s = new Obsticle(upPipe1, smallSprite_Size + (col + 1) * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, 2 * sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("10"))
      {
        Obsticle s = new Obsticle(hardBlock2, smallSprite_Size + (col + 1) * smallSprite_Size, smallSprite_Size + (row - 17) * smallSprite_Size, 2 * sprite_Scale_Set2, 2 * sprite_Scale_Set2);
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("11"))
      {
        JumpingEnemy s = new JumpingEnemy(smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size);
        animatedJumpingEnemyList.add(s); //<>//
        allEnemy.add(s);
        jumpablePlatforms.add(s);
      }
      else if (elements[col].equals("12"))
      {
        Obsticle s = new Obsticle(leftCornerGrass, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("13"))
      {
        Obsticle s = new Obsticle(hardBlock3, smallSprite_Size + col * smallSprite_Size + hardBlock3.width * smallSprite_Scale_Set2 / 2, smallSprite_Size + (row - 16) * smallSprite_Size + hardBlock3.height * smallSprite_Scale_Set2 / 2, smallSprite_Scale_Set2, smallSprite_Scale_Set2);
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("14"))
      {
        Obsticle s = new Obsticle(upPipe2, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("15"))
      {
        Obsticle s = new Obsticle(middleGrass, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("16"))
      {
        Obsticle s = new Obsticle(rightCornerGrass, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s); //<>//
      }
      else if (elements[col].equals("17"))
      {
        Obsticle s = new Obsticle(upMidPipe2, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("18"))
      {
        Obsticle s = new Obsticle(upMidPipe3, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 15.5) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2 / 2);
        spriteList.add(s);
      }
      else if (elements[col].equals("19"))
      {
        Obsticle s = new Obsticle(midGround, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("20"))
      {
        Obsticle s = new Obsticle(leftCornerGround, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("21"))
      {
        Obsticle s = new Obsticle(rightCornerGround, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("22"))
      {
        PerannaEnemy s = new PerannaEnemy(smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size);
        perannaEnemyList.add(s);
        allEnemy.add(s);
      }
      else if (elements[col].equals("23"))
      {
        Obsticle s = new Obsticle(exclamationBlock, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("24"))
      {
        StrongWalkingEnemy s = new StrongWalkingEnemy(smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, findRightBound(col, row, csvLines), findLeftBound(col, row, csvLines));
        strongWalkingEnemyList.add(s);
        allEnemy.add(s);
        jumpablePlatforms.add(s);
      }
      else if (elements[col].equals("25"))
      {
        Obsticle s = new Obsticle(spawnUpPipe, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("26"))
      {
        CommonEnemyUnbounded s = new CommonEnemyUnbounded(smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size);
        animatedUnboundedCommonEnemyList.add(s);
        allEnemy.add(s);
        jumpablePlatforms.add(s);
      }
      else if (elements[col].equals("27"))
      {
        UpsideDownEnemy s = new UpsideDownEnemy(smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size);
        animatedUpsideDownEnemyList.add(s);
        allEnemy.add(s);
      }
      else if (elements[col].equals("28"))
      {
        BoundedProjectileCommonEnemy s = new BoundedProjectileCommonEnemy(smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, findLeftBound(col, row, csvLines), findRightBound(col, row, csvLines));
        allEnemy.add(s);
        jumpablePlatforms.add(s);
        boundedProjectileEnemyList.add(s);
      }
      else if (elements[col].equals("29"))
      {
        Obsticle s = new Obsticle(downSpawnPipe, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, 2 * smallSprite_Scale_Set2, 2 * smallSprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("30"))
      {
        Obsticle s = new Obsticle(leftHardBlock, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("31"))
      {
        Obsticle s = new Obsticle(midHardBlock, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("32"))
      {
        Obsticle s = new Obsticle(rightHardBlock, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("33"))
      {
        FlyingEnemy s = new FlyingEnemy(smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, col, row);
        allEnemy.add(s);
        jumpablePlatforms.add(s);
        flyingEnemyList.add(s);
      }
      else if (elements[col].equals("34"))
      {
        Obsticle s = new Obsticle(leftPipe, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("35"))
      {
        Obsticle s = new Obsticle(sideMidPipe, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("36"))
      {
        Obsticle s = new Obsticle(downPipe, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("37"))
      {
        Obsticle s = new Obsticle(hardWall1, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, 2 * sprite_Scale_Set2, 3 * sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("38"))
      {
        Obsticle s = new Obsticle(dirtBlockType1, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("39"))  //Not Used
      {
        Obsticle s = new Obsticle(dirtBlockType1, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("40"))
      {
        Obsticle s = new Obsticle(flyingEnemy2, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("41"))
      {
        SpikeEnemy s = new SpikeEnemy(smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size);
        allEnemy.add(s);
        spikeEnemyList.add(s);
      }
      else if (elements[col].equals("42"))
      {
        Obsticle s = new Obsticle(topRightCornerDirt, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("43"))  //Not Used
      {
        Obsticle s = new Obsticle(topRightCornerDirt, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("44"))
      {
        Obsticle s = new Obsticle(apexDirt, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("45"))
      {
        Obsticle s = new Obsticle(leftBoarderDirt, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
      else if (elements[col].equals("46"))
      {
        Obsticle s = new Obsticle(topLeftCornerDirt, smallSprite_Size + col * smallSprite_Size, smallSprite_Size + (row - 16) * smallSprite_Size, sprite_Scale_Set2, sprite_Scale_Set2);
        spriteList.add(s);
      }
    }
  }
  //System.out.println("1 was counted " + counter1 + " times \t2 was counted " + counter2 + " times");  //Debugging
}
  
public void displayAllSprite(ArrayList<Sprite> listOfSprite, ArrayList<Sprite> listOfC, ArrayList<Sprite> listOfCE, ArrayList<Sprite> listOfCEU,ArrayList<Sprite> listOfUE, ArrayList<Sprite> listOfJE, ArrayList<Sprite> listOfSWE, ArrayList<Sprite> listOfFE, ArrayList<Sprite> listOfPE, ArrayList<Sprite> listOfPCE, ArrayList<Sprite> pList, ArrayList<Sprite> sEList)
{
  for(Sprite pe: listOfPE)
  {
    pe.displaySprite();
  }
  for(Sprite s: listOfSprite)
  {
    //System.out.println("displayAllSprite dimensions" + spriteList.get(i).w + ", " + spriteList.get(i).h);  //Debugging
    s.displaySprite();
  }
  //System.out.println("All sprites displayed");
  for(Sprite c: listOfC)
  {
    c.displaySprite();
  }
  //System.out.println("All coins displayed");
  for(Sprite s: listOfCE)
  {
    s.displaySprite();
  }
  //System.out.println("All enemies displayed");
  for(Sprite uce: listOfCEU)
  {
    uce.displaySprite();
  }
  for(Sprite upse: listOfUE)
  {
    upse.displaySprite();
  }
  for(Sprite je: listOfJE)
  {
    je.displaySprite();
  }
  for(Sprite swe: listOfSWE)
  {
    swe.displaySprite();
  }
  for(Sprite fe: listOfFE)
  {
    fe.displaySprite();
  }
  for(Sprite pce: listOfPCE)
  {
    pce.displaySprite();
  }
  for(Sprite p: pList)
  {
    p.displaySprite();
  }
  for(Sprite se: sEList)
  {
    se.displaySprite();
  }
}

public void scrollMethod()
{
  rightBoundary = view_x + width - rightMargin;
  leftBoundary = view_x + leftMargin;
  if (Player1.getRight() > rightBoundary)
  {
    view_x += Player1.getRight() - rightBoundary;
  }
  else if (Player1.getLeft() < leftBoundary)
  {
    view_x -= leftBoundary - Player1.getLeft();
  }
  topBoundary = view_y + upMargin;
  bottomBoundary = view_y + height - downMargin;
  if (Player1.getTop() < topBoundary)
  {
    view_y -= topBoundary - Player1.getTop();
  }
  else if (Player1.getBottom()> bottomBoundary)
  {
    view_y += Player1.getBottom() - bottomBoundary;
  }
  translate(-view_x, -view_y);
}

public void animateAllCoin(ArrayList<Sprite> coinList)
{
  for(Sprite c: coinList)
  {
    ((AnimatedSprite)c).cycleAnimatedSprite();
  }
}

public boolean checkCollisions(Sprite sprite1, Sprite sprite2)
  {
    boolean noCollisionInX = (sprite1.getLeft() >= sprite2.getRight()) || (sprite1.getRight() <= sprite2.getLeft());
    boolean noCollisionInY = (sprite1.getTop() >= sprite2.getBottom()) || (sprite1.getBottom() <= sprite2.getTop());
    return !(noCollisionInX || noCollisionInY);
  }
  
  public ArrayList collisionList(Sprite sprite1, ArrayList<Sprite> list)
  {
    ArrayList<Sprite> returnList = new ArrayList<Sprite>();
    for(Sprite p: list)
    {
      if (checkCollisions(sprite1, p))
      {
        returnList.add(p);
      }
    }
    return returnList;
  }

  public void resolveCollisions(Sprite sprite1, ArrayList<Sprite> list, ArrayList<Sprite> enemyList, ArrayList<Sprite> platformsJumpable, ArrayList<Sprite> cEList, ArrayList<Sprite> bCEList, ArrayList<Sprite> jEList, ArrayList<Sprite> sWEList, ArrayList<Sprite> fEList, ArrayList<Sprite> pCEList, ArrayList<Sprite> sEList)
  {
    sprite1.change_y += sprite1.spriteGravity;
    sprite1.center_y += sprite1.change_y;
    ArrayList<Sprite> colList = collisionList(sprite1, list);
    ArrayList<Sprite> colEnemyList = collisionList(sprite1, enemyList);
    //System.out.println("List of collided enemies after y transition:\t" + colEnemyList.toString());
    //System.out.println("List of collided floors after y transition:\t" + colList.toString());
    //System.out.println("List size in resolve: " + colList.size());  //Debugging
    if (colList.size() > 0 && colEnemyList.size() > 0)
    {
      //System.out.println("Collided with platform and enemy");  //Debugging
      //System.out.println("First if in resolve activated");  //Debugging
      float highest = colList.get(0).getTop();
        for(Sprite s: colList)
        {
          if (s.getTop() < highest)
          {
            highest = s.getTop();
          }
        }
        float lowest = colList.get(0).getBottom();
        for(Sprite s: colList)
        {
          if (s.getBottom() > lowest)
          {
            lowest = s.getBottom();
          }
        }
      if (sprite1.change_y >= 0)
      {
        //System.out.println("Second if in resolve activated");  //Debugging
        //System.out.println("y velocity is down and player collided with enemy and platform");  //Debugging
        sprite1.setBottom(highest);
        sprite1.change_y = 0;
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, cEList), cEList, enemyList, platformsJumpable);
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, bCEList), bCEList, enemyList, platformsJumpable);
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, jEList), jEList, enemyList, platformsJumpable);
        ((Player)sprite1).jumpOnStrongEnemy(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, sWEList));
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, fEList), fEList, enemyList, platformsJumpable);
        ((Player)sprite1).completeDecrement(sprite1, perannaEnemyList);
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, pCEList), pCEList, enemyList, platformsJumpable);
        landOnSpikeEnemy(sprite1, sEList);
      }
      else
      {
        ((Player)sprite1).decrementHealth(((Player)sprite1).collidedEnemies(sprite1, allEnemy));
        ((Player)sprite1).completeDecrement(sprite1, perannaEnemyList);
        sprite1.setTop(lowest);
        sprite1.change_y = 0;
      }
    }
    else if (colList.size() > 0)
    {
      //System.out.println("Collided only with platform");  //Debugging
      float highest = colList.get(0).getTop();
        for(Sprite s: colList)
        {
          if (s.getTop() < highest)
          {
            highest = s.getTop();
          }
        }
        float lowest = colList.get(0).getBottom();
        for(Sprite s: colList)
        {
          if (s.getBottom() > lowest)
          {
            lowest = s.getBottom();
          }
        }
      if (sprite1.change_y > 0)
      {
        //System.out.println("Second if in resolve activated");  //Debugging
        sprite1.setBottom(highest);
        sprite1.change_y = 0;
      }
      else
      {
        sprite1.setTop(lowest);
        sprite1.change_y = 0;
      }
    }
    else if (colEnemyList.size() > 0)
    {
      if (sprite1.change_y > 0)
      {
        //System.out.println("y velocity is down and player collided with enemy only");  //Debugging
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, cEList), cEList, enemyList, platformsJumpable);
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, bCEList), bCEList, enemyList, platformsJumpable);
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, jEList), jEList, enemyList, platformsJumpable);
        ((Player)sprite1).jumpOnStrongEnemy(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, sWEList));
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, fEList), fEList, enemyList, platformsJumpable);
        ((Player)sprite1).completeDecrement(sprite1, perannaEnemyList);
        ((Player)sprite1).jumpOnEnemies(sprite1, ((Player)sprite1).jumpedOnEnemies(sprite1, pCEList), pCEList, enemyList, platformsJumpable);
        landOnSpikeEnemy(sprite1, sEList);
      }
      else
      {
        //System.out.println("y velocity is up and player collided with enemy only");  //Debugging
        ((Player)sprite1).decrementHealth(((Player)sprite1).collidedEnemies(sprite1, allEnemy));
        ((Player)sprite1).completeDecrement(sprite1, perannaEnemyList);
      }
    }
    sprite1.center_x += sprite1.change_x;
    colList = collisionList(sprite1, list);
    if (colList.size() > 0 && colEnemyList.size() > 0)
    {
      if (sprite1.change_x > 0)
      {
        ((Player)sprite1).decrementHealth(((Player)sprite1).collidedEnemies(sprite1, allEnemy));
        ((Player)sprite1).completeDecrement(sprite1, perannaEnemyList);
        float leftMost = colList.get(0).getLeft();
        for(Sprite s: colList)
        {
          if (s.getLeft() < leftMost)
          {
            leftMost = s.getLeft();
          }
        }
        sprite1.setRight(leftMost);
      }
      else if (sprite1.change_x < 0)
      {
        ((Player)sprite1).decrementHealth(((Player)sprite1).collidedEnemies(sprite1, allEnemy));
        ((Player)sprite1).completeDecrement(sprite1, perannaEnemyList);
        float rightMost = colList.get(0).getRight();
        for(Sprite s: colList)
        {
          if (s.getRight() > rightMost)
          {
            rightMost = s.getRight();
          }
        }
        sprite1.setLeft(rightMost);
      }
    }
    else if (colList.size() > 0)
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
      }
    }
    else if (colEnemyList.size() > 0)
    {
      ((Player)sprite1).decrementHealth(((Player)sprite1).collidedEnemies(sprite1, allEnemy));
      ((Player)sprite1).completeDecrement(sprite1, perannaEnemyList);
    }
  }

public void collectCoin(Player player, ArrayList<Sprite> coins)
{
  ArrayList<AnimatedCoin> coinList = collisionList((Sprite)player, coins);
  //System.out.println("collectCoin has been activated. Length of array: " + collisionList((Sprite)player, coins).size());
  if (coinList.size() > 0)
  {
    //System.out.println("collectCoin if state has been activated");
    for(Sprite s: coinList)
    {
      //System.out.println("collectCoin for loop has been activated");
      coins.remove((AnimatedCoin)s);
      player.numCoins++;
    }
  }
}

public void animateAllAnimatedSprite(ArrayList<Sprite> enemyList)
{
  for (Sprite s: enemyList)
  {
    //if (((AnimatedSprite)s).activateEnemy(s))
    {
      ((AnimatedSprite)s).cycleAnimatedSprite();
    }
  }
}

public void animateAllUpsideDownEnemy(ArrayList<Sprite> enemyList)
{
  for (Sprite s: enemyList)
  {
    if (((AnimatedSprite)s).activateObject(s, 100, 100))
    {
      ((UpsideDownEnemy)s).cycleUpsideDownEnemy();
    }
  }
}

public void resolveAllCommonEnemyCollisions(ArrayList<Sprite> commonEnemyList)
{
  for(Sprite e: commonEnemyList)
  {
    //if (((AnimatedSprite)e).activateEnemy(e))
    {
      ((CommonEnemy)e).resolveCollisionsEnemy(e, spriteList);
    }
  }
}

public void resolveAllUnboundedCommonEnemyCollisions(ArrayList<Sprite> commonEnemyList)
{
  for(Sprite e: commonEnemyList)
  {
    //if (((AnimatedSprite)e).activateEnemy(e))
    {
      ((CommonEnemyUnbounded)e).resolveCollisionsEnemy(e, spriteList);
    }
  }
}

public float findLeftBound(int col, int row, String[] lines)
{
  //System.out.println("findLeftBound activated");  //Debugging
  int counter = 0;
  if (row <= lines.length - 2)
  {
    String[] elements = split(lines[row + 2], ",");
    //System.out.println(Arrays.toString(elements) + "\tColumn Number:" + col);  //Debugging
    while ((!elements[col + counter].equals("0") && !elements[col + counter].equals("4")) || (!elements[col + counter - 1].equals("0") && !elements[col + counter - 1].equals("4")))
    {
      counter--;
      //System.out.println("findLeftBound loop activated. Counter: " + counter + "\tStatement 1: " + elements[col + counter] + "\tStatement 3: " + elements[col + counter - 1] + "\tRow number: " + row);
    }
  }
  //System.out.println(smallSprite_Size * (counter + col));  //Debugging
  return smallSprite_Size * (counter + col + 1);
}

public float findRightBound(int col, int row, String[] lines)
{
  //System.out.println("findRightBound activated");  //Debugging
  int counter = 0;
  if (row <= lines.length - 2)
  {
    String[] elements = split(lines[row + 2], ",");
    //System.out.println(Arrays.toString(elements) + "\tColumn Number:" + col);  //Debugging
    while ((!elements[col + counter].equals("0") && !elements[col + counter].equals("4")) || !(elements[col + counter + 1].equals("0") && !elements[col + counter + 1].equals("4")))
    {
      counter++;
      //System.out.println("findRightBound loop activated. Counter: " + counter + "\tStatement 1: " + elements[col + counter] + "\tStatement 3: " + elements[col + counter + 1] + "\tRow number: " + row);
    }
  }
  //System.out.println(smallSprite_Size * (counter + col));  //Debugging
  return smallSprite_Size * (counter + col + 1);
}

public void updateAllUpsideDownEnemy(ArrayList<Sprite> enemyList)
{
  for (Sprite ue: enemyList)
  {
    //if (((AnimatedSprite)ue).activateEnemy(ue))
    {
      ue.center_x += ue.change_x;
      if (ue.getRight() >= ((AnimatedSprite)ue).rightBound)
      {
        ue.setRight(((AnimatedSprite)ue).rightBound);
        ue.change_x *= -1;
      }
      else if (ue.getLeft() <= ((AnimatedSprite)ue).leftBound)
      {
        ue.setLeft(((AnimatedSprite)ue).leftBound);
        ue.change_x *= -1;
      }
    }
  }
}

public void resolveAllJumpingEnemyCollisions(ArrayList<Sprite> jumpingEnemyList)
{
  for (Sprite je: jumpingEnemyList)
  {
      ((JumpingEnemy)je).resolveCollisionsJumpingEnemy(je, spriteList);
  }
}

public int randomNumberChooser()
{
  int num = (int)(2 * Math.random());
  if (num == 0)
  {
    num = -1;
  }
  else
  {
    num = 1;
  }
  return num;
}

public void resolveAllStrongWalkingEnemyCollisions(ArrayList<Sprite> enemies)
{
  for (Sprite s: enemies)
  {
    ((StrongWalkingEnemy)s).resolveCollisionsEnemy(s, spriteList);
  }
}

public void animateAllStrongWalkingEnemy(ArrayList<Sprite> enemy)
{
  for (Sprite s: enemy)
  {
    if (((AnimatedSprite)s).activateObject(s, 100, 100))
    {
      ((StrongWalkingEnemy)s).cycleAnimatedSpriteForSWE();
    }
  }
}

public void incrementDownCounter(ArrayList<Sprite> sWEArray)
{
  for(Sprite s: sWEArray)
  {
    ((StrongWalkingEnemy)s).downCounter++;
    if(((StrongWalkingEnemy)s).downCounter >= 60)
    {
      ((StrongWalkingEnemy)s).isDown = false;
    }
  }
}

public void controlAllFlyingEnemy(ArrayList<Sprite> flyingEnemies, Sprite player)
{
  for(Sprite s: flyingEnemies)
  {
    ((FlyingEnemy)s).flyingEnemyBehavior(player);
  }
}

public void resolveAllFlyingEnemyCollisions(ArrayList<Sprite> enemies, ArrayList<Sprite> list)
{
  for (Sprite s: enemies)
  {
    ((FlyingEnemy)s).resolveFlyingEnemyCollisionsEnemy(s, list);
  }
}

public void animateAllFlyingEnemy(ArrayList<Sprite> flyingEnemies)
{
  for (Sprite s: flyingEnemies)
  {
    if (((AnimatedSprite)s).activateObject(s, 100, 100))
    {
      ((FlyingEnemy)s).cycleAnimatedSpriteForFE();
    }
  }
}

public void animateAllPerannaEnemy(ArrayList<Sprite> perannaEnemies)
{
  for (Sprite s: perannaEnemies)
  {
    if (((AnimatedSprite)s).activateObject(s, 100, 100))
    {
      ((PerannaEnemy)s).cycleAnimatedSpriteForPE();
    }
  }
}

public void controlAllPerannaEnemy(ArrayList<Sprite> perannaEnemies)
{
  for (Sprite s: perannaEnemies)
  {
    ((PerannaEnemy)s).perannaEnemyBehavior();
  }
}

public void resolveAllBoundedProjectileCommonEnemyCollisions(ArrayList<Sprite> projectileCommonEnemyList)
{
  for(Sprite e: projectileCommonEnemyList)
  {
    //if (((AnimatedSprite)e).activateEnemy(e))
    {
      ((BoundedProjectileCommonEnemy)e).resolveCollisionsEnemy(e, spriteList);
    }
  }
}

public void launchAllProjectileEnemyP(Sprite player, ArrayList<Sprite> projectileCommonEnemyList, ArrayList<Sprite> pList, ArrayList<Sprite> eList)
{
  for(Sprite pce: projectileCommonEnemyList)
  {
    if (((AnimatedSprite)pce).activateObject(pce, 200, 200))
    {
      ((BoundedProjectileCommonEnemy)pce).launchProjectile(player, pList, eList);
    }
  }
}

public void updateAllProjectile(ArrayList<Sprite> pList)
{
  for(Sprite p: pList)
  {
    ((Projectile)p).updateProjectile();
  }
}

public void flyAway(ArrayList<Sprite> pList, ArrayList<Sprite> eList)
{
  for(int i = pList.size() - 1; i >= 0; i--)
  {
    if (pList.get(i).center_y > view_y + height + 2000 || pList.get(i).center_y < view_y - 2000)
    {
      eList.remove(pList.get(i));
      pList.remove(pList.get(i));
    }
  }
}

public void animateAllCommonUnboundedEnemy(ArrayList<Sprite> cUEList)
{
  for (Sprite cue: cUEList)
  {
    if (((AnimatedSprite)cue).activateObject(cue, 100, 100))
    {
      ((CommonEnemyUnbounded)cue).cycleAnimatedSprite();
    }
  }
}

public void animateAllSpikeEnemy(ArrayList<Sprite> sEList)
{
  for (Sprite se: sEList)
  {
    if (((AnimatedSprite)se).activateObject(se, 100, 100))
    {
      ((SpikeEnemy)se).cycleAnimatedSprite();
    }
  }
}

public void resolveAllSpikeEnemyCollisions(ArrayList<Sprite> sEList, ArrayList<Sprite> sList)
{
  for(Sprite se: sEList)
  {
    ((AnimatedSprite)se).resolveCollisionsEnemy(se, sList);
  }
}

public void landOnSpikeEnemy(Sprite player, ArrayList<Sprite> sEList)
{
  if (((Player)player).jumpedOnEnemies(player, sEList).size() > 0)
  {
    player.change_y = 0;
    player.change_y -= 5;
    if(((Player)player).jumpCounter > 0)
    {
      player.change_y -= 14;
    }
    ((Player)player).decrementHealth(((Player)player).jumpedOnEnemies(player, sEList));
  }
}
