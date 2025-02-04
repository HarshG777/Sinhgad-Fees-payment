import 'package:flutter/material.dart';
import 'package:sinhgadapp/components/long_button.dart';
import 'package:sinhgadapp/components/my_drawer.dart';
import 'package:sinhgadapp/pages/fee_receipt.dart';
import 'package:sinhgadapp/pages/provisional_fees_receipt.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      appBar: AppBar(
        title: const Text('PAYMENT HISTORY'),
        centerTitle: false,
        backgroundColor: const Color(0xFF212A3E),
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 80),
              LongButton(
                  title: "Fees Receipt",
                  image: Image.asset('assets/fees receipt.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeeReceipt()),
                    );
                  }),
              SizedBox(height: 20),
              LongButton(
                  title: " Provisional Fees Receipt",
                  image: Image.asset('assets/provisional fee receipt.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProvisionalFeesReceipt()),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
