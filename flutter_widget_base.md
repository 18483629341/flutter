

| 版本修正人 | 版本修正日期 | 版本修正内容         |
| ---------- | ------------ | -------------------- |
| 陈佳       | 2021/02/05   | Flutter  widget base |
| 陈佳       | 2021/02/18   | widget常用属性       |
|            |              |                      |



## Flutter  widget base

### Flutter  widget概况

Android是由google公司开发的支持移动端的系统，主流系统之一；

Flutter也是由google公司开发的，同出一家，它可与Android系统实现**无缝对接**；

Flutter 的核心思想就是用 widget 构建你的 UI 。并且它提供了一套丰富、强大的基础 widget 。

**widget**

将 widget 想象为一个可视化组件或与应用可视化方面交互的组件，同 view 可视化控件不同的是，widget 不是一个控件，而是对控件的描述，

**everything is widget **

在Flutter框架中,Widget代表最基础的部分,相当于是应用程序的基石.引用一句话“万物皆是Widget”,就能看出Widget的重要性不言而喻

widgets参考：[Widgets](https://flutterchina.club/widgets/)

**原始widget**

将一个widget传递给**runApp**函数就能构成一个最简单的Flutter程序.

```dart
import 'package:flutter/material.dart'; //安卓类型的风格库

void main() {
  runApp(
    new Center(
      child: new Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```

**常用的Widget**

1.`Text`:文本格式的widget
2.`Row,Column`:类似web开发中的盒模型FlexBox,让你可以在水平或者垂直方向上灵活布局。
3.`Stack`:取代线性布局,Stack允许子widget堆叠,你可以使用**Positioned**来定位他们相对于Stack的上左下右四条边的位置。
4.`Container`:**它可以让你创建一个矩形元素.它可以被装饰为一个**BoxDecoration**,如background、一个边框或者一个阴影。它同样具有margins、padding和应用于其大小的约束constraints。

5.`Divider`/`SizedBox `  分割区域，如：SizedBox(height: 30.0)，就会产生高度30个单位的空白区域。

### **Widget 状态**

在 flutter 中，widget 是不可变的，你需要去操纵 widget 的 state。widget 有状态跟无状态的区分。

[^演示快捷有无状态 StatelessWidget以及它们之间的切换]: 

*无状态 StatelessWidget*

StatelessWidget ( 无状态的 widget ) 在你构建初始化后不再进行改变。

```dart
class AppDemo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter'),
      ),
      body: Center(
        child: Text('content'),
      ),
        );
  }
}
```

例如上面例子，代码中的 `child: new Text('content')` 这个内容 content 不会变。那么我们就可以用 StatelessWidget 的 Text 。假如我们点击按钮后希望内容改变，我们就需要了解下有状态的 widget 。

*有状态 StatefulWidget*

StatefulWidget ( 有状态的 widget ) 拥有一个 state 对象来存储它的状态数据，并在 widget 树重建时携带着它，因此状态不会丢失。一个 StatefulWidget 类对应一个 state 类，state 是与对应 StatefulWidget 维护的状态，

当 state 被改变时，调用 `setState()` 方法通知 flutter framework 状态发生改变，重新调用 `build` 方法构建 widget 树，来进行更新操作，看下面实例。

```dart
class AppDemo extends StatefulWidget {
    @override
    createState() => _AppDemoState();
}

class _AppDemoState extends State<AppDemo> {
    String _content = "content";
    void _updateContent() {
        setState((){
            _content = "flutter content";
        });
    }
    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title: TextPage(title: 'flutter',),
        ),
        body: Center(
            child: Text(_content),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: _updateContent,
        child: Icon(Icons.mode_edit),
      ),
    );
  }
}
```

当点击按钮后，显示的内容就会更改为 flutter content



### Material Components Widgets

[官网介绍](https://flutterchina.club/widgets/material/)

#### App结构和导航



`Scaffold`  Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API

`Appbar`    一个Material Design应用程序栏，由工具栏和其他可能的widget（如TabBar和FlexibleSpaceBar）组成。

 `BottomNavigationBar`    底部导航条，可以很容易地在tap之间切换和浏览顶级视图。

`Drawer`  从Scaffold边缘水平滑动以显示应用程序中导航链接的Material Design面板。

`TabBar`   一个显示水平选项卡的Material Design widget。

 `Center`    属于 layout widget. 随child元素内容，大小而变化，在中心位置展示。

`Column`   属于 layout widget, 让子元素内容垂直排列。

以下demo帮助理解一下

![image-20210203182351935](flutter_widget.assets/image-20210203182351935.png)

<details>
  <summary>Center垂直布局</summary>
  <pre><blockcode> 
     return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '1',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
                child: Text("open new route", style: Theme.of(context).textTheme.display2),
            )
          ],
        ),
      ),
#### Widget 常用属性

