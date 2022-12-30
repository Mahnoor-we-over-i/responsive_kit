<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
<!-- 
TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them. -->


Responsive kit is a flutter library which simplifies/assists in creating responsive UI in Flutter.


- [Usage](#usage)
  - [Initialize in init](#initialize-init)
  - [Get values](#get-values)
  - [Use in widgets](#use-in-widgets)
  - [Other Functionalities](#other-functionalities)

## Usage

### Initialize init
Initialize SizeConfig init in main.dart.

```dart
SizeConfig().init(context, height, width);
```

where: 
|parameter|description|
|-----------------------------------|--------------------------------------|
|context  |BuildContext in init of main.dart                                                |
|height   |`height` is the height of the frame in Figma. Which represents total no of pixels|
|width    |`width` is the width of the frame in Figma. Which represents total no of pixels  |

### Get values

These functions return responsive values according to screensize in `double`.
- height
- width
- font size
- bottom margin

```dart
SizeConfig().getMyDynamicHeight(figmaHeight, maxlimit: maxlimit);
SizeConfig().getMyDynamicFontSize(figmaFontSize, maxlimit: maxlimit);
SizeConfig().getMyDynamicWidth(figmaWidth, maxlimit: maxlimit);
SizeConfig().getBottomMarginforBigScreens();
```
where: 
|parameter|description|
|-----------------------------------|--------------------------------------|
|figmaHeight   |is the height factor according to the device designer in `figma` files|
|figmaWidth    |is the width factor according to the device designer in `figma` files|
|maxlimit      |is the maximum value that the variable will be limited to|
|figmaFontSize |which is the font factor according to the device designer in `figma` files|

### Use in widgets

```dart
Container(
    height: SizeConfig().getMyDynamicHeight(200),
    width: SizeConfig().getMyDynamicWidth(100),
    color: Colors.amber.shade100;,
  ); 
```
### Other Functionalities


|parameter|description|
|-----------------------------------|--------------------------------------|
|myBlockVertical   |If screen width is divided into `100 pixels` after subtracting horizontal safe area it returns `1 pixel` i.e. 1/100th of screen width |
|myBlockHorizontal    |If screen height is divided into `100 pixels` it returns `1 pixel` i.e. 1/100th of screen height.|
|screenHeight      |height of screen using [MediaQuery]|
|screenWidth |width of screen using [MediaQuery]|
|statusBarPadding |get **stausBarPadding** using [MediaQuery]|


```dart
  SizeConfig.myBlockVertical;
  SizeConfig.myBlockHorizontal;
  SizeConfig.screenHeight;
  SizeConfig.screenWidth;
  SizeConfig.statusBarPadding;
```





TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
