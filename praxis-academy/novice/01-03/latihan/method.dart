import 'dart:math';

class Point {
  num x, y;
  Point(this.x, this.y);

  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
  static sum(a){
    var s = a.x;
    return s;
  }
}

abstract class Abstrak {
  var x;
}

void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  var sum = Point.sum(a);
  print(distance);
  print(sum);
}