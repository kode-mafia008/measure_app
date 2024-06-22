import 'package:flutter/material.dart';
import 'package:global/global.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:measure_app/app.dart';
import 'package:measure_app/firebase_options.dart';

void main() async {
// ...
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirestoreService _firestoreService = FirestoreService();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) =>
            AssessmentBloc(_firestoreService)..add(LoadAssessment()),
      ),
      BlocProvider(
        create: (context) => QuestionnaireBloc(_firestoreService),
      ),
      BlocProvider<UsersBloc>(
        create: (context) => UsersBloc(_firestoreService)..add(LoadUsers()),
      ),
    ], child: const MyApp()),
  );
}
