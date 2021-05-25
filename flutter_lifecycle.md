### flutter_widget生命周期

组件的生命周期分为有状态和无状态；

#### 无状态Widget

1. **整个周期所定义的状态不会发生变化**
2. **所创建的函数只会运行一次**



#### 有状态Widget

![5d357d4d0001a7b709601518](flutter_lifecycle.assets/5d357d4d0001a7b709601518.jpg)

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

