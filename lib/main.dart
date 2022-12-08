import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/homePage.dart';
import 'package:flutter_application_1/Screens/yeniKullanici.dart';
import 'package:flutter_application_1/services/LocalSharedPreferences/LocalSharedPreference.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_1/Screens/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'AppConfigurations/appConfigurations.dart';

void main() async {
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalSharedPreference.init();
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
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      // ignore: prefer_const_literals_to_create_immutables
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

        primarySwatch: Colors.blue, //onlymaterialcolor?
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
      String token = LocalSharedPreference.getString(
          LocalSharedPreference.SHARED_MEM_KEY_DEVICE_TOKEN);
      if (token != "") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }
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
              Image.asset('assets/images/login-logo.png'),
              const SizedBox(height: 30),
              Lottie.asset('assets/images/loading.json', height: 20)
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
                  image: AssetImage("assets/images/karar5.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Image(
                    image: AssetImage("assets/images/login-logo.png"),
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
