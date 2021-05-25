| 版本修正人 | 版本修正日期 | 版本修正内容 |
| ---------- | ------------ | ------------ |
| 陈佳       | 2021/02/08   | flutter介绍  |
|            |              |              |
|            |              |              |



## Flutter

### 简介

Flutter是Google在2015年推出的移动UI框架，可快速在iOS和Android上构建高质量的原生用户界面。

### Flutter特点

- 快速开发

由于Flutter选用了Dart作为其开发语言，Dart既可以是AOT（Ahead Of Time）编译，也可以是JIT（Just In Time）编译，其JIT编译的特性使Flutter在开发阶段可以达到亚秒级有状态热重载，从而大大提升了开发效率。

- 性能优越

使用自带的高性能渲染引擎（Skia）进行自绘，渲染速度和用户体验堪比原生。

- 富有表现力的精美UI

Flutter内置众多精美的Material Design和Cupertino（iOS风格）小部件，开发者可快速构建精美的用户界面，以提供更好的用户体验。

### Flutter框架

Flutter系统架构图

### ![14594750-75a45d1b52ca12a0](flutter.assets/14594750-75a45d1b52ca12a0.webp)

如上图所示为Flutter官方给出的系统架构图，可以看出Flutter框架分为三层：Framework层、Engine层和Embedder层。

- Framework层：由Dart来实现，包含众多安卓Material风格和iOS Cupertino风格的Widgets小部件，还有渲染、动画、绘图和手势等。Framework包含日常开发所需要的大量API，普通应用开发熟悉这些API的使用基本OK了，不过很多特殊场景的控件需要自己根据实际情况进行自定义。

- Engine层：由C/C++实现，是Flutter的核心引擎，主要包括Skia图形引擎、Dart运行时环境Dart VM、Text文本渲染引擎等；如果想深入了解Flutter原理，建议阅读该层的源代码。

- Embedder层：主要处理一些平台相关的操作，如渲染Surface设置、本地插件、打包、线程设置等。

  

### Flutter原理

无论是iOS还是安卓都是提供一个平台的View给Flutter层，页面内容渲染交由Flutter层自身来完成，所以其相对React Native等框架性能更好。Flutter中图形渲染流程：

![14594750-e47084cd993e6339](flutter.assets/14594750-e47084cd993e6339.webp)

大致流程如下：

1. GPU的Vsync信号同步到UI线程

2. UI线程使用Dart来构建抽象的视图结构

3. 视图结构在GPU线程中进行图层合成

4. 合成后的视图数据提供给Skia图形引擎处理成GPU数据

5. 数据再通过OpenGL或Vulkan提供给GPU进行渲染

   

### 环境搭建

在其他文档，已有整理，参考地址：[Flutter环境搭建](https://onebox.huawei.com/#eSpaceGroupFile/1/369/3841771)

### 项目结构

![20181211103206350](flutter.assets/20181211103206350.png)

| 文件夹       | 作用                                                         |
| ------------ | ------------------------------------------------------------ |
| android      | 创建项目生成的Android原生代码                                |
| ios          | 创建项目生成的ios原生代码                                    |
| lib          | flutter相关代码，我们主要编写的代码就在这个文件夹            |
| test         | 创建项目自动生成的test文件，用于存放测试代码                 |
| pubspec.yaml | 重点)flutter包管理，我们依赖的包都在这里管理，类似于maven、gradle;flutter依赖包中国地址：https://pub.flutter-io.cn/ |

下面我们来一点点的看，大家可以新建一个Flutter项目对照原本的代码看。

**入口函数**
首先是入口函数，main方法就是入口函数，默认的箭头函数写法跟下面写法效果一致，返回一个widget，MyApp就是我们要展示的启动界面。

```dart
/*
* 入口函数
*
* */
void main() => runApp(MaterialApp(
  // home: Text("米斯特五")
    home: Home(),
));

class  Home extends StatelessWidget {
  ...
}
```

**如何运行项目**

1.开启虚拟模拟机

2.选中运行中虚拟模拟机

3.点击运行按钮 ▶

![image-20210207112755855](flutter.assets/image-20210207112755855.png)

4.只要含有有效的main()方法，皆可运行

### 热更新

@override：demo演示感受其作用，创建最简单结构的home.dart：

```dart
import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
 // home: Text("米斯特五")
    home: Scaffold(
      appBar: AppBar(
        title:Text("flutter"),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Flutter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("按钮"),
      ),
    )
));
```

然而，当我们`Text("flutter")`换成`Text("flutter go on ")`,  `ctrl`+`s` 保存，虚拟机的页面没有变化

我们需要当 `ctrl`+`s` 保存，虚拟机的页面随之刷新

我们需要如下调整：

创建无状态widget

```dart
class  Home extends StatelessWidget {
  @override //热更新关键代码
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("flutter"),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Flutter go on'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("按钮"),
      ),
    );
  }
}
```

当 `ctrl`+`s` 保存，虚拟机的页面随之刷新

### Widget

在其他文档，已有整理，参考地址：[flutter_widget_base](https://onebox.huawei.com/#eSpaceGroupFile/1/369/3841771)

### Widget应用

在其他文档，已有整理，参考地址：[flutter_widget_apply](https://onebox.huawei.com/#eSpaceGroupFile/1/369/3841771)

### 布局

在其他文档，已有整理，参考地址：[flutter_layout](https://onebox.huawei.com/#eSpaceGroupFile/1/369/3841771)

### Widget 生命周期

在其他文档，已有整理，参考地址：[flutter_lifecycle](https://onebox.huawei.com/#eSpaceGroupFile/1/369/3841771)

### flutter路由

在其他文档，已有整理，参考地址：[flutter_router](https://onebox.huawei.com/#eSpaceGroupFile/1/369/3841771)