| 版本修正人 | 版本修正日期 | 版本修正内容                              |
| ---------- | ------------ | ----------------------------------------- |
| 陈佳       | 2021/02/05   | 引入图片/字体图标/http/异常处理/dart_time |
|            |              |                                           |
|            |              |                                           |





## Flutter  widget apply

### List展示与http数据加载

在其他文档，已有整理，参考地址：[flutter_list_http](https://onebox.huawei.com/#eSpaceGroupFile/1/369/3841771)

### 引入图片

1.保存图片至文件夹中，建议在assets中：

![image-20210204193453419](flutter_widget_apply.assets/image-20210204193453419.png)

2.开放出pubspec.yaml中对flutter的配置：

```yaml
flutter:
    - assets/image1.jpg
    - assets/image2.jpg
    - assets/image3.jpg
    - assets/image4.jpg
```

点击`Pub get`/`Package get`按钮，项目更新依赖

![image-20210205153308814](flutter_widget_apply.assets/image-20210205153308814.png)

3.在dart文件中引入jpg文件，很多组件都可以像下面以下引入：

```dart
Expanded(
  flex:3,
  child:Image.asset('assets/image1.jpg')
),
// 圆角展示
child: CircleAvatar(
    backgroundImage: AssetImage("assets/image2.jpg"),
    radius: 40.0,
 )
```

### 引入自定义字体图标

1.在阿里巴巴矢量图中，选择图标,

2.保存字体文件至文件夹中，建议在assets中

![image-20210204205631348](flutter_widget_apply.assets/image-20210204205631348.png)

3.开放出pubspec.yaml中对flutter的配置：

![image-20210204204252427](flutter_widget_apply.assets/image-20210204204252427.png)、

点击`Pub get`/`Package get`按钮，项目更新依赖

4.自定义my_icon.dart文件

```dart
import 'package:flutter/widgets.dart';

class MyIcons {
  static const _kFontFam  = 'MyIcons'; // 与自定义字体名称一致
  static const _kFontPkg = null;
  static const IconData qq = IconData(59790, fontFamily: _kFontFam, fontPackage: _kFontPkg)// qq为某个图标的名称  参数1 中的编号在iconfont.json中
  static const IconData weibo = IconData(59788, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
```

5.在dart文件中引入jpg文件，很多组件都可以像下面以下引入：

```dart
Column(
  children: <Widget>[
    Icon(MyIcons.qq),
    Icon(MyIcons.weibo),
    buildPieChatWidget(),
 ],
)
```

![image-20210204205221884](flutter_widget_apply.assets/image-20210204205221884.png)



### 引入字体

1.下载合适的字体

参考地址：http://googlefonts.net

2.保存字体文件至文件夹中，建议在assets中(同上)

3.开放出pubspec.yaml中对flutter的配置（同上）

4.引用

```dart
// 全局引用
MaterialApp(
  theme: ThemeData(fontFamily: 'Raleway'),
  home: MyHomePage(),
);
// 局部引用
Text(
  'Roboto Mono sample',
  style: TextStyle(fontFamily: 'RobotoMono'),
);
```

### 网络请求Dio

#### Dio相关

> dio是一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时、自定义适配器等…

- 添加依赖，注意3.0.+是不兼容升级

```dart
dependencies:
  dio: ^3.0.9
```

- 一个极简示例

```dart
import 'package:dio/dio.dart';
void getHttp() async {
  try {
    Response response = await Dio().get("http://www.baidu.com");
    print(response);
  } catch (e) {
    print(e);
  }
}
```



#### 封装开始

- 网络请求是经常会用到的，所以直接来一个单例，新建一个名为httpUtil的文件

```dart
class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = new CancelToken();

  static HttpUtil getInstance() {
    if (null == instance) instance = new HttpUtil();
    return instance;
  }
}
```

- 配置和初始化Dio

```DART
  /*
   * config it and create
   */
  HttpUtil() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = new BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: "http://www.google.com",
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      headers: {
        //do something
        "version": "1.0.0"
      },
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      contentType: Headers.formUrlEncodedContentType,
      //表示期望以那种格式(方式)接受响应数据。接受4种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.json,
    );

    dio = new Dio(options);
  }
```

配置一目了然，但是有一个潜在的问题，细心的同学可能会发现，baseUrl的参数是固定的，在实际开发中请求两个及以上的域名地址是有很大可能的，所以我们怎么动态更换baseUrl呢？

这里的配置我们用的是BaseOptions，其实还有Options、RequestOptions， 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数

> BaseOptions 基类请求配置
> Options单次请求配置
> RequestOptions实际请求配置

所以，我们可以在需要的地方创建RequestOptions，然后代替或覆盖BaseOptions 加到请求参数中

比如：

```DART
RequestOptions requestOptions=new RequestOptions(
        baseUrl: "http://www.google.com/aa/bb/cc/"
      );
```



#### get请求

```DART
  /*
   * get请求
   */
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(url, queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success---------${response.statusCode}');
      print('get success---------${response.data}');

//      response.data; 响应体
//      response.headers; 响应头
//      response.request; 请求体
//      response.statusCode; 状态码

    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response.data;
  }
```

> url：请求地址
> data：请求参数
> options：请求配置
> cancelToken：取消标识



#### post请求

```dart
  /*
   * post请求
   */
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url, queryParameters: data, options: options, cancelToken: cancelToken);
      print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response.data;
  }
```

##### post Form表单

跟一般的post请求大同小异，只是data的变化而已

```DART
FormData formData = FormData.from({
    "name": "wendux",
    "age": 25,
  });
response = await dio.post("/info", data: formData);
```

创建FormData，然后代替原来的data即可



#### 异常处理

出现异常的时候，当然是知道的越清晰越仔细越好，也越容易处理

```dart
  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
```



#### Cookie管理

Cookie管理是http中绕不开的话题，要保持回话持久，就要cookie持久化

- 依赖

```dart
dependencies:
 dio_cookie_manager: ^1.0.0
```

- 引入

```dart
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
123
```

- 使用

```dart
//Cookie管理
dio.interceptors.add(CookieManager(CookieJar()));
```



#### 添加拦截器

拦截器可以在请求之前、响应之前、error之前做一些预处理

```dart
    dio = new Dio(options);
    
    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前");
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      // Do something with response error
      return e; //continue
    }));
```



#### 下载文件

下载文件也是经常会用到的，比如下载图片，或者是更新

```dart
  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,onReceiveProgress: (int count, int total){
        //进度
        print("$count $total");
      });
      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }
    return response.data;
  }

```



#### 取消请求

```
  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
```



#### Https证书校验

有两种方法可以校验https证书，假设我们的后台服务使用的是自签名证书，证书格式是PEM格式，我们将证书的内容保存在本地字符串中，那么我们的校验逻辑如下：

```dart
String PEM="XXXXX"; // certificate content
(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
    client.badCertificateCallback=(X509Certificate cert, String host, int port){
        if(cert.pem==PEM){ // Verify the certificate
            return true;
        }
        return false;
    };
};
```

X509Certificate是证书的标准格式，包含了证书除私钥外所有信息，读者可以自行查阅文档。另外，上面的示例没有校验host，是因为只要服务器返回的证书内容和本地的保存一致就已经能证明是我们的服务器了（而不是中间人），host验证通常是为了防止证书和域名不匹配。

对于自签名的证书，我们也可以将其添加到本地证书信任链中，这样证书验证时就会自动通过，而不会再走到badCertificateCallback回调中：

```dart
(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
    SecurityContext sc = new SecurityContext();
    //file is the path of certificate
    sc.setTrustedCertificates(file);
    HttpClient httpClient = new HttpClient(context: sc);
    return httpClient;
};
```

> 注意，通过setTrustedCertificates()设置的证书格式必须为PEM或PKCS12，如果证书格式为PKCS12，则需将证书密码传入，这样则会在代码中暴露证书密码，所以客户端证书校验不建议使用PKCS12格式的证书。



#### 调用示例

```
      var response = await HttpUtil().get("http://www.baidu.com");
      print(response.toString());
```

json解析查看：[Flutter Json自动解析之FlutterJsonBeanFactory](https://blog.csdn.net/yechaoa/article/details/90035254)

### 自定义widget

在其他文档，已有整理，参考地址：[flutter_list_widget封装](https://onebox.huawei.com/#eSpaceGroupFile/1/369/3841771)

