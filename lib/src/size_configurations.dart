// responsive kit
// should we add images init? how to go about it?
// maybe change names of variables and see what can be done about them?
// dry run and push it to pub.dev today
//

import 'package:flutter/material.dart';
import 'package:responsive_kit/src/responsive_screen_methods.dart';

/// Important class to help and support responsiveness in the app,
/// it gets width and height by Media Query and then uses it to calculate other important pixels.
class SizeConfig implements ResponsiveScreenMethods {
  // initializer
  static late MediaQueryData _mediaQueryData;
  // padding on both side (left-right) for safe area. notches and iPhoneX and above
  static late double _safeAreaHorizontal;

  // padding on both (top-bottom) for safe area vertically.
  static late double _safeAreaVertical;

  /// width of screen using [MediaQuery]
  static late double screenWidth;

  /// height of screen using [MediaQuery]
  static late double screenHeight;

  /// get **stausBarPadding** using [MediaQuery]
  static late double statusBarPadding;

  /// If screen width is divided into `100 pixels` after subtracting horizontal safe area it returns `1 pixel` i.e. 1/100th of screen width.
  static late double horizontalBlock;

  /// If screen height is divided into `100 pixels` it returns `1 pixel` i.e. 1/100th of screen height.
  static late double verticalBlock;

  // _myBaseFont calculated for the particular screen
  // using ratio of screenHeight & screenWidth
  static late double _myBaseFont;

  /// get root context of application
  static late BuildContext _rootPageContext;

  late double _screenHeightInDesignFile;
  late double _screenWidthInDesignFile;
  late double _fontRatio;

  // assert in documentation on pub.dev to call this in main to give root context and then move forward.

  /// `init` uses `context`, `height` and `width` to calculate responsive values.
  ///
  /// `context` is the BuildContext to get screen dimensions using [MediaQuery]
  ///
  /// `height` is the height of the frame in Design File
  ///
  /// `width` is the width of the frame in Design File
  void init(BuildContext context, double height, double width) {
    // initializing variables
    _rootPageContext = context;
    _screenHeightInDesignFile = height / 100;
    _screenWidthInDesignFile = width / 100;
    _fontRatio = _screenHeightInDesignFile / _screenWidthInDesignFile;
    _mediaQueryData = MediaQuery.of(_rootPageContext);
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    _myBaseFont = (screenHeight + AppBar().preferredSize.height) / screenWidth;

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height - AppBar().preferredSize.height;
    horizontalBlock = (screenWidth - _safeAreaHorizontal) / 100;
    verticalBlock = (screenHeight + AppBar().preferredSize.height) / 100;
    statusBarPadding = _mediaQueryData.padding.top;
  }

  @override
  @override

  /// This function [getMyDynamicFontSize] returns dynamic font size according to the given font size in Design File. It takes:
  ///
  /// `fontSizeInDesignFile` which is the font factor according to the device designer in `Design` files
  ///
  /// `maxlimit` is the maximum size of font that the it will be limited to
  double getMyDynamicFontSize(double fontSizeInDesignFile, {double? maxlimit}) {
    // _fontRatio is the ratio of height to width of the frame

    double calculatedValue = fontSizeInDesignFile / _fontRatio;

    double returnSize = _myBaseFont * calculatedValue;
    if (maxlimit != null) {
      returnSize = returnSize > maxlimit ? maxlimit : returnSize;
    }

    return returnSize;
  }

  @override

  /// This function [getMyDynamicHeight] returns dynamic height according to the given height in Design File. It takes:
  ///
  /// `heightInDesignFile` which is the height factor according to the device designer in `Design` files
  ///
  /// `maxlimit` is the maximum height that it will be limited to

  double getMyDynamicHeight(double heightInDesignFile, {double? maxlimit}) {
    // _screenHeightInDesignFile is the maximum height of screen/frame in Design files
    double calculatedValue = heightInDesignFile / _screenHeightInDesignFile;
    double returnSize = SizeConfig.verticalBlock * calculatedValue;
    if (maxlimit != null) {
      returnSize = returnSize > maxlimit ? maxlimit : returnSize;
    }

    return returnSize;
  }

  @override

  /// This function [getMyDynamicWidth] returns dynamic width according to the given width in Design Files. It takes:
  ///
  /// `widthInDesignFile` which is the width factor according to the device designer in `Design` files
  ///
  /// `maxlimit` is the maximum width that it will be limited to

  double getMyDynamicWidth(double widthInDesignFile, {double? maxlimit}) {
    // _screenWidthInDesignFile is the maximum width of screen/frame in Design files
    double calculatedValue = widthInDesignFile / _screenWidthInDesignFile;
    double returnSize = SizeConfig.horizontalBlock * calculatedValue;
    if (maxlimit != null) {
      returnSize = returnSize > maxlimit ? maxlimit : returnSize;
    }

    return returnSize;
  }
}
