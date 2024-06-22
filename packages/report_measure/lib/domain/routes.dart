part of report_measure;

class Routes {
  static String landing = '/landing';
  static String login = '/login-with-phone';
  static String newAssessment = '/new-assessment';
  static String questionnaire = '/questionnaire';
  static String assessmentDetail = '/assessment-detail';
}

mixin GoRoutes {
  static final routes = <RouteBase>[
    GoRoute(
      name: 'initial',
      path: '/',
      builder: (context, state) => LandingScreen(),
    ),
    GoRoute(
      name: 'landing',
      path: '/landing',
      builder: (context, state) => LandingScreen(),
    ),
    GoRoute(
        name: 'newAssessment',
        path: '/new-assessment',
        builder: (context, state) {
          final assessmentType = state.extra as Map<String, dynamic>?;

          return NewAssessmentPage(assessmentType: assessmentType);
        }),
    GoRoute(
        name: 'assessmentDetail',
        path: '/assessment-detail',
        builder: (context, state) {
          final data = state.extra  as Map<String, dynamic>;

          return AssessmentDetail(data: data);
        }),
    GoRoute(
        name: 'questionnaire',
        path: '/questionnaire',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return QuessionnairePage(
              questionnaire: data["questions"],
              assessmentBloc: data["assessmentBloc"]);
        }),
  ];
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: routes,
  );
}