![13946897-11466c2c744cec35](flutter_widget_base.assets/13946897-11466c2c744cec35.webp)

**`Scaffold.appBar` 中的属性，指向头部**

![13946897-48ed2669f310b7c9](flutter_widget_base.assets/13946897-48ed2669f310b7c9.webp)

 `title`属性，传入`Text ()`实例

 `leading`属性

 `action`属性

 `bottom`属性，传入`TabBar ()`实例

`centerTitle`属性，是否居中对齐

```dart
centerTitle: true,
```

**`Scaffold.draw` 属性**

一般将 `Draw()` 作为参数传入，此时 `Scaffold` 会自动将 `AppBar` 的 `leading` 设置为菜单按钮，点击便可打开抽屉菜单。

**通用属性`style`属性**  组件渲染样式的属性



```dart
 Text(
    'Hello Flutter',
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.0,
      color:Colors.grey[600],
    ),
```

**通用属性`color`属性**  一般指渲染颜色的属性

为了简化属性，有的组件中指的是字体的颜色(如上)：

*注意，在有的组件下面指主题风格：*

```dart
RaisedButton(
  child: Text(" RaisedButton"),
  color: Colors.blue,
  onPressed: (){
    print('321茄子');
  },
),
```

*在有的地方是指背景的颜色:*

![image-20210207095850189](flutter_widget_base.assets/image-20210207095850189.png)

**通用属性`padding`属性**    与css中的padding雷同

**通用属性`margin`属性**    与css中的margin雷同

**通用属性`child`属性**    接收一个子widget作的属性

```dart
Center(
        child: Text("按钮")
 )
```

**Row和Column`children`属性**   接收几个widget的属性

**Row和Column`mainAxisAlignment`属性**   主轴对齐方式，默认此 start

**Row和Column`crossAxisAlignment`属性**   次轴对齐方式， 默认此 center

```dart
 Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
       Text(
         'You have pushed the button this many times:',
      ),
      Text(
        '1',
        style: Theme.of(context).textTheme.display1,
       ),
    ]
 )
```

**Button`onPressed`属性**  当按钮被pressed触发事件时，接收函数

```dart
FlatButton(
  onPressed: (){
    print('hello')
  }
)
```

#### 排列widget

body    内容主体的最大容器

​     `Row`   属于 layout widget, 让子元素内容水平排列

​     `Column`    

​     `Center`  

​     `Container`   

`Row`和`Column`组件其实和web/rn中的`Flex布局`（弹性盒子）特别相似，或者我们可以就这么理解。都有有主轴摆放 和 次轴摆放的配置

​     mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 默认此 start
​     crossAxisAlignment: CrossAxisAlignment.center,// 默认此 center

![image-20210204102421524](flutter_widget.assets/image-20210204102421524.png)

