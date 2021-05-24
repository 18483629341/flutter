void main() {
  // int a=10
  // print('hello world');
  // try {
  //   int result = 12 ~/ 0;
  //   print('result is $result');

  // } catch(e,s){
  //   print("The exception throw id $e");
  //   print('STACK CATCH $s');
  // }

  print("case 5");
  try {
   depositMoney(-1);
  } catch(e){
    // print("err is $e");
    print(e.errorMessage());
  }
}

// 实现异常的方法
class DepositException implements Exception{
  String errorMessage(){
    return "金额不能少于0元";
  }
}

void depositMoney(int amount){
  if(amount<0){
    throw new DepositException();
  }
}