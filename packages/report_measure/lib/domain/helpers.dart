part of report_measure;

String buttonText(int index) {
      if (index == 3) {
        return "Finish";
      } else if (index == 4) {
        return "Print";
      } else {
        return "Continue";
      }
    }

void printToPdf(BuildContext context,Assessment assessment) async {
  // final assessment = {}; // Replace with your assessment object

  // Create a PDF document
  final pdf = pw.Document();
final ttf = await rootBundle.load('assets/fonts/Roboto-Regular.ttf');
final myCustomFont = pw.Font.ttf(ttf.buffer.asByteData());

  // Add page to the PDF document
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          width: PdfPageFormat.a4.width,
          padding: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey50, width: 1),
            color: PdfColors.white,
            borderRadius: pw.BorderRadius.circular(15),
            boxShadow: const [
              pw.BoxShadow(
                color: PdfColors.lightBlueAccent100,
                // offset:  p,
                blurRadius: 64,
                spreadRadius: -10,
              ),
            ],
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Center(
                child: CircularProgressChart(
                  totalValue: 18,
                  currentValue: assessment.result ?? 0,
                ).buildPdf(context),
              ),
              pw.SizedBox(height: 32),
              pw.Divider(thickness: 1, color: PdfColors.grey50),
              buildRow("Question 1", "${assessment.test?['question1']}", 14,myCustomFont),
              pw.SizedBox(height: 16),
              buildRow("Question 2", "${assessment.test?['question2']}", 14,myCustomFont),
              pw.SizedBox(height: 16),
              buildRow("Question 3", "${assessment.test?['question3']}", 14,myCustomFont),
              pw.SizedBox(height: 16),
              buildRow("Question 4", "${assessment.test?['question4']}", 14,myCustomFont),
            ],
          ),
        );
      },
    ),
  );
    final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/example.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());

  // Open the PDF file
  // Replace this with appropriate code to open PDF file based on platform
  // For example, on Android you can use OpenFile.open(path);
}
pw.Widget buildRow(String label, String value, double fontSize,pw.Font font) {
  return pw.Container(
    margin: pw.EdgeInsets.symmetric(vertical: 8),
    child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(font: font, fontSize: fontSize, color: PdfColors.black),
        ),
        pw.Text(
          value,
          style: pw.TextStyle(fontSize: fontSize, color: PdfColors.green),
        ),
      ],
    ),
  );
}
