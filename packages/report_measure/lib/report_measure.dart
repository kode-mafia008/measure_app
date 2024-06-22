library report_measure;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
/// A Calculator.
import "package:global/global.dart";
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
part "domain/routes.dart";
part "display/landing_screen.dart";


//Screens
part "display/screens/homepage.dart";
part "display/screens/new_assessment_page.dart";
part "display/screens/questionnaire_page.dart";
part "display/screens/history_detail_page.dart";
//Widgets
part "display/widgets/cards.dart";
part "display/widgets/buttons.dart";
part "display/widgets/auto_complete_widget.dart";
part "display/widgets/styled_widgets.dart";
part "display/widgets/custom_headers.dart";
part "display/widgets/custom_switch.dart";
part "display/widgets/question_widget.dart";
part "display/widgets/result_widget.dart";

part "domain/assets_constants.dart";
part "domain/constants.dart";
part "domain/helpers.dart";
