import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:sinhgadapp/pdf/save_and_open_pdf.dart';

class SimplePdfApi {
  static Future<File> generateSimpleTextPdf(String text, String text2) async {
    final pdf = Document();

    pdf.addPage(
      Page(
        build: (_) => Center(
          child: Column(children: [
            Text(text, style: TextStyle(fontSize: 30)),
            Text(text2),
          ]),
        ),
      ),
    );
    return SaveAndOpenPdf.savePdf(name: 'simple_text.pdf', pdf: pdf);
  }
}
