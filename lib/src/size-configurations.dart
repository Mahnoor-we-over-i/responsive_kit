// responsive kit

import 'package:flutter/material.dart';
import 'package:responsive_kit/src/responsive-screen-methods.dart';

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
  static late double myBlockHorizontal;

  /// If screen height is divided into `100 pixels` it returns `1 pixel` i.e. 1/100th of screen height.
  static late double myBlockVertical;

  // _myBaseFont calculated for the particular screen
  // using ratio of screenHeight & screenWidth
  static late double _myBaseFont;

  /// get root context of application
  static late BuildContext _rootPageContext;

  late double _screenHeightInFigma;
  late double _screenWidthInFigma;
  late double _fontRatio;

  // assert in documentation on pub.dev to call this in main to give root context and then move forward.

  /// `init` uses `context`, `height` and `width` to calculate responsive values.
  ///
  /// `context` is the BuildContext to get screen dimensions using [MediaQuery]
  ///
  /// `height` is the height of the frame in Figma
  ///
  /// `width` is the width of the frame in Figma
  void init(BuildContext context, double height, double width) {
    // initializing variables
    _rootPageContext = context;
    _screenHeightInFigma = height / 100;
    _screenWidthInFigma = width / 100;
    _fontRatio = _screenHeightInFigma / _screenWidthInFigma;
    _mediaQueryData = MediaQuery.of(_rootPageContext);
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    _myBaseFont = (screenHeight + AppBar().preferredSize.height) / screenWidth;

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height - AppBar().preferredSize.height;
    myBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    myBlockVertical = (screenHeight + AppBar().preferredSize.height) / 100;
    statusBarPadding = _mediaQueryData.padding.top;
  }

  @override

  /// This function [getBottomMarginforBigScreens] returns dynamic bottommargin for big screens.
  ///
  ///
  double getBottomMarginforBigScreens({bool? isAppBarMargin}) {
    if (isAppBarMargin != null && isAppBarMargin) {
      double mMargin = 25;
      if (SizeConfig.screenHeight > 805) {
        mMargin = 100;
      }
      return mMargin;
    } else {
      double mMargin = 60;

      if (SizeConfig.screenHeight > 805) {
        mMargin = 150;
      }
      return mMargin;
    }
  }

  @override

  /// This function [getMyDynamicFontSize] returns dynamic font size according to the given font size in figma. It takes:
  ///
  /// `figmaFontSize` which is the font factor according to the device designer in `figma` files
  ///
  /// `maxlimit` is the maximum size of font that the it will be limited to
  double getMyDynamicFontSize(double figmaFontSize, {double? maxlimit}) {
    // _fontRatio is the ratio of height to width of the frame

    double calculatedValue = figmaFontSize / _fontRatio;

    double returnSize = _myBaseFont * calculatedValue;
    if (maxlimit != null) {
      returnSize = returnSize > maxlimit ? maxlimit : returnSize;
    }

    return returnSize;
  }

  @override

  /// This function [getMyDynamicHeight] returns dynamic height according to the given height in figma. It takes:
  ///
  /// `figmaHeight` which is the height factor according to the device designer in `figma` files
  ///
  /// `maxlimit` is the maximum height that it will be limited to

  double getMyDynamicHeight(double figmaHeight, {double? maxlimit}) {
    // _screenHeightInFigma is the maximum height of screen/frame in figma files
    double calculatedValue = figmaHeight / _screenHeightInFigma;
    double returnSize = SizeConfig.myBlockVertical * calculatedValue;
    if (maxlimit != null) {
      returnSize = returnSize > maxlimit ? maxlimit : returnSize;
    }

    return returnSize;
  }

  @override

  /// This function [getMyDynamicWidth] returns dynamic width according to the given width in figma. It takes:
  ///
  /// `figmaWidth` which is the width factor according to the device designer in `figma` files
  ///
  /// `maxlimit` is the maximum width that it will be limited to

  double getMyDynamicWidth(double figmaWidth, {double? maxlimit}) {
    // _screenWidthFigma is the maximum width of screen/frame in figma files
    double calculatedValue = figmaWidth / _screenWidthInFigma;
    double returnSize = SizeConfig.myBlockHorizontal * calculatedValue;
    if (maxlimit != null) {
      returnSize = returnSize > maxlimit ? maxlimit : returnSize;
    }

    return returnSize;
  }
}
