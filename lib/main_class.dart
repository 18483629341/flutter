// 类的基础知识
// 构造函数
// 构造函数参数
// 定义构造函数
void main() {
  // var student1 = Student();
  // student1.id = 10;
  // student1.name="Mr wu";
  // //print("${student1.id} + ${student1.name}");
  // student1.study();
  // student1.sleep();

  //  var student2 = Student();
  // student2.id = 20;
  // student2.name="Miss li";
  // // print("${student2.id} + ${student2.name}");
  // student2.sleep();

   var student1 = Student(10,'nimi',60);
   student1.study();

   var student3=Student.myCustomConstructor(30,'momo');
   print("${student3.id} + ${student3.name}");
   void printElement(int element) {
  print(element);
}
var list = [1, 2, 3];
// 将 printElement 函数作为参数传递。
list.forEach(printElement);
}

// 定义类
class Student{
  int id; //  int id=10; 默认值
  String name; // String name="Mr wu";
  int age=0;
  // 构造函数
  // Student(){
  //   print("这个就是构造函数，只要对象被实例，就会自动执行");
  // }

  // Student(int id,String name){
  //  this.id = id;
  //  this.name =name;
  // }

  // Student(int _id,String _name){
  //  id = _id;
  //  name = _name;
  // }

  Student(this.id, this.name,this.age);

  // 自定义构造函数
  // Student.myCustomConstructor(int id,String name){
  //   print('Hello constructor');
  // }
  Student.myCustomConstructor(this.id, this.name);
   
  void study(){
    print("${this.id}， ${this.name} ${this.age} 岁了");
  }
  void sleep(){
    print("${this.name} go sleep ");
  }
}