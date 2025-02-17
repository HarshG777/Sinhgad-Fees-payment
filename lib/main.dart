import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sinhgadapp/firebase_options.dart';
import 'package:sinhgadapp/pages/initial_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:sinhgad_app/pages/initial_page.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://tmlnidltpfwbjsigzrbn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRtbG5pZGx0cGZ3YmpzaWd6cmJuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg3NjE0MTUsImV4cCI6MjA1NDMzNzQxNX0.99BYAog1-H2fEjaodDgyuA6jF4wOngze5_huz7HajzE',
  );
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
