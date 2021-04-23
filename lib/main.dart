import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StatefulHome(),
    );
  }
}

class StatefulHome extends StatefulWidget {
  @override
  _StatefulHomeState createState() => _StatefulHomeState();
}

class _StatefulHomeState extends State<StatefulHome> {
  final String appBar = 'Temp App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.directions_boat_outlined),
        title: Text(appBar),
        backgroundColor: Color(0xFFE42211),
      ),
      body: StateFulBody(),
      backgroundColor: Colors.black,
    );
  }
}

class StateFulBody extends StatefulWidget {
  @override
  _StateFulBodyState createState() => _StateFulBodyState();
}

class _StateFulBodyState extends State<StateFulBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TextFieldInput(),
      ],
    );
  }
}

class TextFieldInput extends StatefulWidget {
  @override
  _TextFieldInputState createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  int temp;
  bool pressed = false;
  String res = "";
  double farenheit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Please Enter a Temp in Celcius',
                hintStyle: TextStyle(color: Colors.white),
                icon: Icon(
                  Icons.thermostat_sharp,
                  color: Colors.red,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE42211),
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                  width: 2,
                )),
              ),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
              keyboardType: TextInputType.number,
              autofocus: false,
              cursorColor: Colors.red,
              textInputAction: TextInputAction.go,
              onSubmitted: (text) {
                temp = int.parse(text);
                setState(() {
                  convert(temp);
                  pressed = true;
                });
              },
            ),
            SizedBox(height: 25),
            pressed
                ? Text(
                    "Farenheit: $farenheit",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  void convert(int tempp) {
    setState(() {
      var preTemp = (tempp) * (9 / 5);
      farenheit = preTemp + 32;
      print(farenheit);
    });
  }
}
