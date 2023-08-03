public class AnimatedCoin extends AnimatedSprite{
  
  public AnimatedCoin(PImage img, float centerX, float centerY, float scaleX, float scaleY)
  {
    super(img, centerX, centerY, scaleX, scaleY);
    //currentImages = new PImage[2];
    //currentImages[0] = loadImage("data/tile_0151.png");
    //currentImages[1] = loadImage("data/tile_0152.png");
    standNeutral = new PImage[2];
    standNeutral[0] = loadImage("data/tile_0151.png");
    standNeutral[1] = loadImage("data/tile_0152.png");
    currentImages = standNeutral;
  }
}
