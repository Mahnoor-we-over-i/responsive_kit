
Responsive kit is a flutter library which simplifies/assists in creating responsive UI in Flutter. Designs on specific screen sizes can be converted using functions to become responsive in different screen sizes. 

https://user-images.githubusercontent.com/96611704/210403541-85f8d7fe-f759-4ae5-bd0f-fe6f7fb53f05.mp4 

As shown in the screen, margin around blue square and circle are constant. These widgets are responsive according to the black rectangle.

- [Usage](#usage)
  - [Initialize in init](#initialize-init)
  - [Get values](#get-values)
  - [Use in widgets](#use-in-widgets)
  - [Other Functionalities](#other-functionalities)

## Usage

### Call init method (important)
Initialize SizeConfig.init in main.dart under build method.

```dart
SizeConfig().init(context, height, width);
```

|parameter|description|
|-----------------------------------|--------------------------------------|
|context  |BuildContext in init of main.dart                                                |
|height   |`height` is the height of the frame in design files. Which represents total no of pixels|
|width    |`width` is the width of the frame in design files. Which represents total no of pixels  |

### Get values

These functions return responsive values according to screensize in `double`.
- height
- width
- font size
- bottom margin

```dart
SizeConfig().getMyDynamicHeight(heightInDesignFile, maxlimit: maxlimit);
SizeConfig().getMyDynamicFontSize(fontSizeInDesignFile, maxlimit: maxlimit);
SizeConfig().getMyDynamicWidth(widthInDesignFile, maxlimit: maxlimit);
SizeConfig().getBottomMarginforBigScreens();
```
where: 
|parameter|description|
|-----------------------------------|--------------------------------------|
|heightInDesignFile   |is the height factor according to the device designer in `design` files|
|widthInDesignFile    |is the width factor according to the device designer in `design` files|
|maxlimit      |is the maximum value that the variable will be limited to|
|fontSizeInDesignFile |which is the font factor according to the device designer in `design` files|

### Use in widgets

```dart
Container(
    height: SizeConfig().getMyDynamicHeight(200),
    width: SizeConfig().getMyDynamicWidth(100),
    color: Colors.amber.shade100;,
  ); 
```
### Other Functionalities


|variables |description|
|-----------------------------------|--------------------------------------|
|horizontalBlock   |If screen width is divided into `100 pixels` after subtracting horizontal safe area it returns `1 pixel` i.e. 1/100th of screen width |
|verticalBlock    |If screen height is divided into `100 pixels` it returns `1 pixel` i.e. 1/100th of screen height.|
|screenHeight      |height of screen using [MediaQuery]|
|screenWidth |width of screen using [MediaQuery]|
|statusBarPadding |get **stausBarPadding** using [MediaQuery]|


```dart
  SizeConfig.verticalBlock;
  SizeConfig.horizontalBlock;
  SizeConfig.screenHeight;
  SizeConfig.screenWidth;
  SizeConfig.statusBarPadding;
```
