import 'package:flutter/material.dart';
import 'package:sinhgadapp/components/my_drawer.dart';

class AdditionalFees extends StatefulWidget {
  const AdditionalFees({super.key});

  @override
  State<AdditionalFees> createState() => _AdditionalFeesState();
}

class _AdditionalFeesState extends State<AdditionalFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      appBar: AppBar(
        title: const Text('ADDITIONAL FEES'),
        centerTitle: false,
        backgroundColor: const Color(0xFF212A3E),
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              // Add your widgets here
            ],
          ),
        ),
      ),
    );
  }
}
