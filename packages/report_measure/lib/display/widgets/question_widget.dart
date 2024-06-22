part of report_measure;

class QuestionFour extends StatefulWidget {
  final Map<String, dynamic>? questionFour;
  final QuestionnaireBloc bloc;
  const QuestionFour({
    super.key,
    this.questionFour,
    required this.bloc,
  });

  @override
  State<QuestionFour> createState() => _QuestionFourState();
}

class _QuestionFourState extends State<QuestionFour> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BoldText("${widget.questionFour?['name']}", 22, kBlack600),
        sizedBoxHeight(14),
        MediumText("${widget.questionFour?['description']}", 14, kGrey600),
        SizedBox(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 15),
            separatorBuilder: (context, index) {
              return sizedBoxHeight(2);
            },
            itemCount: widget.questionFour?['options'].length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // String ans = question1[index];
              var options = widget.questionFour?['options'][index];
              return Column(
                children: [
                  const Divider(
                    color: kGrey50,
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.bloc.selectedQuestion1Value = options['option'];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      alignment: Alignment.centerLeft,
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        elevation: 0.0,
                                        backgroundColor: Colors.transparent,
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(70),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          screenWidth * .70),
                                                  color: Colors.white,
                                                ),
                                                width: screenWidth * .80,
                                                height: screenHeight * .40,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: Image.asset(
                                                    option_images[index],
                                                    fit: BoxFit.cover,
                                                    // height: 200,
                                                    // width: 200,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return AlertDialog(
                                  //         shape: RoundedRectangleBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(20.0),
                                  //         ),
                                  //         elevation: 0.0,
                                  //         backgroundColor: Colors.transparent,
                                  //         content: Center(
                                  //           child: Container(
                                  //             alignment: Alignment.center,
                                  //             padding: const EdgeInsets.all(40),
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(400),
                                  //               color: Colors.white,
                                  //             ),
                                  //             width: screenWidth * .80,
                                  //             height: screenHeight * .4,
                                  //             child: ClipRRect(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(20.0),
                                  //               child: Image.asset(
                                  //                 option_images[index],
                                  //                 fit: BoxFit.cover,
                                  //                 // height: 200,
                                  //                 // width: 200,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       );
                                  //     });

                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return SizedBox(
                                  //       height: 100,
                                  //       child: AlertDialog(
                                  //         contentPadding:
                                  //             const EdgeInsets.all(0),

                                  //         backgroundColor: Colors.transparent,
                                  //         content: Center(
                                  //           child: Container(
                                  //             // margin: const EdgeInsets.symmetric(
                                  //             //     horizontal: 27),
                                  //             alignment: Alignment.center,
                                  //             // height: 300,
                                  //             width: screenWidth,
                                  //             decoration: BoxDecoration(
                                  //               color: kWhite,
                                  //               borderRadius:
                                  //                   BorderRadius.circular(400),
                                  //               border: Border.all(
                                  //                   color: kGrey50, width: 1),
                                  //             ),
                                  //             child: Image.asset(
                                  //               option_images[index],
                                  //               height: 150,
                                  //               width: 120,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     );
                                  //   },
                                  // );
                                },
                                child: Container(
                                  height: 67,
                                  width: 67,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    border:
                                        Border.all(color: kGrey50, width: 1),
                                  ),
                                  child: Image.asset(option_images[index]),
                                ),
                              ),
                              sizedBoxWidth(12),
                              BoldText(options['option'], 18, kBlack600)
                            ],
                          ),
                          CustomSwitch(bloc: widget.bloc, options: options)
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        sizedBoxHeight(70),
        ValueListenableBuilder<int>(
          valueListenable: widget.bloc.totalCorrect,
          builder: (context, value, child) {
            return BoldText(
                "${widget.bloc.totalCorrect.value} Correct", 18, kOrange700);
          },
        ),
      ],
    );
  }
}

class QuestionThree extends StatelessWidget {
  final Map<String, dynamic>? questionThree;
  final QuestionnaireBloc bloc;
  const QuestionThree({
    super.key,
    this.questionThree,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    bloc.questionThreeValue = "Correct";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MediumText('Recall question:  ', 14, kGrey300),
          sizedBoxHeight(14),
          BoldText('${questionThree!['name']}', 14, kGrey300),
          sizedBoxHeight(24),
          MediumText('${questionThree!['description']}', 14, kGrey300,
              align: TextAlign.left),
        ],
      ),
    );
  }
}

