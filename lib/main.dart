import 'package:classico/catagoryscreen.dart';
import 'package:classico/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 0, 0, 1)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(28),
              child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/images/img_one.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(28),
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'CRED ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'mint',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 28, bottom: 8),
              child: SizedBox(
                  // width: ,
                  // height: 100,
                  child: Text(
                "grow your savings \n3x faster",
                style: TextStyle(
                    // fontWeight: FontWeight.w100,
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'BookA'),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(28),
              child: SizedBox(
                // alignment: Alignment.center,
                height: 50,
                width: 300,
                child: NeoPopButton(
                  color: Colors.white,
                  onTapUp: () => HapticFeedback.vibrate(),
                  onTapDown: () => HapticFeedback.vibrate(),
                  child: InkWell(
                    onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CatagoryScreen()));
                    print("I m going ");
                  },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Go to catgory",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_right_alt_sharp),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
