part of report_measure;

class CustomSwitch extends StatefulWidget {
  final QuestionnaireBloc bloc;
  final Map<String, dynamic> options;
  const CustomSwitch({
    super.key,
    required this.bloc,
    required this.options,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isSwitched = false;

  checkIfSwitched(isSwitched) {
    if (isSwitched && widget.options['value']) {
      widget.bloc.totalValueNotifier.value += 3;
      widget.bloc.totalCorrect.value += 1;
    } else if (!isSwitched && widget.options['value']) {
      widget.bloc.totalValueNotifier.value -= 3;
      widget.bloc.totalCorrect.value -= 1;
    }
    if (widget.bloc.totalCorrect.value >= 1) {
      widget.bloc.questionFourValue = "Correct";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSwitched = !isSwitched;
          checkIfSwitched(isSwitched);
        });
      },
      child: Container(
        width: 45,
        height: 30,
        padding: const EdgeInsets.all(2.4),
        decoration: ShapeDecoration(
          color: isSwitched ? kOrange800 : kSwitch,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.4),
          ),
        ),
        child: Row(
          mainAxisAlignment:
              isSwitched ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const ShapeDecoration(
                color: Color(0xFFF8F9FB),
                shape: OvalBorder(),
                shadows: [
                  BoxShadow(
                    color: Color(0x0F101828),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x19101828),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
