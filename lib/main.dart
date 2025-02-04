import 'package:flutter/material.dart';
import 'package:sinhgadapp/pages/initial_page.dart';
// import 'package:sinhgad_app/pages/initial_page.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //supabase setup
  // await Supabase.initialize(
  //   anonKey:
  //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBwZmRsZGZwemJ0ZWxxanZtd3drIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIzNDM2ODQsImV4cCI6MjA0NzkxOTY4NH0.e2cBUm4tXTnb4AcYzY8MQgONl-vbxv93Qmlrc7_m5Cg",
  //   url: "https://ppfdldfpzbtelqjvmwwk.supabase.co",
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialPage(),
    );
  }
}
