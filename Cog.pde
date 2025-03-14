class Rgb{
  int red, green, blue;
  
  Rgb(int red, int green, int blue){
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
}

class Cog{
  PVector center, point;
  int radius, offset;
  ArrayList<PVector> path = new ArrayList<PVector>();
  Boolean drawingDone;
  Rgb rgb;

  Cog(float x_pos, float y_pos, int rad, int offset, Rgb rgb){
    this.center = new PVector(x_pos, y_pos);
    this.radius = rad;
    this.offset = offset;
    this.point = new PVector(x_pos + radius, y_pos);
    this.drawingDone = false;
    this.rgb = rgb;
  }
  
  void display(){
    //circle (path)
    noFill();
    circle(this.center.x, this.center.y, this.radius * 2);
    
    //center
    fill(0);
    circle(this.center.x, this.center.y, 5);
    
    //point
    fill(0);
    circle(this.point.x, this.point.y, 10);
  }
  
  void drawPath(){
    noFill();
    stroke(rgb.red, rgb.green, rgb.blue);
    //strokeWeight(3);
    beginShape();
    for (PVector p : path) {
      curveVertex(p.x, p.y);
    }
    endShape();
  }
  
    
  float angle = 0;
  int revs = 0;
  
  void spinPoint(float speed){
    this.point.x = this.center.x + this.offset * cos(angle);
    this.point.y = this.center.y + this.offset* sin(angle);
    
    angle += speed/2;  // Increment angle
    
    //add position to path list for drawing
    if (angle > 0){
      PVector current_pos = new PVector(this.point.x, this.point.y);
      path.add(current_pos);
    }  
  }
  
  void updatePositions(float new_x, float new_y){
    this.center.x = new_x;
    this.center.y = new_y;
  }
  
  //comparison that accounts for floating point errors
  Boolean compare(float f1, float f2){
    float dist = abs(f1 - f2);
    if (dist < 0.001){
      return true;
    }
    return false;
  }  
  
}
