import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Kit: Test Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Responsive Kit: Test Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // controls the value of the outer black box and values of inner container/circle are dependent on it
  double sliderValue = 1.0;
  // dimensions of black screen
  late double tempHeight;
  late double tempWidth;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context, MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width);

    // pick up the dimensions of the device for the sake of example project
    tempHeight =
        SizeConfig.getMyDynamicHeight(MediaQuery.of(context).size.height) *
            0.1 *
            (sliderValue);
    tempWidth =
        SizeConfig.getMyDynamicWidth(MediaQuery.of(context).size.width) *
            0.1 *
            (sliderValue);

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
                height: SizeConfig.screenHeight * 0.8,
              ),
              Container(
                height: tempHeight,
                width: tempWidth,
                color: Colors.black38,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getMyDynamicWidth(20),
                    vertical: SizeConfig.getMyDynamicHeight(20),
                  ),
                  color: Colors.blue.shade400,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getMyDynamicWidth(30),
                      vertical: SizeConfig.getMyDynamicHeight(30),
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
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
