import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/sifremiUnuttum.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/karar5.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Image(
                        image: AssetImage("assets/login-logo.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 200),
                      // padding: const EdgeInsets.all(9),
                      child: SizedBox(
                        width: 350,
                        child: TextField(
                          controller: nameController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11)
                          ],
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0))),
                              labelText: 'TC Kimlik No',
                              hintText: "Kimlik Numaranızı Giriniz.",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      // padding: const EdgeInsets.all(9),
                      child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText:
                                !_passwordVisible, //Dinamik olarak gizlemeyi değiştirir
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              labelStyle: TextStyle(color: Colors.black),
                              // Here is key idea
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // seçilen Icon'a göre değişir
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Icon'a tıklandığında değişir
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                          )),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => sifremiUnuttum()));
                        },
                        child: const Text('Şifremi Unuttum')),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 150),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: Size(350, 50),
                            backgroundColor: Color.fromARGB(255, 1, 28, 63),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
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
                            minimumSize: Size(350, 50),
                            backgroundColor: Color.fromARGB(255, 194, 27, 5),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: const Text(
                            'Geri',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                      ],
                    ),
                    // ),
                  ],
                ))));
  }
}
