# Flutter环境搭建-安全PC

Windows10 (64-bit)

# 前期准备

1. Flutter是用来做什么的？

   Flutter是用打包APP的，同一套程序，可以打包成安卓应用和IOS应用。

2. Flutter怎么开发？

   使用Dart语言开发，对应源码文件后缀为`.dart`。

3. Flutter开发都需要什么？

   * PowerShell 或者CMD

     通过PowerShell或者CMD来执行Flutter命令。Flutter不支持GitBash、Cygwin终端。

   * Git

     项目构建过程通过Git来下载依赖。

     如果已安装Git for Windows，请确保命令提示符或PowerShell中运行 `git` 命令，不然在后面运行`flutter doctor`时将出现`Unable to find git in your PATH`错误, 此时需要手动添加`C:\Program Files\Git\bin`至`Path`系统环境变量中。

   * JDK
   
     选择版本`JDK8`，和Java项目保持一致。
   
     Android本身依赖JDK，我们选用JDK8。
   
   * Flutter SDK
   
     选择版本`Flutter1.22.4`，对应安装包为`flutter_windows_1.22.4-stable.zip`
   
     从flutter_windows_1.22.5-stable.zip开始，Flutter安装包将不再自带Dart等组件包。我们的环境下载这些组件包本身会非常慢，而且可能卡死，所以选择Flutter1.22.4。
   
   * Android-Studio
   
     Flutter本质只是需要的**Android SDK**，但Android-Studio还有以下核心作用：
   
     * 可用来管理**Android SDK**
     * 可用来做Dart的开发工具
     * 可用来管理安卓设备模拟器
   
     选择Android-Studio4.0，对应安装包为`android-studio-ide-193.6626763-windows.exe`。
   
     目前最新版本为4.1，但4.1与Flutter之间存在兼任性问题，虽然Flutter在1.23对该问题进行了修复，目前Flutter1.23还未出稳定版本，所以Android-Studio不使用最新的版本。

# 环境搭建

安装Git

1. 安装JDK8