<details>   
    <summary>demo水平布局</summary>   
    <pre><blockcode>       
   return Scaffold(
      appBar: AppBar(
        title:Text("米斯特五"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body:Row(
        // 行内摆放：横向摆放  纵向摆放
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 默认此 start
        crossAxisAlignment: CrossAxisAlignment.center,// 默认此 center
        children: <Widget>[
          Text("米斯特五"),
          FlatButton(
            onPressed: (){},
            color: Colors.orange,
            child:Text("按钮")
          ),
          Container(
            color: Colors.cyan,
            padding: EdgeInsets.all(10.0),
            child: Text("这是contaner"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("按钮3"),
        backgroundColor: Colors.cyan[600],
      ),
    );
    </blockcode></pre> </details>

让`Row`换成`Column`，将会

<img src="flutter_widget.assets/image-20210204105407861.png" alt="image-20210204105407861" style="zoom:80%;" />

#### 基础组件

##### 按钮

`RaisedButton`  Material Design中的button， 一个凸起的材质矩形按钮。

`FlatButton`  一个扁平的Material按钮。

`IconButton`  一个Material图标按钮，点击时会有水波动画。

`FloatingActionButton`  一个圆形图标按钮，它悬停在内容之上，以展示应用程序中的主要动作。

`ButtonBar`  水平排列的按钮组。

![image-20210204113747056](flutter_widget.assets/image-20210204113747056.png

<img src="flutter_widget.assets/image-20210204133817400.png" alt="image-20210204133817400" style="zoom:80%;" />

<details>   
    <summary>各种按钮</summary>   
    <pre><blockcode>       
   return Scaffold(
      appBar: AppBar(
        title:Text("各种按钮"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(" RaisedButton"),
            color: Colors.blue,
            onPressed: (){
              print('321茄子');
            },
          ),
          Text('RaisedButton'),
          RaisedButton.icon(
            icon: Icon(Icons.mail),
            label: Text("mail"),
            color: Colors.blue,
            onPressed: (){
            },
          ),
          Text('RaisedButton.icon'),
          FlatButton(
            child: Text("FlatButton"),
            color: Colors.blue,
            onPressed: (){
            },
          ),
          Text('FlatButton'),
          IconButton(
            icon: Icon(Icons.add_call),
            color: Colors.blue,
            onPressed: (){
              print('321茄子');
            },
          ),
           Text('IconButton'),
          Icon(
            Icons.add_a_photo,
            color: Colors.blue,
            size: 30.00,
          ),
          Text('Icon'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_a_photo,
                color: Colors.blue,
                size: 30.00,
              ),
              Icon(
                Icons.access_alarms,
                color: Colors.blue,
                size: 30.00,
              ),
              Icon(
                Icons.airplay,
                color: Colors.blue,
                size: 30.00,
              ),
            ],
          ),
          Text('ButtonBar'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("浮动btn"),
        backgroundColor: Colors.cyan[600],
      ),
    );.
    </blockcode></pre> </details>

##### 输入框和选择框

简介如下，[查看官网](https://flutterchina.club/widgets/material/)

![image-20210204134732630](flutter_widget.assets/image-20210204134732630.png)

参数和具体配体配置，内容太过繁琐，不再列举：

![image-20210204163108476](flutter_widget.assets/image-20210204163108476.png)

<details>   
    <summary>demo代码</summary>   
    <pre><code>       
  String name= '';
  dynamic  groupValue='';
  bool hasA = false;
  bool hasB = false;
  bool isOpen = false;
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    print(this.groupValue);
    print(this.hasA);
    return Scaffold(
      appBar: AppBar(
        title:Text("各种按钮"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[
          Text('无设置的TextFiled',textAlign: TextAlign.left,),
          TextField(),
          Text('number的TextFiled',textAlign: TextAlign.left,),
          TextField(
            keyboardType: TextInputType.number,// 确定输入字符串的类型，有text/number/emailAddress/visiblePassword
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.text_fields),
              labelText: '年龄',
              helperText: '请输入你的年龄',
            ),
            onChanged: (String str) {
              setState(() {
                this.name = str;
              });
              print(this.name);
            },
            autofocus: false,
          ),
          Text('单选框选择一个方向:',textAlign: TextAlign.left,),
          Row(
            children: [
              Row(
                ///包裹子布局
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    ///此单选框绑定的值 必选参数
                    value: "flutter",
                    ///当前组中这选定的值  必选参数
                    groupValue: groupValue,
                    ///点击状态改变时的回调 必选参数
                    onChanged: (v) {
                      setState(() {
                        this.groupValue = v;
                      });
                    },
                  ),
                  Text("flutter")
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: "dart",
                    groupValue: groupValue,
                    onChanged: (v) {
                      setState(() {
                        this.groupValue = v;
                      });
                    },
                  ),
                  Text("dart")
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: "andriod sdk",
                    groupValue: groupValue,
                    onChanged: (v) {
                      setState(() {
                        this.groupValue = v;
                      });
                    },
                  ),
                  Text("andriod sdk")
                ],
              ),
            ],
          ),
          Text('复选框，设置闹钟:',textAlign: TextAlign.left,),
          CheckboxListTile(
            secondary: const Icon(Icons.alarm_on),
            title: const Text('每天6：00 响铃'),
            subtitle: Text('12小时48分钟后响铃'),
            value: this.hasA,
            onChanged: (bool value) {
              setState(() {
                this.hasA = value;
              });
            },
          ),
          CheckboxListTile(
            secondary: const Icon(Icons.alarm_on),
            title: const Text('每天6：10 响铃'),
            subtitle: Text('12小时58分钟后响铃'),
            value: this.hasB,
            onChanged: (bool value) {
              setState(() {
                this.hasB = value;
              });
            },
          ),
          Switch(
            value: isCheck,
            onChanged: (isChecked) {
              setState(() {
                isCheck = isChecked;
              });
            },
            activeColor: Colors.green,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.red,
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
          SwitchListTile(
            value: isOpen,
            onChanged: (isChecked) {
              setState(() {
                isOpen = isChecked;
              });
            },
            activeColor: Colors.blue,
            activeTrackColor: Colors.blue,
            title: Text("启用摄像头"),
            subtitle: Text("移动端将有权访问摄像头"),
            secondary: Icon(Icons.settings),
            selected: true,
            //activeThumbImage: AssetImage("images/app.png"),
           // inactiveThumbImage: AssetImage("images/app.png"),
            isThreeLine: false,
          ),
        ],
      ),
    );
  } 
    </code></pre> 
</details>


##### 对话框、Alert、Panel

简介如下，[查看官网](https://flutterchina.club/widgets/material/)

![image-20210204134848859](flutter_widget.assets/image-20210204134848859.png)

##### 信息展示

简介如下，[查看官网](https://flutterchina.club/widgets/material/)



![image-20210204134948169](flutter_widget.assets/image-20210204134948169.png)

