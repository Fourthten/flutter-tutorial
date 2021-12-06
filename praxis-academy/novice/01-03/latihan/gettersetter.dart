class Rectangle {
  num left, top, width, height;

  Rectangle(left, this.top, width, this.height){
    this.left = left;
    this.width = width;
  }

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

void main() {
  var rect = Rectangle(3, 4, 20, 15);
  //set bottom (val 8) => left = val (8) - width (20)
  rect.bottom = 8;
  print(rect.top); //-7
  //get right = left (3) + width (20)
  print(rect.right); //23
}