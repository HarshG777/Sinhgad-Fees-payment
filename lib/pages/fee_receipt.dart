import 'package:flutter/material.dart';
import 'package:sinhgadapp/components/my_drawer.dart';
import 'package:sinhgadapp/components/payment_tile.dart';
import 'package:sinhgadapp/pdf/save_and_open_pdf.dart';
import 'package:sinhgadapp/pdf/simple_pdf_api.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          child: Column(
            children: [
              //tiles for pdf
              PaymentTile(
                onTap: () async {
                  final simplePdfFile =
                      await SimplePdfApi.generateSimpleTextPdf(
                    'Receipt No. : LSIT/00001',
                    'Paid Date: 2024/01/01',
                  );
                  SaveAndOpenPdf.openPdf(simplePdfFile);
                },
              ),
              PaymentTile(
                onTap: () async {
                  final simplePdfFile =
                      await SimplePdfApi.generateSimpleTextPdf(
                    'Receipt No. : LSIT/00001',
                    'Paid Date: 2024/01/01',
                  );
                  SaveAndOpenPdf.openPdf(simplePdfFile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
