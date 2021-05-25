| 版本修正人 | 版本修正日期 | 版本修正内容          |
| ---------- | ------------ | --------------------- |
| 陈佳       | 2021/02/05   | flutter的基本路由介绍 |
|            |              |                       |
|            |              |                       |



## flutter_路由

### 配置路由

想在app中实现简单的两个路由

首先创建dart：

​      home页面对应的home.dart

​      location页面对应的location.dart

然后在main.dart中配置路由, 如下：

```dart
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/location.dart';

void main() => runApp(MaterialApp(
// app初始化路由导向home
initialRoute: "/home" ,
  routes: {
    "/":(context) => Home(), 
    "/home":(context) => Home(), // Home是指home.dart中的组件类名
    "/location":(context) => Location(),// Location是指location.dart中的组件类名
  },
));
```

这样，

​     app初始化路由导向home

​     app有两个静态路由，一个导向home，一个导向location

###  路由跳转

比如：home页面->跳转至location页面,

```dart
Navigator.pushNamed(context, "/location");
```

### 跳转携带数据

在loading页面跳转值home页面，并携带参数带会反射到home中

```dart
Navigator.pushNamed(context, '/home',arguments:{
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
   });
```

在新页面build() 中接住数据:

```dart
      body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(),
              FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, "/location");
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text(
                    'Edit Location',
                  ),
              ),
              SizedBox(height: 20.0),
              Text(
                    data['location'], // 传回数据
                    style: TextStyle(
                      fontSize:28,
                      letterSpacing: 1.0
                    ),
                  ),
              SizedBox(height: 20.0),
              Text(
                    data['time'],    // 传回数据
                    style: TextStyle(
                        fontSize:28,
                        letterSpacing: 1.0
                    ),
                  ),
              SizedBox(height: 20.0),
              Text(
                    data['flag'],   // 传回数据
                    style: TextStyle(
                        fontSize:28,
                        letterSpacing: 1.0
                    ),
                  ),
            ],
          ),
        )
```



