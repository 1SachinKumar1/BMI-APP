import 'package:flutter/material.dart';
import 'package:plant_app/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get float => null;
  var htController = TextEditingController();
  var wtController = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        elevation: 22,
        shadowColor: Colors.blueGrey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40))),
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                const Image(
                  image: NetworkImage(
                      'https://play-lh.googleusercontent.com/dIrupb2X482l0AOv36KOG_sw1B91-r1SH76-ZZm9zgqmjd1NjbsUCQMLmEo1GpljQjg'),
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 21),
                TextField(
                  controller: htController,
                  decoration: InputDecoration(
                    hintText: ("Please enter your height in metre."),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    prefixIcon: const Icon(
                      Icons.height,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    hintText: ("Please enter your weight in kg."),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.orange,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    prefixIcon: const Icon(
                      Icons.height,
                      color: Colors.deepOrange,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ht = htController.text.toString();
                    if (wt != "" && ht != "") {
                      //BMI Calculation
                      var iwt = int.parse(wt);
                      var iht = double.parse(ht);
                      var bmi = iwt / (iht * iht);
                      setState(() {
                        result = "Your BMI is:-${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill every entry first.";
                      });
                    }
                  },
                  child: const Text('Calculate'),
                ),
                Text(
                  result,
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