2. [安装Android Stuidio](#安装Android Stuidio)

   先安装Android Stuidio为了方便下载`Android SDK`

3. [安装Flutter](#安装Flutter)

## 一. Adb权限申请

安卓模拟器需要使用到USB及相关权限，华为安全PC默认禁用，开发时需要启动模拟器，所以需要申请该权限。

申请连接：http://security.huawei.com/SpesWEB/portPolicyApply.do?method=dispatch#

![image-20210301183637469](.Flutter环境搭建.image/image-20210301183637469.png)

按如下要求填写表单：*注意申请权限只能下面红框内的部分*

![image-20210301183841437](.Flutter环境搭建.image/image-20210301183841437.png)

* Direct Manager   选择 `lifeng 00150697`

* USB Port  选择USB端口权限，只选择`Read-only + Debug`

* Normal or Urgent (For CPM Only)  ，选择 `Normal Application `

* Expiration Date  申请一年

* Reason of Application  按如下信息调整：

  调试安卓应用需要用到工具Adb，启动过程中CPM提示：Adb is not permitted! Please apply debug right  CPM! SPES5.0 Console。



提申请后如果想加快审批速度，就小窗联系审批人。审批通过后会收到通知消息，也可以在网页查看：

![image-20210301184338902](.Flutter环境搭建.image/image-20210301184338902.png)

## 二. 安装Git

[Git for Windows](https://git-scm.com/download/win)

## 三. 安装JDK

执行jdk-8u252-windows-x64.msi

## 四. 安装Android Stuidio

[官网](https://developer.android.com/studio) ，最新版本：4.1.2 for Windows 64-bit (896 MiB)，android-studio-ide-201.7042882-windows.exe

### 1. 获取4.0安装包

android-studio-ide-193.6626763-windows.exe

### 2. 安装

![image-20210302113551973](.Flutter环境搭建.image/image-20210302113551973.png)

如下图，下一步：

![image-20210302113625686](.Flutter环境搭建.image/image-20210302113625686.png)

如上图选择，然后下一步：

![image-20210302113647409](.Flutter环境搭建.image/image-20210302113647409.png)

如上图，选择自己的安装位置，然后下一步：

​				

![image-20210302134105825](.Flutter环境搭建.image/image-20210302134105825.png)



如上图，点击安装，然后等待安装，安装完成后如下图所示：

![image-20210302134813944](.Flutter环境搭建.image/image-20210302134813944.png)

如上图，点击下一步：

![image-20210302134933184](.Flutter环境搭建.image/image-20210302134933184.png)

至此，AndroidStudio软件安装完成，点击Finish，系统自动启动进Android Studio，并进入安装向导配置

### 3. 配置安装向导

首次启动出现下面的提示，点击`Setup Proxy`设置代理（也可以点击Cancel，以后自行设置代理）：

![image-20210302114205218](.Flutter环境搭建.image/image-20210302114205218.png)		

设置代理：填写完相关信息后，点击OK即可。

![image-20210302135301834](.Flutter环境搭建.image/image-20210302135301834.png)

代理设置完成后，弹出如下页面：

![image-20210302135415360](.Flutter环境搭建.image/image-20210302135415360.png)

下一步

![image-20210301204258057](.Flutter环境搭建.image/image-20210301204258057.png)



如上图，选择`Custom`，下一步：配置JDK，AndroidStudio自带JRE，我们尽量选择本地安装的JDK8

![image-20210302135608390](.Flutter环境搭建.image/image-20210302135608390.png)

下一步，选择主题风格

![image-20210302135756189](.Flutter环境搭建.image/image-20210302135756189.png)

​	下一步，选择要安装组件及AndriodSDK位置设置：

* 选择要安装的组件，（如果HAXM安装失败，无需理会）

* 设置AndriodSDK位置，按实际情况设置。

![image-20210301204518985](.Flutter环境搭建.image/image-20210301204518985.png)

下一步，设置RAM大小：

![image-20210301204534725](.Flutter环境搭建.image/image-20210301204534725.png)

下一步：就开始下载安装组件了，安装组件会安装很久，待组件安装完成，进入如下页面（此时还没有Flutter）：

![image-20210301205643029](.Flutter环境搭建.image/image-20210301205643029.png)



此时，AndroidStudio安装向导配置完成，下一步开始安装插件。

### 4. 安装插件

![image-20210302140912739](.Flutter环境搭建.image/image-20210302140912739.png)





搜索Flutter并安装：

![image-20210302140944700](.Flutter环境搭建.image/image-20210302140944700.png)

### 5. 验证

重启AndroidStuidio，在首页可以看到`Create New Flutter Project`，表示AndroidStuidio 整体完成安装。

![image-20210302141326669](.Flutter环境搭建.image/image-20210302141326669.png)

### 6. 配置环境变量

在环境变量中添加`ANDROID_SDK_ROOT`，在PowerShell运行Flutter时，需要该环境变量。

![image-20210302094130461](.Flutter环境搭建.image/image-20210302094130461.png)

## 五、安装Flutter SDK

[官网地址](https://flutter.dev/docs/get-started/install)。

### 1. 获取FlutterSDK安装包并解压

flutter_windows_1.22.4-stable

解压到合适目录

例如：`D:\soft\`

注意，**不要**将flutter安装到需要一些高权限的路径如`C:\Program Files\`）。

### 2. 配置Flutter指令目录

要在PowerShell中直接使用Flutter命令，所以需要配置环境变量，

将Flutter的bin目录添加到Path中去。

*注意：该环境变量配置仅仅是为了在终端直接执行flutter命令*

![image-20210302192405870](.Flutter环境搭建.image/image-20210302192405870.png)

### 3. 配置国内镜像

* PUB_HOSTED_URL
* FLUTTER_STORAGE_BASE_URL

这两个配置是为了解决国内网络问题，但华为环境这么配置效果并不好。

```properties
# 社区主镜像
PUB_HOSTED_URL=https://pub.flutter-io.cn
FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# 清华大学 TUNA 协会
PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub
FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
```

![image-20210302163352843](.Flutter环境搭建.image/image-20210302163352843.png)

### 4. 验证

打开PowerShell，执行：`flutter --version` 

```properties
  ╔════════════════════════════════════════════════════════════════════════════╗
  ║ A new version of Flutter is available!                                     ║
  ║                                                                            ║
  ║ To update to the latest version, run "flutter upgrade".                    ║
  ╚════════════════════════════════════════════════════════════════════════════╝


Flutter 1.22.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 1aafb3a8b9 (4 months ago) • 2020-11-13 09:59:28 -0800
Engine • revision 2c956a31c0
Tools • Dart 2.10.4
PS C:\Users\lwx745500> flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 1.22.4, on Microsoft Windows [Version 10.0.18362.1256], locale zh-CN)

[√] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
[√] Android Studio (version 4.0)
[!] Connected device
    ! No devices available

! Doctor found issues in 1 category.
```

*注意：在研发网络，PowerShell需要配置代理，否则无法下载依赖软件包*

[PowerShell配置代理](PowerShell配置代理)

### 5. 检查Flutter环境是否完整

打开PowerShell，执行：`flutter doctor -v`，没有出现`x`就表示Flutter环境完整了。

```properties
[√] Flutter (Channel stable, 1.22.4, on Microsoft Windows [Version 10.0.18362.1256], locale zh-CN)
    • Flutter version 1.22.4 at D:\soft\flutter_windows_1.22.4-stable\flutter
    • Framework revision 1aafb3a8b9 (4 months ago), 2020-11-13 09:59:28 -0800
    • Engine revision 2c956a31c0
    • Dart version 2.10.4
    • Pub download mirror https://mirrors.tuna.tsinghua.edu.cn/dart-pub/
    • Flutter download mirror https://mirrors.tuna.tsinghua.edu.cn/flutter

[√] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
    • Android SDK at D:\soft\AndriodSDK
    • Platform android-30, build-tools 30.0.3
    • ANDROID_SDK_ROOT = D:\soft\AndriodSDK
    • Java binary at: D:\soft\AndroidStudio4.0\jre\bin\java
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b01)
    • All Android licenses accepted.

[√] Android Studio (version 4.0)
    • Android Studio at D:\soft\AndroidStudio4.0
    • Flutter plugin installed
    • Dart plugin version 193.7547
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b01)

[!] Connected device
    ! No devices available
```

*注意：在研发网络，PowerShell需要配置代理，否则无法下载依赖软件包*

[PowerShell配置代理](PowerShell配置代理)

### 6. android-licenses确认

可能会很慢，可能会超时，多执行几次。

如果提示android licenses未接受，则执行`flutter doctor --android-licenses`，所有确认项输入`y`即可。

# Flutter Demo

## 1. 创建一个项目

首先打开`PowerShell`，然后配置临时代理。[PowerShell配置代理](PowerShell配置代理)

进入我们的工作目录，这个目录是我们用来管理项目的。例如：`D:\workSpace\flutter1`

执行创建项目的命令：`flutter create flutter_app5`

```shell
Creating project flutter_app5...
  flutter_app5\.gitignore (created)
  flutter_app5\.idea\libraries\Dart_SDK.xml (created)
  ...#这里省略一大堆创建的文件#
Running "flutter pub get" in flutter_app5...                        7.5s  #此处可能会很慢，等太久回车下看看有没有执行完#
Wrote 71 files.

All done!  #此处可能会很慢，等太久回车下看看有没有执行完#
[√] Flutter: is fully installed. (Channel stable, 1.22.4, on Microsoft Windows [Version 10.0.18362.1256], locale zh-CN)
[√] Android toolchain - develop for Android devices: is fully installed. (Android SDK version 30.0.3)
[√] Android Studio: is fully installed. (version 4.0)
[!] Proxy Configuration: is partially installed; more components are available.
[!] Connected device: is not available.

Run "flutter doctor" for information about installing additional components.

In order to run your application, type:

  $ cd flutter_app5
  $ flutter run

Your application code is in flutter_app5\lib\main.dart.

```

如上示例就是创建成功了，创建成功后可以通过以下指令来运行项目：

```shell
$ cd flutter_app5
$ flutter run
```

但我们主要使用Android Stuidio开发，所以我们接下来把项目导入到AndroidStuidio中配置并启动。

## 2. 导入AndroidStuidio

如下图所示：选择`Import project(...)`

![image-20210302141326669](.Flutter环境搭建.image/image-20210302141326669.png)



![image-20210302194840798](.Flutter环境搭建.image/image-20210302194840798.png)



导入过程会下载依赖，消耗时间可能较长。

## 4.  配置Flutter SDK

`File->Settings...`，配置Flutter SDK路径。

![image-20210302165501537](.Flutter环境搭建.image/image-20210302165501537.png)



## 5. 创建模拟器

![image-20210302171008060](.Flutter环境搭建.image/image-20210302171008060.png)

进入模拟器管理界面，如下：

![image-20210302171045464](.Flutter环境搭建.image/image-20210302171045464.png)

点击`+Create Virtual Device...`

![image-20210302171309712](.Flutter环境搭建.image/image-20210302171309712.png)



创建成功后，会进入模拟器列表页面：

![image-20210302171447278](.Flutter环境搭建.image/image-20210302171447278.png)

如上图，点击运行，即可打开模拟器：

刚开始关机状态，屏幕全黑，如下图红框就是开机按钮，单击即可开机，开机状态如下图所示：

![image-20210302171529601](.Flutter环境搭建.image/image-20210302171529601.png)

​	

模拟器启动成功后，打开PowerShell，输入`flutter doctor -v`，即可看到设备连接信息，如下图：

![image-20210302172113769](.Flutter环境搭建.image/image-20210302172113769.png)



## 6. 启动服务

项目导入成功后，模拟器也创建成功了。右键`main.dart`，然后执行`Run xxx`

![image-20210302200212979](.Flutter环境搭建.image/image-20210302200212979.png)



启动成功后如下显示：

![image-20210302200609777](.Flutter环境搭建.image/image-20210302200609777.png)



至此：Flutter环境搭建完成。

# PowerShell配置代理

## 临时代理

每次打开PowerShell窗口都需要执行

```shell
$env:http_proxy="http://xxxx:xxxx@proxycn2.huawei.com:8080"
$env:https_proxy="http://xxxx:xxxx@proxycn2.huawei.com:8080"
```

## 永久代理

还没有找到方法

# 问题记录

## 问题1：Flutter doctor提示插件未安装

**问题：执行Flutter doctor，提示android studio flutter插件未安装，但实际已经安装**

android studio 4.1升级过程中，改变了plugin folder的路径：
From : ~/Library/Application\ Support/AndroidStudio4.1
To: ~/Library/Application\ Support/Google/AndroidStudio4.1/plugins 导致flutter doctor 1.22版本不能检测到插件，错误信息如下：

![flutter doctor报错](.Flutter环境搭建.image/20201203104637294.png)

目前flutter已经修复此问题在1.23版本（dev 分支），但我们不能使用dev版本，所以将android studio回退到4.0版本。

## 问题2：Invoke-WebRequest

Invoke-WebRequest : Authentication Required
You must be authenticated to access this URL.

详细问题如下：

```shell
PS C:\Users\lwx745500> flutter --version
Checking Dart SDK version...
Downloading Dart SDK from Flutter engine 2f0af3715217a0c2ada72c717d4ed9178d68f6ed...
Downloading the Dart SDK using the BITS service failed, retrying with WebRequest...
Invoke-WebRequest : Authentication Required
You must be authenticated to access this URL.

URL:https://storage.googleapis.com
User name:

Any question, you can use:
(1) "IT Service Platform " to search the solutions.
(2) Submit it on "IT Online Support".
(3) Contact IT Hotline for help.
(4) You can get FAQ and Proxy setting tool at "ProxyPortal".


The error code is 0X10307 E1.
Copyright @ Huawei Technologies Co., Ltd. 1998-2010. All rights reserved.
所在位置 D:\soft\flutter_windows_1.22.6-stable\flutter\bin\internal\update_dart_sdk.ps1:70 字符: 5
+     Invoke-WebRequest -Uri $dartSdkUrl -OutFile $dartSdkZip
+     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (System.Net.HttpWebRequest:HttpWebRequest) [Invoke-WebRequest]，WebExce
    ption
    + FullyQualifiedErrorId : WebCmdletWebResponseException,Microsoft.PowerShell.Commands.InvokeWebRequestCommand
Error: Unable to update Dart SDK. Retrying...
```

处理办法：配置update_dart_sdk.ps1文件



修改如上配置文件后，卡死：

```powershell
PS C:\Users\lwx745500> flutter --version                                                                                
Checking Dart SDK version...                                                                                           Downloading Dart SDK from Flutter engine 2f0af3715217a0c2ada72c717d4ed9178d68f6ed...                                   Downloading the Dart SDK using the BITS service failed, retrying with WebRequest...                                     Unzipping Dart SDK...                                                                                                   
Building flutter tool...
Running pub upgrade...  (// 这里卡死。。。)
```



另外一种安装方法：

![image-20210302183818008](.Flutter环境搭建.image/image-20210302183818008.png)