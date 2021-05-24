void main() {
  Rect r = new Rect(10, 4);
  print("面积:${r.area}");
  //调用set方法
  r.areaHeight = 6;
  r.areaWidth = 5;
  //直接通过访问属性的方式访问area
  print("面积:${r.area}");
}

class Rect {
  num height;
  num width;
  Rect(this.height, this.width);
  // get 方法
  get area {
    return this.height * this.width;
  }
  // set 方法
  set areaWidth(value) {
    this.width = value;
  }
  // set 方法
  set areaHeight(value) {
    this.height = value;
  }
}
