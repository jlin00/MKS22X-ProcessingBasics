//int MAX_VALUE = 100; //only if height is not variable in visualizer
//int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  int num_vals, width, height;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y){ //default constructor
    this.x = x; 
    this.y = y;
    num_vals = 10;
    width = 400;
    height = 200;
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99); //random value for value
      speeds[i] = random(2); //random value for speed 
    }
  }
  Visualizer(float x, float y, int num_vals, int width, int height) { //constructor with variable number of values, width and height
    this.x = x;
    this.y = y;
    this.num_vals = num_vals;
    this.width = width;
    this.height = height;
    values = new float[num_vals];
    speeds = new float[num_vals];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-1 * height / 2 + 1, height / 2 - 1); //random value for value, depends on height 
      speeds[i] = random(2); //random value for speed 
    } 
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, width, height); //variable width and height 
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+(height)/2, x+width, y+(height)/2); //line through middle of graph, depends on width and height 
    //line(x, y+(height)/4, x+width, y+(height)/4); visualizes graph in vertical quarters
    //line(x, y+3*(height)/4, x+width, y+3*(height)/4);
    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD!!!
    //THESE ARE WRONG: They just illustrate how they could look
    
    /*
    fill(255, 0, 0); //red
    rect(x+40, y+100, 60, 50);
    fill(0, 255, 0);
    rect(x+120, y+100, 60, -50);
    */
    
    
    for (int i = 0; i < values.length; i++){
      float val = values[i];
      if (val < -1 * height / 4){ //red
        fill(255, 0, 0); 
      }
      else if (val < 0){ //orange
        fill(255, 102, 0); 
      }
      else if (val < height / 4){ //yellow
        fill(255, 255, 0); 
      }
      else{ //positive
        fill(0, 255, 0); //green
      }
      float bar_width = width / num_vals; //adjusts for variable size visualizer, with variable number of values 
      rect(x+bar_width*i, y+height/2, bar_width, -1 * val);
    }
    


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      
      if (values[i] >= height / 2 || values[i] <= height / 2 * -1){ //when bar reaches max/min, reverses speed 
        speeds[i] *= -1;
      }

      
      //??? keep them values between max/min value

      //??? reverse the speeds so they oscillate up/down when they reach max/min

      
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 10, 400, 200);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
