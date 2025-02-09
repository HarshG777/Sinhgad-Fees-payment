import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:sinhgadapp/pdf/save_and_open_pdf.dart';
// import 'package:number_to_words/number_to_words.dart' as ntw;

class SimplePdfApi {
  static Future<File> generatePdf(
    num developmentFees,
    num tutionFees,
    num libraryFees,
    num studentInsurance,
    num medicalFee,
  ) async {
    final pdf = Document();
    // Generate a random receipt number
    final receiptNumber = generateReceiptNumber();
    // final num developmentFees = 12550;
    // final num tutionFees = 52000;
    // final num libraryFees = 1200;
    // final num studentInsurance = 25;
    // final num medicalFee = 125;

    final num totalAmount = developmentFees +
        tutionFees +
        libraryFees +
        studentInsurance +
        medicalFee;

    // final totalAmountInWords =
    //     ntw.NumberToWord().convert('en', totalAmount.toInt());

    final image1 =
        (await rootBundle.load('assets/sinhgadlogo.png')).buffer.asUint8List();
    final stamp =
        (await rootBundle.load('assets/stamp.png')).buffer.asUint8List();

    final now = DateTime.now();
    final formattedDate =
        '${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}';
    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) => FullPage(
        ignoreMargins: true,
        child: Column(
          children: [
            Container(
                height: 294.5, width: 700, color: const PdfColor.fromInt(0xFFCAF4FF)),
            Container(
                height: 500, width: 700, color: const PdfColor.fromInt(0xFFFFF9D0)),
            // Container(
            //     height: 147, width: 700, color: PdfColor.fromInt(0xFFCAF4FF)),
          ],
        ),
      ),
    );

    pdf.addPage(
      MultiPage(
        pageTheme: pageTheme,
        build: (context) => <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SINHGAD TECHNICAL EDUCATION SOCIETY, PUNE"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image(MemoryImage(image1), width: 125, height: 125),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FEES ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "RECEIPT",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("STUDENT ID: 2222/LSIT/000001"),
                  Text("NAME: Anuj Suresh Sharma"),
                  Text("MOTHER'S NAME: Nayana Sharma"),
                  Text("CLASS: SE"),
                  Text("BRAMCH: Computer"),
                  Text("COURSE: BACHELOR OF ENGINEERING"),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("DATE: $formattedDate"),
                  Text("RECEIPT NO: $receiptNumber"),
                ],
              )
            ],
          ),
          Divider(),
          SizedBox(height: 10),
          // Add a two-column table with five rows
          Table.fromTextArray(
            headers: ['DESCRIPTION', 'AMOUNT(Rs.)'],
            data: [
              ['Development Fees', '$developmentFees'],
              ['Tuition Fees', '$tutionFees'],
              ['Library Fees', '$libraryFees'],
              ['Student Insurance', '$studentInsurance'],
              ['Medical Fee', '$medicalFee'],
              ['Total', '$totalAmount'],
            ],
            headerStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: PdfColors.white,
            ),
            headerDecoration: const BoxDecoration(
              color: PdfColor.fromInt(0xFFA0DEFF),
            ),
            cellStyle: const TextStyle(
              fontSize: 12,
            ),
            cellAlignments: {
              0: Alignment.centerLeft,
              1: Alignment.centerRight,
            },
            border: null,
          ),
          Divider(),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text("Total: "),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                          "${developmentFees + tutionFees + libraryFees + studentInsurance + medicalFee}"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              // Text("Amount in Words: $totalAmountInWords"),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text("MODE OF PAYMENT: e-Payment"),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text("College Stamp:"),
                      SizedBox(height: 10),
                      Image(MemoryImage(stamp), width: 125, height: 125),
                    ],
                  )
                ],
              )
            ],
          ),

          // Add other widgets here
        ],
      ),
    );

    return SaveAndOpenPdf.savePdf(name: 'simple_text.pdf', pdf: pdf);
  }

  static String generateReceiptNumber() {
    final now = DateTime.now();
    final year = now.year;
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final randomDigits =
        (1000 + (9999 - 1000) * (now.millisecondsSinceEpoch % 1000) ~/ 1000)
            .toString();

    return 'LSIT/$year$month$day/$randomDigits';
  }
}
