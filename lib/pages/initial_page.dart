import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'login_page.dart';
// import 'package:sinhgad_app/pages/login_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    // final backgroundColor = const Color(0xFFFFF0D1);
    // Offset distance = const Offset(20, 20);
    // double blur = 25.0;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      // backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            //Image sinhgad logo
            Image.asset(
              'assets/sinhgadlogo.png',
              height: 220,
              width: 270,
            ),
            const SizedBox(
              height: 15,
            ),

            //Welcome message
            const Text(
              "WELCOME!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),

            //Sinhgad institute students
            const Text(
              "SINHGAD INSTITUTES - STUDENTS",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 50,
            ),

            //container to hold buttons for login, admission ,info
            Container(
              height: 150,
              width: 330,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF212A3E)),
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 147, 160, 190),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 64, 80, 114),
                      blurRadius: 20,
                    )
                  ]
                  // Removed boxShadow property
                  ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //circular button
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: Container(
                            height: 67,
                            width: 67,
                            decoration: BoxDecoration(
                              color: const Color(0xFF212A3E),
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 55, 69, 99),
                                  blurRadius: 20,
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 67,
                            width: 67,
                            decoration: BoxDecoration(
                              color: const Color(0xFF212A3E),
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 55, 69, 99),
                                  blurRadius: 20,
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.school,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Admission",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                              
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 67,
                            width: 67,
                            decoration: BoxDecoration(
                              color: const Color(0xFF212A3E),
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 55, 69, 99),
                                  blurRadius: 20,
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Info",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            const Text('Version 1.0.0'),
            const SizedBox(
              height: 50,
            ),

            //version text
          ],
        ),
      ),
    );
  }
}
