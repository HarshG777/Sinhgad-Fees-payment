import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../components/my_button.dart';
import 'dashboard.dart';
// import 'package:sinhgad_app/components/my_button.dart';
// import 'package:sinhgad_app/pages/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //const values for shadow and colors
  final backgroundcolor = const Color(0xFFF1F6F9);
  Offset distance = const Offset(20, 20);
  double blur = 20.0;

  //controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //visible password toggle default
  bool _isPasswordVisible = false;

  //dropdown menu value
  String? selectedUniversity;

  //sign user in
  void signUserIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 700,
                        width: 380,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: const Color(0xFFC4E9FF),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: blur,
                                offset: distance,
                                color: const Color.fromARGB(255, 120, 203, 250),
                                inset: true,
                              ),
                              BoxShadow(
                                blurRadius: blur,
                                offset: -distance,
                                color: const Color.fromARGB(255, 120, 203, 250),
                                inset: true,
                              ),
                            ]),
                        child: Column(
                          children: [
                            //sinhgadlogo
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/sinhgadlogo.png',
                              height: 200,
                              width: 225,
                            ),

                            //sinhgad name

                            const Text(
                              "SINHGAD INSTITUTE - STUDENT",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(
                              height: 50,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //textfield for stud id
                                  const Text(
                                    'Student UID:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller: usernameController,
                                      decoration: InputDecoration(
                                        hintText: "Student UID",
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Color(0xFF212A3E),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  //textfield for password

                                  const Text(
                                    'Password:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller: passwordController,
                                      obscureText: _isPasswordVisible,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: const Color(0xFF212A3E),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isPasswordVisible =
                                                  !_isPasswordVisible;
                                            });
                                          },
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Color(0xFF212A3E),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  //LSIT/LHOS dropdown menu
                                  const Text(
                                    "Type:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 380,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.white),
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      dropdownColor: Colors.grey[300],
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.school_rounded,
                                          color: Color(0xFF212A3E),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      value: selectedUniversity,
                                      items: const [
                                        DropdownMenuItem<String>(
                                          value: 'LSIT',
                                          child: Text('LSIT'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'LHOS',
                                          child: Text('LHOS'),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          selectedUniversity = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          MyButton(
                                            onTap: signUserIn,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'FORGOT PASSWORD?',
                                            style: TextStyle(
                                              color: Color(0xFF212A3E),
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
