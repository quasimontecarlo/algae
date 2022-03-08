// TO DO //
// FINISH TRACE_03 COLOR VARIANT, THEN MOVE ON

trace trace;
grain grain;

PImage img;

float rndm = random(1,1000000);
int variationSelect = int(random(0,1000));
//int range = 125;
//test
int range = 1000000;

// canvas setup
int ratio = 8;
int w = 500;
int h = 500;
int margin = w / ratio;

// background colors
color white = color(237, 232, 225);
color black = color(10, 10, 10);
color red = color(181, 131, 141);
color blue = color(74, 78, 105);

// background grain amount
int threshold;

// TO TROUBLESHOOT SET A RANDOM NUMBER OF FRAMES
int numFrames = int(random(1, 100000));
int iterator;

// line colors
color mainColor,auxColor;
color Lblack = color(64, 64, 43);
color Lred = color(173, 29, 29);
color Lwhite = color(251, 251, 242);
color Lcyan = color(168, 218, 220);
color Lyellow = color(255, 205, 178);
color Lmagenta = color(229, 152, 155);
color Lpurple = color(154, 140, 152);
color Ldecide = color(105, 132, 155);

void settings(){
   size(w, h);
}

void setup(){
  frameRate(range);
    
  img = loadImage("algae_logo_01.png");
  
  trace = new trace();
  grain = new grain();
  
  if ( variationSelect >= 0 && variationSelect <= 5 ) {
    background(black);
    grain.run(threshold = 15);
  } else if ( variationSelect >= 6 && variationSelect <= 10 ) {
    background(red);
    grain.run(threshold = 5);
  } else if ( variationSelect >= 15 && variationSelect <= 20 ) {
    background(blue);
    grain.run(threshold = 2);
  } else {
    background(white);
    grain.run(threshold = 4);
  }
}

void draw() {
  println("selection " + variationSelect);
  if ( variationSelect >= 0 && variationSelect <= 5 ) {
    trace.step(mainColor = Lwhite, auxColor = Lcyan);
  } else if ( variationSelect >= 6 && variationSelect <= 10) {
    trace.step(mainColor = Lyellow, auxColor = Lmagenta);
  } else if ( variationSelect >= 15 && variationSelect <= 20  ) {
    trace.step(mainColor = Lpurple, auxColor = Ldecide);
  } else {
    trace.step(mainColor = Lblack, auxColor = Lred);
  }
  algae logo;
  imageMode(CENTER);
  image(img, width-margin/1.25, height-margin/2, 50, 40);
  
  // enable to save animation
  // saveFrame("output/animated/fr1_######.gif");
  // COMMAND LINE VIEW TO TEST AND TROUBLESHOOT AND GET SAMPLES
  
  println(frameCount,"/",numFrames);
  if (frameCount==numFrames) {
    saveFrame("/home/crltt/Dropbox/bin/processing/algae/output/batchTestImages_V01/algae_batchTestImages_V01_var_"
              + variationSelect + "_" + int(frameRate) + "_" + args[0] + ".png");
    exit();
  }

}

void keyPressed() {
  save("output/output_" + int(frameRate) + "_" + rndm + ".png");
}
