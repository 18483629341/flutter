

| 版本修正人 | 版本修正日期 | 版本修正内容    |
| ---------- | ------------ | --------------- |
| 陈佳       | 2021/02/05   | flutter布局汇总 |
|            |              |                 |
|            |              |                 |



#### 布局

[**截图如下**，布局参考](https://flutterchina.club/widgets/layout/)

##### 拥有单个子元素的布局widget

常用的布局，列举部分：

![image-20210204140435782](flutter_layout.assets/image-20210204140435782.png)

##### 拥有多个子元素的布局widget

常用的布局，列举部分：

![image-20210204140739814](flutter_layout.assets/image-20210204140739814.png)

截图如下，[查看官网](https://flutterchina.club/widgets/material/)       

![image-20210204141121351](flutter_layout.assets/image-20210204141121351.png)

##### flex弹性布局

当页面布局时，需要更加灵活的方式时，可用弹性布局；

`Expanded`    当多个此元素在一行显示时，其宽度占比可采用flex控制

```dart
Row(
  children: <Widget>[
      Expanded(
      flex:3,
      child: Image.asset('assets/image2.jpg')
    ),// 宽度占比为 3/(3+6+3+2)
    Expanded(
      flex:6,
      child: Container()
    ),// 宽度占比为  6/(3+6+3+2)
    Expanded(
      flex:3,
      child: Container()
    ), // 宽度占比为  3/(3+6+3+2)
    Expanded(
      flex:2,
      child: Container()
    )] // 宽度占比为  2/(3+6+3+2)
```

![img](flutter_layout.assets/089CDFC7-46B0-4DD1-BB06-E09D50370EE9.png)