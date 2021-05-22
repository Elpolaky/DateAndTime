import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var date = '0000-00-00';
  var hour = 0;
  var min = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f0f0f),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 3,
        title: Text(
          'Calendar  📆',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(10),
              child: Text(
                ' Date : ${date.toString()}',
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              width: 200,
              height: 43,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(10),
              child: Text(
                ' Time :  $hour:$min',
                style: TextStyle(fontSize: 17, color: Colors.red),
              ),
              width: 200,
              height: 43,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: _showDateAndTime,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 40,
                  child: Text(
                    'Press to select date and time ',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _showDateAndTime() async {
    var k = await showDatePicker(
        context: context,
        initialDate: DateTime(2021),
        firstDate: DateTime(1000),
        lastDate: DateTime(3000));
    var m =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      hour = m.hour;
      min = m.minute;
      date = k.toString();
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Date and time selected successfully',
        style: TextStyle(color: Color(0xff737373)),
      ),
      backgroundColor: Colors.black,
      action: SnackBarAction(label: 'undo', onPressed:_showDateAndTime,textColor: Colors.blue,),
      duration: Duration(milliseconds: 2500),
    ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: MyHomePage(),
      duration: 2700,
      imageSize: 150,
      imageSrc: "assets/splashscreen.png",
      text: "Loading.....",
      textType: TextType.ScaleAnimatedText,
      textStyle: TextStyle(
        color: Color(0xff65CCF7),
        fontSize: 30.0,
      ),
      backgroundColor: Colors.black,
    );
  }
}
