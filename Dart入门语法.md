[TOC]

## Dart入门语法

### 简介

​     Dart是google开发的编程语言，后来被Ecma (ECMA-408)认定为标准 [1] 。它被用于web、服务器、移动应用 [2] 和物联网等领域的开发；

​     它是flutter的编程语言。

​      面向对象的、类定义的、单继承的语言。它的语法类似C语言，可以转译为JavaScript，因此可以支持web的开发。前后端开发皆可以支持。

  #### 初识dart

新建的flutter项目中，查看lib/main.dart,  初步看一下他的写法：

<img src="C:\Users\cwx825027\AppData\Roaming\Typora\typora-user-images\image-20210202095742129.png" alt="image-20210202095742129" style="zoom: 67%;" />

#### dart特点

[^特点]: 吸收js的优点，规避了js的弱类型

* 支持import/export ，即导入模块/导出模块
* 面向对象
* 类
* 强类型
* 支持异步

### dart基础语法

学习参考：[dart语法参考网站](https://www.dartcn.com/guides/language/language-tour)

#### 变量

创建一个变量并进行初始化变量

```dart
// 变量仅存储对象引用
var name = 'bob'; 
// 动态变量，在运行时才检测类型
dynamic dynamicName = 'bob';
// 显式声明变量
String name = 'bob';
dynamicName = 1;
// dynamicName = dynamicName.toString() + '12e32w';
dynamicName =  '${dynamicName}12e32w';
```

如果不赋值的话，会被解析变量值为null

```dart
int lineCount;
assert(lineCount == null);
```

#### 常量

Final 和 Const

```dart
 // Without a type annotation
final name = 'Bob';
final String nickname = 'Bobby';
// 压力单位 (dynes/cm2)
const bar = 1000000; 
const double atm = 1.01325 * bar;
```

Const 关键字不仅可以用于声明常量变量。 还可以用来创建常量值，

```dart
final bar = const [];
var foo = const [];
// 非 Final ， 非 const 的变量是可以被修改的
foo = [1, 2, 3];
```

#### 内建类型

Dart 语言支持以下内建类型：

- Number
- String
- Boolean
- Null
- List (也被称为 *Array*)
- Set     Set 是一个元素唯一且无需的集合。
- Map
- Rune (用于在字符串中表示 Unicode 字符)
- Symbol

#### Number/String/Boolean/List

`int` 和 `double` 都是 [`num`.](https://api.dartlang.org/stable/dart-core/num-class.html) 的亚类型。

```dart
// 数字整型
int lineCount=22; 
// 浮点型
double a=20; // 20.0
// 字符串
String name = 'bob'; 
// boolean类型
bool flag = true;
// null
var d = null;
d??print('d为空');// a??... a如果是空，则执行后面的代码

```

**注意：上面的非空判断??是dart特有的**

#### List

不指定泛型

```
var list = [1, 2, 3];
```

指定泛型

```dart
var list33 = <String>["a","b"];
List<String> list7 = ['a','b','3'];
List<String> list8 = new List(2);
list8[0]=('aaa');
print(list8);//[aaa, null]
```

常用属性

```dart
List<String> list13 = <String>["aaa","bbb"，"ccc"] ;
print(list13.length);//3    长度
 print(list13.isEmpty);//false      是否为空
 print(list13.isNotEmpty);//true     是否不为空
 print(list13.reversed);//(ccc, bbb, aaa)      返回一个List的倒序排列的Iterable  不改变原List
 print(list13.first);//aaa    第一个元素
 print(list13.last);//ccc    最后一个元素
```

#### set

在 Dart 中 Set 是一个元素唯一且无需的集合。

```dart
// set
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
// 要创建一个空集
var names = <String>{};
// 这样会创建一个 Map ，而不是 Set 。
// var names = {}; 
 // 这样也是可以的。
Set<String> names = {};
```

#### Map

**这里的map，与js中的map完全不一样**

Map 是用来关联 keys 和 values 的对象。 keys 和 values 可以是任何类型的对象。

不指定泛型

```dart
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};
// 使用 Map 构造函数创建：
var gifts = Map();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings'; 
```

指定泛型

```dart
var map333 = <String,String>{};
map333["c"] ="c";
Map<int,String> map4 = new Map();
map4[1] = "a";
map4[2] = "b";
```



#### Rune

在 Dart 中， Rune 用来表示字符串中的 UTF-32 编码字符。

#### Symbol

一个 Symbol 对象表示 Dart 程序中声明的运算符或者标识符

主要运用：按名称引用标识符的 API

```dart
// 通过字面量 Symbol ，也就是标识符前面添加一个 # 号，来获取标识符的 Symbol 。
#radix
#bar
```

#### 函数

##### 普通函数

定义函数

```dart
// 返回值类型  方法名（参数）{}
// 函数无返回值
// 类型用void 声明
// 返回值默认为null
void main(args) {
  ...
}
```

函数传参

```dart
// 函数有返回值，类型为 int
// 返回值默认为null
int sumValue(int a,int b) {
  int sum = a + b;
  print("a+b的和为：$sum"); 
  return sum;
}
```

 函数传参(可选参数)

```dart
void printCouties(String name1,String name2,[String name3]) {
  print("文明国家有:$name1");
  print("文明国家有:$name2");
  if(name3 == null){
     print('name3不存在');
  }else{
    print("文明国家有:$name3");
  }
}

printCouties('中国','法国','德国');
printCouties('中国','法国');
```

函数参数 命名 赋默认值

```dart
void findVolume(int width,int lenth, {int height = 20}) {
  print("width:$width m");
  print("lenth:$lenth m");
  print("height:$height m");
}
```

##### main() 函数

任何应用都必须有一个顶级 `main()` 函数，作为应用服务的入口。如项目中所调用的那样!

##### 箭头函数

箭头函数无返回值

```dart
sumValue(int a, int b)=>print(a + b);
```

箭头函数有返回值

```dart
int sumValue(int a, int b)=>a + b;
```

##### 匿名函数

```dart
list.forEach((item) {
  print('${list.indexOf(item)}: $item');
});
```

##### 函数是一等对象

一个函数可以作为另一个函数的参数。 例如：

```dart
void printElement(int element) {
  print(element);
}
var list = [1, 2, 3];
// 将 printElement 函数作为参数传递。
list.forEach(printElement);
```

### dart高级语法

#### 类

顾名思义，是一种具有相同属性（方法）的对象

```dart
// 定义类
class Student{
  int id; //  int id=10; 默认值
  String name; // String name="Mr wu";
  int age;
  void study(){
    print("${this.id}， ${this.name} 学习了");
  }
 }
```

```dart

void main() {
    // 实例化
  var student1 = Student();
  student1.id = 10;
  student1.name = "Mr wu";
  student1.study();
}
```

#### 构造函数

以上调用比较繁琐，可以用在类中添加构造函数简化

构造函数，只要对象**被实例化，就会自动执行**

```dart
class Student{ 
 ...
  // 添加构造函数
  Student(int id,String name){
    this.id = id;
    this.name =name;
  }
  // 可简化为
  Student(this.id,this.name); 
 }
 // 实例化
var student1 = Student(1,'luy');
var student2= Student(2,'monica');
```

#### 自定义构造函数

```dart
Student.myCustomConstructor(this.id, this.name,this.age);
// 自定义构造函数，需要用类去调用实现实例化
var student3=Student.myCustomConstructor(3,'momo',30);
print("${student3.name} + ${student3.age}");
```

#### 类的继承

类的继承是很多语法常有的功能，dart同样也有这个

类与类之间也有相同的属性;

```dart
class Dog{
  String color;
  String name;
  void bark() {
    print("bark");
  }
  void eat() {
     print("eat");
  }
}
```



```dart
class Cat{
  String color;
  int age;
  void meow() {
    print("meow");
  }
  void eat() {
    print("eat");
  }
}
```

比如dog和cat，都有颜色，都会吃，属性和动作都是动物拥有的属性，

于是有一个公共的类（animal），让dog和cat直接继承animal的属性和方法即可；

```dart
class Animal {
  String color;
  void eat() {
    print("eat");
  }
}
```

我们通常将这种公共的类称其为父类；

用`extend`继承Animal，保留其自身特色的特性

```dart
class Dog extends Animal{
  String name;
  void bark() {
    print("bark");
  }
}
class Cat extends Animal{
  void meow() {
    print("meow");
  }
}
```

#### 重写父类方法和属性

```dart
class Dog extends Animal{
  void eat() {
    print("Dog eat");
  }
 }
```

当类和父类都有相同的方法名时，代码执行时，自动执行类中的自己的方法

#### 类的Getters和Setter

也称计算属性，Getters和Setter(也称为访问器和更改器)允许程序分别初始化和检索类字段的值。

主要用在属性之间有联动变化。比如长方形中的长，宽，面积，长和宽任意一个变化，面积就会变化。

直接用计算属性：`get area {return this.height * this.width;}`

```dart
class Rect {
  num height;
  num width;
  Rect(this.height, this.width);
  // get 方法
  get area {
    return this.height * this.width;
  }

  // set 方法
  set areaHeight(value) {
    this.height = value;
  }
  // set 方法
  set areaWidth(value) {
    this.width = value;
  }
}
```

```dart
void main() {
  Rect r = new Rect(10, 4);
  print(r.area);
  //调用set方法
  r.areaHeight = 6;
  r.areaWidth = 5;
  //直接通过访问属性的方式访问area
  print("面积:${r.area}");
}
```

#### 异常捕捉

和大多数语法一样，采用try {} catch{}

```dart
 void depositMoney(int amount){
    if(amount<0){
      throw Error;
    }
  }
  try {
   depositMoney(-1);
  } catch(e){
    print("err is $e");
  }
```

dart有一个类 *Exception* 封装好了异常处理

```dart
 try {
   depositMoney(-1);
  } catch(e){
    print(e.errorMessage());
  }
// 实现异常的方法
class DepositException implements Exception{
  String errorMessage(){
    return "金额不能少于0元";
  }
}
```

### API

#### 类型之间的转化

**注意：强类型不支持隐式转化**

any->string

```dart
dynamic age = 2;
age = '$age';
```

int -> string

```dart
age.toString();
```

string -> int 

```dart
int.parse('100');
```

String -> double

```dart
var onePointOne = double.parse('1.1');
```

double->String

```dart
String piStr = 3.141592.toStringAsFixed(3); //结果为3.141
```

其他

```dart
    double figureB = 64.742;
    // 返回figureB的整数值
    print(figureB.toInt());
    // 返回figureB的双精度值
    print(figureB.toDouble());
    // 返回大于figureB的双精度值
    print(figureB.ceilToDouble());
    // 返回小于figureB的双精度值
    print(figureB.floorToDouble());
    // 返回figureB四舍五入的双精度值
    print(figureB.roundToDouble());
    // 返回figureB保留几位小数的字符串
    print(figureB.toStringAsFixed(2));
    // 返回figureB保留几位小数后精确结果的字符串
    print(figureB.toStringAsPrecision(3));
```

#### 数据类型的API

##### int

```dart
    int figureC = 31;
    // figureC对比其他整数，0:相同、1:大于、-1:小于
    print(figureC.compareTo(20));
    // 将figureC控制在指定区间的整数
    print(figureC.clamp(20, 25));
    // 返回figureC转换成指定基数(进制)的字符串
    print(figureC.toRadixString(16));

    int figureD = 12;
    // 返回figureD与其他整数的最大公约数
    print(figureD.gcd(18));
    // 返回figureDg与其他整数的截取余数
    print(figureD.remainder(18));
    // 返回figureD几次幂值的字符串
    print(figureD.toStringAsExponential(2));
```

##### 字符串

**dart特有**：三个单引号或三个双引号，

```dart
// 使用三个单引号或三个双引号 创建多行字符串,保留内在格式，如换行和缩进等，里面写什么输出就是什么。
    String e = '''asd
     fdsd
       fff
    
    ''';
```

**字符串常用属性**

```dart
    String a20 = "aaaa";
    String a21 = "";
    print(a20.length);//4  字符串长度
    print(a20.isEmpty);//false    是否为空
    print(a20.isNotEmpty);//true   是否不为空
    print(a21.isEmpty);//true
    print(a21.isNotEmpty);//false
```

**字符串连接**

```dart
    String a = "abcdefg";
    String b = '12345';
    String c = a + b; //使用+号连接
    String d = 'aaa' 'bbb'; //使用相邻空格符号连接，必须是两个字符串  不能是变量
    print(c); //abcdefg12345
    print(d); //aaabbb
```

**字符串模板**

使用${} 将一个字符串变量嵌入到另一个字符串内

```dart
    String a1 = "aa";
    String b1 = "bb${a1}bb";
    print(b1); //bbaabb
    String b2 = "bb${a1.toUpperCase()}bb";
    print(b2); //bbAAbb
```

**字符串切割**

```dart
    String a2 = "aaabbb";
    print(a2.substring(0, 2)); //aa   含头不含尾
    print(a2.substring(3)); //bbb  从指定index至末尾
    String a5 = "a,d,d  d,c,,";
    List<String> a6 = a5.split(",");//使用，分割，返回的是一个数组
    print(a6.length); //6
    print(a6); //[a, d, d  d, c, , ]

    String a8 = "a b,c";
    String a7 = a8.splitMapJoin(",",//查询“，”,用onMatch的返回值替换“，”用onNonMatch的返回值替换其他
        onMatch: (Match match) {
          return "a";
        }, onNonMatch: (String nonMatch) {
          return "b";
        });
    print(a7);//bab    a b,c  =>   bab
```

**字符串判断 **

是否包含或以xxx开始结束等

```dart
    String a3 = "aaabbbccc";
    print(a3.startsWith("aa")); //true
    print(a3.startsWith("aa", 3)); //false  从index=3开始判断
    print(a3.endsWith("c")); //true
    print(a3.contains("ab")); //true
    print(a3.contains("ac")); //false
    print(a3.contains("ab", 3)); //false  从index=3开始判断
```

**字符串替换**

```dart
    String a4 = "abcdeab";
    print(a4.replaceAll("ab","cc"));//cccdecc  替换全部符合条件的
    print(a4.replaceFirst("ab", "dd"));//ddcdeab  只替换第一个符合条件的
    print(a4.replaceFirst("ab", "dd",3));//abcdedd  从index=3开始  替换第一个
符合条件的
    print(a4.replaceRange(1, 3, "z"));// 范围替换 从0-3  含0不含3
    print(a4.replaceAllMapped("c", (Match match){//abyydeab  用方法返回值
替换指定的字符串
      return "yy";
    }));
    print(a4.replaceFirstMapped("b", (Match match){//abcdea333  从index=2开始 用方法返回值替换指定的字符串
      return "333";
    },2));
```

**字符串查找**

```dart
    String a9 = "aababcc1bc23";
    print(a9.indexOf("ab"));//1  第一个符合条件的index
    print(a9.indexOf("ab",2));//3   从index=2开始往后找
    print(a9.indexOf("ab",4));//-1   从index=4开始往后找，找不到返回-1
    print(a9.lastIndexOf("bc"));//8  从后往前找   返回第一个符合条件的index
    print(a9.lastIndexOf("bc",3));//-1  从后往前找  从index=3开始找  返回第一个符合条件的index  找不到返回-1
    print(a9.lastIndexOf("bc",7));//4  从后往前找  从index=7开始找  返回第一个符合条件的index
```

**转换为大小写**

```dart
    String a10 = "aaBBCc";
    print(a10.toLowerCase());//aabbcc
    print(a10.toUpperCase());//AABBCC
```

**去除空格**

```dart
    String a11 = "  aab  bcc  ";
    print(a11);//   aab  bcc
    print(a11.trim());//aab  bcc    去除左右两边空格
    print(a11.trimRight());//   aab  bcc   去除右边空格
    print(a11.trimLeft());// aab  bcc   //去除左边空格
```

**补齐长度 剩余位使用指定字符串替换**

```dart
    String a13 = "111";
    print(a13.padLeft(6));//   111     剩余3个位  默认使用""补齐
    print(a13.padRight(6,"c"));  //111ccc    剩余3个位   指定使用"c"
    print(a13.padRight(6,"dd"));  //111dddddd  剩余3个位   每个位指定使用"dd"   替换后总长度不是6
    print(a13.padLeft(2,"e"));//111    如果指定长度小于原字符串长度   返回原字符串
```

**字符串先后比较**

```dart
    String a12 = "bbcc";
    print(a12.compareTo("aaa"));//1   在ascii码中 b>a
    print(a12.compareTo("bbcc"));//0
    print(a12.compareTo("dd"));//-1    在ascii码中 b<d
```

##### List

```dart
List ListFollow = [1,2,3];
ListFollow.add(9);
list5[1] = 4;
```

大致简单介绍有以下方法可用，[具体参考](https://www.jianshu.com/p/df225c203e96)

addAll() 两个List合并

insert(index,element) 在指定index处插入值

insertAll(index,list) 在指定index处插入list 其余顺延

followedBy(list) 将自身和参数内list合成一个List

remove(item) 删除具体的元素
removeAt(index) 删除索引位置元素

emoveLast()删除末尾元素
removeRange(start,end) 范围删除
removeWhere() 根据条件删除

clear() 清空数组

修改指定index位置的值

setRange(startIndex,endIndex,list) 范围修改List的值

replaceRange(start,end,list)范围替换 含头不含尾

fillRange(start,end,value) 从start-end 每个元素用value替换

retainWhere(()=>(bool)) 根据条件筛选元素

setAll(index,list) 从index开始，使用list内的元素逐个替换本list中的元素

查看index位置的值

indexOf(element,[start]) 查找指定元素在list中的索引

any((element)=>(bool)) 判断List中是否有任意一个元素符合给定的参数

every((element)=>(bool)) 判断List中是否每个元素都符合参数函数

contains(obj) List中是否存在给定的obj

firstWhere((element)=>(bool)) 返回第一个满足条件的元素（不是元素的index）

遍历

```dart
ListFollow.forEach((item) {
 print(item);
});
```

##### Map

***注意：这里的map，与js中的map完全不一样***

新增/修改一个key-value

```dart
Map<String,int> map7 = {"a":1,"b":2,"c":3,"d":4,"e":5};
// 新增一个key value
map7["f"] = 6;
// 修改一个key的value
map7["a"] = 11;
// update() 对指定的key的value做出修改
int result3 = map7.update("c", (value)=>(value*2));
print(result3); // 6
```

updateAll() 根据参数函数的规则，批量修改map

```dart
 Map<String,int> map24 = {"a":1,"b":2,"c":3};
 map24.updateAll((String key,int value){
    return value*2;
 });
 print(map24);//{a: 2, b: 4, c: 6}
```

remove() 删除一个key

```dart
map24.remove("c");
```

removeWhere() 根据条件批量删除

```dart
map7.removeWhere((key,value)=>(value>3));
```

containsKey() 是否包含key

```dart
print(map7.containsKey("d"));
```

containsValue() 是否包含value值,同上

forEach() 遍历

```dart
 Map<String,int> map12 = {"a":1,"b":2,"c":3,"d":4,"e":5}; 
map12.forEach((String key,int value){
  print("$key  $value");
}
```

clear() 清空map

addAll() 整体合并另一个map 泛型要一致

```dart
map12.addAll(map7) 
```

**dart特有：合并map并去重**

addEntries() 合并两个map 如果key有重复，被合并的map的value覆盖前者

```dart
 Map<String,int> map26 = {"a":1,"b":2,"c":3};
 Map<String,int> map27 = {"a":1,"b":4,"d":3,"e":5};
 map26.addEntries(map27.entries);
```

**给属性补数据**

putIfAbsent() 存在key就获取值，不存在则添加到map ，返回值为属性值

```
Map<String,int> map18 = {"a":1,"b":2,"c":3};
int result = map18.putIfAbsent("a", ()=>(2));//存在   返回值1
int result2 = map18.putIfAbsent("d", ()=>(2));//不存在  返回值2
```

