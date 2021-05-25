### 创建list

#### 最基础的列表：

使用方式，数组datas.map(渲染函数).toList()，

新建list.dart

```dart
class _HomeState extends State<Home> {
  List<String> datas = [
    "Hello world",
    "Hello flutter",
    "Hello Mr wu",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("列表"),
          centerTitle: true,
        ),
        body: Column(
//          children: <Widget>[
//            Text("Hello world"),
//            Text("Hello flutter"),
//          ],
//          children: datas.map((data){
//             return Text(data);
//           }).toList(),
            // 简写如下
          children: datas.map((data) => Text(data)).toList(),
        )
    );
  }
}
```

![image-20210205170528489](flutter_list_http.assets/image-20210205170528489.png)

列表中添加下拉刷新

listView



#### 对象列表

然而，通常渲染的方式为对象数组，于是对象类型需要定义，创建datas.dart:

```dart
// 对象类
class Datas{
  String text;
  String author;
  Datas({this.text, this.author});
}
```

引入至文件list.dart中

```dart
import 'datas.dart';
```

将简单列表换为复杂的对象列表：

```dart
  // 初始化对象数组
  // 数组<数据类> 对象数组 
  List<Datas> datas=[
    Datas(text: "hello world",author: "Mr wu"),
    Datas(text: "hello flutter",author: "Miss liu"),
    Datas(text: "hello dart",author: "Mrs yu"),
  ];
```

然后渲染部分修改成 item属性

```dart
body: Column(
    children: datas.map((data) => Text('${data.author}:${data.text}')).toList(),
 )
```

![image-20210205172027877](flutter_list_http.assets/image-20210205172027877.png)



#### 滚动列表

如果想要跟好看的效果，可以别的widget，传入需要的参数展示即可！

这里的表现其实就相当于有一个固定长度的容器，然后超出的内容是不可见的，只有当你向上或向下滑动屏幕时，视窗外看不见的内容才会出现在视窗中。如果在 web 开发时，是需要容器加上样式

```dart
overflow: auto;
```

要想用 Flutter 实现，其实也是很简单的，因为 Flutter 为我们提供了 ListView 组件。

ListView 主要有以下几种使用方式

- ListView
- ListView.builder
- ListView.separated
- ListView.custom

##### ListView

ListView 是最简单直接的方式，简单，那么适用的场景也是简单的。仅适用于内容较少的情形，因为它是一次性渲染所有的 items ，当 items 的数目较多时，很容易出现卡顿现象的，导致滑动不流畅。 你可以试试加大下面 items 的大小，然后对比一下体验效果。

```dart
class ListViewDemo extends StatelessWidget {
  final _items = List<Widget>.generate(10,
      (i) => Container(padding: EdgeInsets.all(16.0), child: Text("Item $i")));
 
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _items,
    );
  }
}
```

##### ListView.builder()

构造函数 builder 要求传入两个参数，`itemCount` 和 `itemBuilder` 。前者规定列表数目的多少，后者决定了每个列表如何渲染。跟 ListView 不同的点在于，这是懒加载的，假如有 1000 个列表，初始渲染时并不会所有都渲染，而只会特定数量的 item ，这对于性能和用户体验来说，是很好的提升。 你可以对比用 ListView 和用 ListView.builder 渲染 1000 个列表时，体验是否有差别。

```dart
class ListViewDemo extends StatelessWidget {
  final _items = List<String>.generate(1000, (i) => "Item $i");
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, idx) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Text(_items[idx]),
        );
      },
    );
  }
}

```

##### ListView.separated()

separated 相比较于 builder，又多了一个参数 `separatorBuilder` ，用于控制列表各个元素的间隔如何渲染。比如，我们需要列表的每个 item 之间有一个分割线，就可以跟下面那样，加一个 Divider 组件。

```
class ListViewDemo extends StatelessWidget {
  final _items = List<String>.generate(1000, (i) => "Item $i");
 
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 1000,
      itemBuilder: (context, idx) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Text(_items[idx]),
        );
      },
      separatorBuilder: (context, idx) {
        return Divider();
      },
    );
  }
}
```

##### ListView.custom()

custom，就跟名字一样，让我们自定义。必须的参数就是 `childrenDelegate` , 然后传入一个 实现了 `SliverChildDelegate` 的组件，如 `SliverChildListDelegate` 和 `SliverChildBuilderDelegate` 。

`SliverChildListDelegate` 接收跟 ListView 一样的 `children`，而 `SliverChildBuilderDelegate` 接收跟 ListView.builder 的 `itemBuilder` 一样类型的函数。

正常来说，前面三个已经可以满足我们的日常使用需求了，无需自定义。

### 自定义widget

仍然，在list.dart文件中，build函数上方创建widget文件，data_card.dart：

```dart
import 'package:flutter/material.dart';
import 'datas.dart';

// DataCard为该widget名称
class DataCard extends StatelessWidget {
    // 属性声明
  Datas data;
    // 类与属性绑定
  DataCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              data.text,
              style: TextStyle(
                fontSize: 18.0,
                color:Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              data.author,
              style: TextStyle(
                fontSize: 14.0,
                color:Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


```

引入至文件list.dart中

```dart
import 'data_card.dart';
```

Text换成DataCard引入至文件list.dart中

```dart
 children: datas.map((data) => DataCard(data:data)).toList(),
```

将简单列表换为复杂的对象列表：

![image-20210205174906790](flutter_list_http.assets/image-20210205174906790.png)

### 事件传递

父元素事件传递到子组件：父元素中定义事件对应的方法，子组件在事件触发时调用该方法

1.父元素中，传递事件对应的方法delete（）：

```dart
children: datas.map((data) => DataCard(
  data:data,
  delete:(){
    setState(() {
      datas.remove(data);
    });
  }
 )).toList(),
```

2.子元素添加属性，以及函数构造中添加属性中

```dart
Function delete;
//  DataCard(this.data,this.delete);
DataCard({this.data,this.delete});
```

3.子组件在事件触发时调用该方法

```dart
FlatButton.icon(
  onPressed: delete,
  label: Text('删除'),
  icon: Icon(Icons.delete)
),
```

