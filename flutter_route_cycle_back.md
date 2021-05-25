### flutter_路由

#### 配置路由

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

####  路由跳转

比如：home页面->跳转至location页面,

```dart
Navigator.pushNamed(context, "/location");
```

#### 跳转携带数据

在loading页面跳转值home页面，并携带参数带会反射到home中

```dart
Navigator.pushNamed(context, '/home',arguments:{
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
   });
```

在新页面build() 中接住数据

### flutter_widget生命周期

组件的生命周期分为有状态和无状态；

#### 无状态Widget

1. **整个周期所定义的状态不会发生变化**
2. **所创建的函数只会运行一次**



#### 有状态Widget

![5d357d4d0001a7b709601518](flutter_route_cycle_back.assets/5d357d4d0001a7b709601518-1612505881670.jpg)

通过一个计数器 widget 的例子来理解有状态的widget的生命周期。

```dart
class CounterWidget extends StatefulWidget {
    CounterWidget({this.initCounter:0});
    final int initCounter;
    @override
    createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
    int _counter;
    @override
    void initState() {
        super.initState();
        _counter = widget.initCounter;
        print('***************initState $_counter***************');
    }
    @override
  Widget build(BuildContext context) {
      print('***************build***************');
    return Center(
        child: RaisedButton(
      child: Text('$_counter'),
      onPressed: ()=>setState(()=>++_counter),
    ),
   );
  }
  @override
    void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('***************didUpdateWidget***************');
  }
    @override
    void deactivate() {
        super.deactivate();
        print("***************deactive***************");
    }
    @override
    void dispose() {
        super.dispose();
        print("***************dispose***************");
    }
    @override
    void reassemble() {
        super.reassemble();
        print("***************reassemble***************");
    }
    @override
    void didChangeDependencies() {
        super.didChangeDependencies();
        print("***************didChangeDependencies***************");
    }
}
```

通过现象得结论：

*debug 启动运行结果：*

```
***************initState 0*************** 
***************didChangeDependencies***************
***************build***************
```

`initState` ：该 widiget 插入到 widget 树结构时被调用，只调用一次，因此，该函数一般用来初始化操作，状态初始化、订阅子树事件通知。

`didChangeDependencies()`：当调用 `initState` 后会立即调用这个方法，这个方法是在 state 对象被创建好了但没有准备好构建 `build` 的时候调用的。

`build` : 调用这个方法来构建 widget 子树。触发的时机较多如：调用 `initState()`、`didChangeDependencies()`、`setState()`、`didUpdateWidget()`等方法后重新 build。

*点击保存按钮执行结果：*

```
***************reassemble***************
***************didUpdateWidget***************
***************build***************
```

`reassemble()`：专门为了开发调试而提供的，在热重载时会被调用。

`didUpdateWidget()`：在 widget 重新构建时，由 flutter framework 判断检测 widget 树种同一位置新旧节点，决定是否更新，调用该方法。

*移除 CounterWidget 执行结果：*

```
***************reassemble***************
***************deactive***************
***************dispose***************    
```

`deactive`：当widget 对象从树中被移除时，会调用此方法。

`dispose `：当 widget 对象从树中被永久移除时调用 ，可以在此方法中释放资源。

*点击按钮执行结果：*

```
***************build***************
```



#### 更多场景的生命周期

https://m.imooc.com/article/289776

分几个场景学习一下 **Flutter** 的生命周期；

   小菜借助 **WidgetsBinding** 通过观察和监听 **didChangeAppLifecycleState** 来分析生命周期事件，与 **Android** 原生类似；

![5d357de6000112f822901222](flutter_route_cycle_back.assets/5d357de6000112f822901222.jpg)

### 基本场景

#### 1. 初始化

**initState -> didChangeDependencies -> build**

![5d357e9e0001144f08800140](flutter_route_cycle_back.assets/5d357e9e0001144f08800140.jpg)

#### 2. 页面数据更新

   小菜尝试页面按钮点击或弹框处理，均不会涉及生命周期变化，只是在 **build** 更新 **Widget** 资源；但是若进行 **热重载** 生命周期如下：

**reassemble -> didUpdateWidget -> build**

![5d357ebf00010d4e09260140](flutter_route_cycle_back.assets/5d357ebf00010d4e09260140.jpg)

#### 3. 横竖屏切换

**didUpdateWidget -> build -> didUpdateWidget -> build** (执行两次)

#### 4. 切至后台

**didChangeAppLifecycleState(AppLifecycleState.inactive) -> didChangeAppLifecycleState(AppLifecycleState.paused) -> build**

![5d357edc0001a62314520152](flutter_route_cycle_back.assets/5d357edc0001a62314520152.jpg)

#### 5. 切回前台

**didChangeAppLifecycleState(AppLifecycleState.inactive) -> didChangeAppLifecycleState(AppLifecycleState.resumed) -> build**

![5d357eee0001e4fd14800134](flutter_route_cycle_back.assets/5d357eee0001e4fd14800134.jpg)

#### 6. 销毁页面

**deactivate -> dispose**

<img src="flutter_lifecycle.assets/5d357f0000010dcf06260092.jpg" alt="5d357f0000010dcf06260092" style="zoom:67%;" />

### 进阶场景

