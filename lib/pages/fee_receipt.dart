import 'package:flutter/material.dart';
import 'package:sinhgadapp/components/my_drawer.dart';

class FeeReceipt extends StatefulWidget {
  const FeeReceipt({super.key});

  @override
  State<FeeReceipt> createState() => _FeeReceiptState();
}

class _FeeReceiptState extends State<FeeReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      appBar: AppBar(
        title: const Text('FEE RECEIPT'),
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
              ElevatedButton(
                onPressed: () {},
                child: const Text('Pay'),
              ),
              // Add your widgets here
            ],
          ),
        ),
      ),
    );
  }
}
