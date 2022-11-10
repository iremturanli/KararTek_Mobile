import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/yeniKullanici.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [
        const Locale('tr', 'TR'),
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        // ignore: prefer_const_constructors
        // inputDecorationTheme: InputDecorationTheme(
        //   //To always use the color (even when not in focus), set enabledBorder and border as well:
        //   focusedBorder: const UnderlineInputBorder(
        //       borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
        //   // ignore: prefer_const_constructors
        //   enabledBorder: UnderlineInputBorder(
        //     borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        //   ),
        //   border: const UnderlineInputBorder(
        //     borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        //   ),
        // ),
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/login-logo.png'),
              const SizedBox(height: 30),
              Lottie.asset('assets/loading.json', height: 20)
            ],
          ),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/karar5.png"), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Image(
                    image: AssetImage("assets/login-logo.png"),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 500),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.9,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(350, 50),
                        backgroundColor: const Color.fromARGB(255, 1, 28, 63),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: const Text(
                        'Giriş',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(350, 50),
                        backgroundColor: const Color.fromARGB(255, 1, 28, 63),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => yeniKullanici()));
                      },
                      child: const Text(
                        'Yeni Kullanıcı',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