#### 7. 打开新的页面

**新页面initState -> didChangeDependencies -> build -> 旧页面deactivate -> didChangeDependencies -> build** (新页面初始化+旧页面置于后台)

![img](https://img.mukewang.com/5d357f590001764b11080268.png)

#### 8. 新页面切至后台(旧页面未销毁)

**旧/新页面didChangeAppLifecycleState(AppLifecycleState.inactive) -> didChangeAppLifecycleState(AppLifecycleState.paused) -> build**
![img](https://img.mukewang.com/5d357f2a0001ec6216020280.png)

#### 9. 新页面切回前台

**旧/新页面didChangeAppLifecycleState(AppLifecycleState.inactive) -> didChangeAppLifecycleState(AppLifecycleState.resumed) -> build**

![img](https://img.mukewang.com/5d357f740001cbcd14720260.png)

#### 10. 新页面销毁

**旧页面deactivate -> build(AppLifecycleState.resumed) -> 新页面deactivate -> dispose**

![img](https://img.mukewang.com/5d357f8d00019d2311120176.png)

### 特殊场景

   小菜也尝试了一下 **Android7.0** 分屏情况下的生命周期；

#### 11. 进入分屏窗口

**didChangeAppLifecycleState(AppLifecycleState.inactive) -> didChangeAppLifecycleState(AppLifecycleState.paused) -> build** (与切至后台相同)
![img](https://img.mukewang.com/5d357fb80001081709241920.jpg)

![img](https://img.mukewang.com/5d357fcc0001a62314520152.png)

#### 12. 进行分屏

**didChangeAppLifecycleState(AppLifecycleState.inactive) -> didChangeAppLifecycleState(AppLifecycleState.resumed) -> didChangeAppLifecycleState(AppLifecycleState.inactive) -> build**
![img](https://img.mukewang.com/5d357fe40001b24f04320887.gif)

![img](https://img.mukewang.com/5d3580000001603514580182.png)

#### 13. 获取焦点

**didChangeAppLifecycleState(AppLifecycleState.resumed) -> build**

![img](https://img.mukewang.com/5d358010000153f514500090.png)

#### 14. 屏幕大小调整

   与 **Android** 不同，调整屏幕大小不会进行生命周期变化，前提是当前应用已获取焦点，若未获取焦点，则会在调整屏幕大小为全屏时进行获取焦点的生命周期方法；

### 小总结

1. 生命周期整体分为三个部分：**初始化 / 状态改变 / 销毁**；
2. **initState** 在整个生命周期中的初始化阶段只会调用一次；
3. **didChangeDependencies** 当 **State** 对象依赖发生变动时调用；
4. **didUpdateWidget** 当 **Widget** 状态发生改变时调用；实际上每次更新状态时，**Flutter** 会创建一个新的 **Widget**，并在该函数中进行新旧 **Widget** 对比；一般调用该方法之后会调用 **build**；
5. **reassemble** 只有在 **debug** 或 **热重载** 时调用；
6. **deactivate** 从 **Widget Tree** 中移除 **State** 对象时会调用，一般用在 **dispose** 之前；
7. **dispose** 用于 **Widget** 被销毁时，通常会在此方法中移除监听或清理数据等，整个生命周期只会执行一次；
8. **resumed** 应用程序可见且获取焦点状态，类似于 **Android onResume()**；
9. **inactive** 应用程序处于非活动状态；
10. **paused** 应用程序处于用户不可见，不响应用户状态，处于后台运行状态，类似于 **Android onPause()**；
    ![img](https://img.mukewang.com/5d357d4d0001a7b709601518.png)

   生命周期非常重要

#### 生命周期demo

location页面如下；

```dart
import 'package:flutter/material.dart';
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
   //   观察生命周期
   print("initState function run");
  }

  @override
  Widget build(BuildContext context) {
    print("build function run ");
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('选择一个国家'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter+=1;
          });
        },
        child: Text("counter is $counter"),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose function run ");
    super.dispose();
  }
} 
```

![image-20210203142751887](flutter_life_cycle.assets/image-20210203142751887.png)

当页面跳转进入location页面时，会执行initState()和 build（）

![image-20210203141613037](flutter_life_cycle.assets/image-20210203141613037.png)

点击按钮，触发事件对应的函数，将counter会＋1，数据发生变化。会执行build（）

![image-20210203142249696](flutter_life_cycle.assets/image-20210203142249696.png)

点击返回按钮，将会跳回home,location页面将销毁，会执行Dispose()

![image-20210203143010778](flutter_life_cycle.assets/image-20210203143010778.png)

创建并演示快捷生成，：

直接在Android Studio 中打开dart文件中输入s，将会出现下面的下拉框选项（如果没有出现可能是插件没有安装）：

![image-20210203111533976](flutter_life_cycle.assets/image-20210203111533976.png)



其中，stful是有状态的class，选中它，按下`enter`键，将直接创建一个不含类名的有状态组件类;

![image-20210203112333009](flutter_life_cycle.assets/image-20210203112333009.png)

然后在光标处，直接输入组件名，然后就会有一些对应的变化

<img src="flutter_life_cycle.assets/image-20210203112527560.png" alt="image-20210203112527560" style="zoom:90%;" />

无状态组件类的操作，同上；