class QuestionTwo extends StatefulWidget {
  final Map<String, dynamic>? questionTwo;
  final QuestionnaireBloc bloc;
  const QuestionTwo({
    super.key,
    this.questionTwo,
    required this.bloc,
  });

  @override
  State<QuestionTwo> createState() => _QuestionTwoState();
}

class _QuestionTwoState extends State<QuestionTwo> {
  checkIsPresent(String name) {
    if (widget.bloc.selectedQuestion2Value.value.contains(name)) {
      return true;
    }
    return false;
  }

  toggleSelected(var option) {
    if (widget.bloc.selectedQuestion2Value.value.contains(option["name"])) {
      widget.bloc.selectedQuestion2Value.value.remove(option["name"]);
      if (option['value']) {
        widget.bloc.totalValueNotifier.value -= 3;
      }
      setState(() {});
    } else {
      widget.bloc.selectedQuestion2Value.value.add(option["name"]);
      if (option["value"]) {
        widget.bloc.totalValueNotifier.value += 3;
      }
      setState(() {});
    }
    if (widget.bloc.totalValueNotifier.value >= 3) {
      widget.bloc.questionTwoValue = "Correct";
    } else {
      widget.bloc.questionTwoValue = "Incorrect";
    }
    // updateValidation(6);
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    var questionTwo = widget.questionTwo;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          BoldText('${questionTwo?['name']}', 22, kBlack600),
          sizedBoxHeight(14),
          ShowAllText(
            "${questionTwo?['description']}",
            14,
            kGrey600,
          ),
          sizedBoxHeight(26),
          SizedBox(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) {
                return sizedBoxHeight(13);
              },
              itemCount: questionTwo?['options'].length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var option = questionTwo?['options'][index];
                String ans = option['name'];
                bool value = option['value'];
                bool isPresent = checkIsPresent(ans);

                return GestureDetector(
                  onTap: () {
                    toggleSelected(option);
                    // checkIfSwitched(isPresent, value);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 17),
                    height: 77,
                    alignment: Alignment.centerLeft,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: kWhite,
                        boxShadow: isPresent ? cardShadow : noShadow,
                        border: Border.all(
                            color: isPresent ? kOrange600 : kGrey200,
                            width: isPresent ? 2 : 1),
                        borderRadius: BorderRadius.circular(13)),
                    child: Row(
                      children: [
                        isPresent
                            ? SvgPicture.asset(Assets.icons.selection)
                            : Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(26),
                                    border: Border.all(color: kGrey400)),
                              ),
                        sizedBoxWidth(12),
                        BoldText(ans, 18, kBlack600)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionOne extends StatefulWidget {
  final Map<String, dynamic>? questionOne;
  final QuestionnaireBloc bloc;
  const QuestionOne({
    super.key,
    this.questionOne,
    required this.bloc,
  });

  @override
  State<QuestionOne> createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
  bool _checkAnswer(bool value) {
    if (value) {
      widget.bloc.totalValueNotifier.value += 3;
      return true;
    } else {
      widget.bloc.totalValueNotifier.value = 0;
      return false;
    }
    // print(widget.bloc.totalValueNotifier.value);
  }

  @override
  Widget build(BuildContext context) {
    var questionOne = widget.questionOne;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          BoldText("${questionOne?['name']}", 22, kBlack600),
          sizedBoxHeight(14),
          MediumText("${questionOne?['description']}.", 14, kGrey600),
          SizedBox(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) {
                return sizedBoxHeight(13);
              },
              itemCount: questionOne?['options'].length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var option = questionOne?['options'][index];
                String ans = option['name'];
                Color activeColor = widget.bloc.selectedQuestion1Value == ans
                    ? kOrange600
                    : kGrey200;
                double activeWidth =
                    widget.bloc.selectedQuestion1Value == ans ? 2 : 1;
                List<BoxShadow> activeShadow =
                    widget.bloc.selectedQuestion1Value == ans
                        ? cardShadow
                        : noShadow;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.bloc.selectedQuestion1Value = ans;
                    });
                    widget.bloc.questionOneValue =
                        _checkAnswer(option['value']) ? "Correct" : "Incorrect";
                    // print(widget.bloc.questionOneValue);
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 17),
                      height: 77,
                      alignment: Alignment.centerLeft,
                      width: screenWidth,
                      decoration: BoxDecoration(
                          color: kWhite,
                          boxShadow: activeShadow,
                          border: Border.all(
                              color: activeColor, width: activeWidth),
                          borderRadius: BorderRadius.circular(13)),
                      child: BoldText(option['name'], 18, kBlack600)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
