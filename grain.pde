class grain{
  
  grain(){
    
  }
    void run(int threshold){
      colorMode(HSB);
      loadPixels();
      for ( int loc = 0; loc < pixels.length; loc++){
        int hue = int(random(hue(pixels[loc])-threshold, hue(pixels[loc])+threshold));
        int saturation = int(random(saturation(pixels[loc])-threshold, saturation(pixels[loc])+threshold));
        int brightness = int(random(brightness(pixels[loc])-threshold, brightness(pixels[loc])+threshold));
        pixels[loc] = color(hue, saturation, brightness);
      }
      updatePixels();
    }
}
