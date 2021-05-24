// 定义函数
// 函数传参
// 函数返回值
// 函数默认返回值
// 箭头函数无返回值
// 箭头函数有返回值
// 函数传参(可选参数)
// 函数参数 命名 赋默认值
void main(args) {
  // 函数：具有一定功能的代码段
  int sum=sumValue(4, 6);
  print(sum); 

  // sumValue(9, 8);

  // printCities('成都','昆明','香格里拉');
  printCouties('中国','法国');

  findVolume( 10, 11);
}

// 2.函数传参
// void sumValue(int a,int b) {
//   int sum= a + b;
//   print("a+b的和为：$sum"); 
// }

// 3.函数返回值
// int sumValue(int a,int b) {
//   int sum= a + b;
//   return sum;
// }

// 4.函数默认返回值
//int sumValue(int a,int b) {
//   int sum= a + b;
//   print(sum); 
// }


// 5.箭头函数无返回值
// sumValue(int a, int b)=>print(a + b);

// 6.箭头函数有返回值
int sumValue(int a, int b)=>a + b;

// 7.函数传参(可选参数)
void printCities(String name1,String name2,String name3) {
  print("美丽的城市:$name1");
  print("美丽的城市:$name2");
  print("美丽的城市:$name3");
}

void printCouties(String name1,String name2,[String name3]) {
  print("文明国家有:$name1");
  print("文明国家有:$name2");
  name3?? print('');

}

// 9.函数参数 命名 赋默认值
void findVolume(int width,int lenth, {int height = 20}) {
  print("width:$width m");
  print("lenth:$lenth m");
  print("height:$height m");
}
