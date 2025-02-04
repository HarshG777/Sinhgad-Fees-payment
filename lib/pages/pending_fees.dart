import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sinhgadapp/components/my_drawer.dart';

class PendingFees extends StatefulWidget {
  const PendingFees({super.key});

  @override
  State<PendingFees> createState() => _PendingFeesState();
}

class _PendingFeesState extends State<PendingFees> {
  late Razorpay _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {}

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_zNq9qr7IHNNOiR',
      'amount': 2000,
      'name': 'Anuj Sharma',
      'description': 'Test Payment Sinhgad App',
      'prefill': {
        'contact': '9999999999',
        'email': 'test@razorpay.com',
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      appBar: AppBar(
        title: const Text('PENDING FEES'),
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
                onPressed: () {
                  openCheckout();
                },
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
