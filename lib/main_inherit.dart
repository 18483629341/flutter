// 1.自定义setter 和 getter 方法
// 2. 类的继承
// 3. 重写父类方法和属性

void main() {
  var student=Student();

  //student.name = 'luy'; // 调用默认的setter方法
  // print(student.name); // 调用默认的getter方法

  student.setAge = 60; // 调用自己的setter方法
  print(student.getAge);// 调用自己的getter方法

  // 2.类的继承
  // var dog=Dog();
  // dog.name='hali';
  // print(dog.name);
  // dog.color = 'black';
  // print(dog.color);
  // dog.eat();// 子类可以调用父类的方法

  // var cat=Cat();
  // //cat.eat();
  // cat.age=2;
  // print(cat.age);
  // cat.color = 'ORANGE';
  // print(cat.color);
  // cat.meow();

  // 3. 重写父类方法和属性
  var dog=Dog();
  dog.eat();
}

class Animal {
  String color;
  void eat() {
    print("Animal eat");
  }
}


class Dog extends Animal{
  // String color;
  String name;
  void bark() {
    print("bark");
  }
  // void eat() {
  //   print("eat");
  // }

  // 3. 重写父类方法和属性
  void eat() {
    print("Dog eat");
  }
}


class Cat extends Animal{
  ///String color;
  int age;
  void meow() {
    print("meow");
  }
  // void eat() {
  //   print("eat");
  // }
}

class Student {
  String name;
  int age;

  // void set setAge(int num) {
  //   this.age = num;
  // }
  void set setAge(int num) =>this.age = num;

  int get getAge {
    return this.age;
  }
}
