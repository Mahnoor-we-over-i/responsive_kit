import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Kit: Test Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MyHomePage(title: 'Responsive Kit: Test Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sliderValue = 1.0;
  late double tempHeight;
  late double tempWidth;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context, 667, 375);

    /* tempHeight = SizeConfig.screenHeight * 0.1 * (sliderValue);
    tempWidth = SizeConfig.screenWidth * 0.1 * (sliderValue); */

    tempHeight = SizeConfig().getMyDynamicHeight(550) * 0.1 * (sliderValue);
    tempWidth = SizeConfig().getMyDynamicWidth(250) * 0.1 * (sliderValue);
    print('height :  $tempHeight');
    print('width :  $tempWidth');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.7,
              ),
              Container(
                height: tempHeight,
                width: tempWidth,
                color: Colors.black38,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig().getMyDynamicWidth(20),
                    vertical: SizeConfig().getMyDynamicHeight(20),
                  ),
                  /* height: SizeConfig().getMyDynamicHeight(50),
                  width: SizeConfig().getMyDynamicWidth(50), */
                  color: Colors.amber,
                ),
              ),
            ],
          ),
          Slider.adaptive(
              value: sliderValue,
              label: sliderValue.toString(),
              min: 1,
              max: 7,
              onChanged: (newValue) => setState(() => sliderValue = newValue)),
        ],
      )),
    );
  }
}
