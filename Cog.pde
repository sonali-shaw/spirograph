class Cog{
  PVector center, point;
  float radius;
  ArrayList<PVector> path = new ArrayList<PVector>();
  Boolean drawingDone;

  Cog(float x_pos, float y_pos, float rad){
    this.center = new PVector(x_pos, y_pos);
    this.radius = rad;
    this.point = new PVector(x_pos + radius, y_pos);
    this.drawingDone = false;
  }
  
  void display(){
    //circle (path)
    noFill();
    circle(this.center.x, this.center.y, this.radius * 2);
    
    //center
    fill(0);
    circle(this.center.x, this.center.y, 5);
    
    //point
    fill(255);
    circle(this.point.x, this.point.y, 5);
  }
  
  void drawPath(){
    noFill();
    stroke(0);
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
    this.point.x = this.center.x + this.radius * cos(angle);
    this.point.y = this.center.y + this.radius * sin(angle);
    angle += speed/10;
    
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
  
  Boolean compare(float f1, float f2){
    float dist = abs(f1 - f2);
    if (dist < 0.001){
      return true;
    }
    return false;
  }
  
}
