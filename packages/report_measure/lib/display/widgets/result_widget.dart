part of report_measure;

class AssessmentResult extends StatelessWidget {
  final Assessment assessment;
  const AssessmentResult({
    super.key,
    required this.assessment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        children: [
          BoldText("Confirm the results", 22, kBlack600),
          sizedBoxHeight(14),
          ResultChart(assessment: assessment),
        ],
      ),
    );
  }
}

class ResultChart extends StatelessWidget {
  const ResultChart({
    super.key,
    required this.assessment,
  });

  final Assessment assessment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        border: Border.all(color: kGrey50, width: 1),
        color: kWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08), // 8% opacity
            offset: const Offset(0, 24), // X: 0, Y: 24
            blurRadius: 64, // Blur: 64
            spreadRadius: -10, // Spread: -10
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressChartOne(
            totalValue: 18,
            currentValue: assessment.result ?? 0,
          ),
          sizedBoxHeight(32),
          const Divider(
            thickness: 1,
            color: kGrey50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText("Question 1", 14, kBlack600),
              BoldText(
                  "${assessment.test!['question1']}", 14, kTextGreen),
            ],
          ),
          sizedBoxHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText("Question 2", 14, kBlack600),
              BoldText(
                  "${assessment.test!['question2']}", 14, kTextGreen),
            ],
          ),
          sizedBoxHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText("Question 2", 14, kBlack600),
              BoldText(
                  "${assessment.test!['question3']}", 14, kTextGreen),
            ],
          ),
          sizedBoxHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText("Question 3", 14, kBlack600),
              BoldText(
                  "${assessment.test!['question4']}", 14, kTextGreen),
            ],
          ),
          // ElevatedButton(onPressed: (){}, child: Text("Print"))
        ],
      ),
    );
  }
}