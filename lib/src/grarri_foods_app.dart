import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grarri/src/business_layer/util/helper/helper.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/provider_registration.dart';
import 'package:grarri/src/ui_layer/screens/splash_screen.dart';
import 'package:provider/provider.dart';

/// [navigatorKey] is a global key to access the current context, state, and widget of
/// the [MaterialApp].
final navigatorKey = GlobalKey<NavigatorState>();

/// The [GrarriFoods] class is a StatefulWidget that represents the root of the
/// Flutter application.
class GrarriFoods extends StatefulWidget {
  const GrarriFoods({super.key});

  @override
  State<GrarriFoods> createState() => _GrarriFoodsState();
}

/// The [_GrarriFoodsState] class represents the state of the
/// [GrarriFoods]. It also implements the [WidgetsBindingObserver]
/// for observing app lifecycle events.
class _GrarriFoodsState extends State<GrarriFoods> with WidgetsBindingObserver {
  final String _tag = "MyApp:"; // A tag used for debugging.

  @override
  void initState() {
    super.initState();

    /// Add observer for app lifecycle events.
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    /// Remove observer before widget disposal.
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    LogHelper.logData("$_tag AppLifecycleState ===> $state");
    _handleAppLifeCycleStates(state);
  }

  /// Method used to handle different app lifecycle states.
  void _handleAppLifeCycleStates(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:

        /// TODO: Perform actions when the app goes into the background.
        /// For example, save the current state, pause ongoing tasks,
        /// or release resources.
        break;
      case AppLifecycleState.resumed:

        /// TODO: Perform actions when the app returns from the background.
        /// For example, resume paused tasks or refresh data.
        break;
      case AppLifecycleState.detached:

        /// TODO: Perform actions when the app is detached.
        /// This state usually occurs when the app is being terminated.
        break;
      case AppLifecycleState.inactive:

        /// TODO: Perform actions when the app is in an inactive state.
        /// This state occurs before the app is paused or resumed.
        break;
      case AppLifecycleState.hidden:

        /// TODO: Perform actions when the app's UI is hidden.
        /// This state occurs when the app's UI is obscured by another activity.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _mainApp(context);
  }

  /// Builds the main app content based on the app's locale.
  Widget _mainApp(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: RegisterProviders.providers(context),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(d_1),
              ),
              child: child!,
            );
          },
          theme: ThemeData(useMaterial3: false),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ),
      ),
    );
  }

  /// Returns a loading widget for the app.
  Widget _loadingWidget(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
