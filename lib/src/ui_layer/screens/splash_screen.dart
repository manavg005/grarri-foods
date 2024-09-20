// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grarri/src/business_layer/util/helper/log_helper.dart';
import 'package:grarri/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/ui_layer/screens/home_screen.dart';
import 'package:grarri/src/ui_layer/widgets/image_widgets.dart';

/// Represents the [SplashScreen] widget, displayed at the app's launch.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  /// Creates the state for this widget.
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/// The state of the [SplashScreen] widget.
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final String _tag = "SplashScreen: ";
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;

  /// Initializes the state of the widget when it is first created.
  ///
  /// Initializes the background content fade animation and schedules
  /// the [_onAfterBuild] method to be called after the first frame has
  /// been rendered.
  @override
  void initState() {
    super.initState();
    _backgroundContentFadeAnimation();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onAfterBuild(context));
  }

  /// Disposes of resources used by this widget.
  @override
  void dispose() {
    // Dispose animation controller before widget disposal
    _fadeAnimationController.dispose();
    super.dispose();
  }

  /// Builds the UI for this widget.
  @override
  Widget build(BuildContext context) {
    _fadeAnimationController.forward();
    return _mainWidget(context);
  }

  /// Builds the main UI of the SplashScreen.
  ///
  /// Displays the app's logo with a fade-in effect.
  Widget _mainWidget(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Hero(
            tag: "logo",
            child: Padding(
              padding: AppStyles.pd100,
              child: const ImageWidget(
                imagePath: AppImages.appIcon,
                color: Colors.green,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Initializes the background content fade animation.
  ///
  /// Sets up an animation controller with a fade animation curve.
  void _backgroundContentFadeAnimation() {
    _fadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: i_750),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeAnimationController,
      curve: Curves.easeInSine,
    );
  }

  /// Called after build method.
  ///
  Future<void> _onAfterBuild(BuildContext context) async {
    LogHelper.logData("$_tag Started.");
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.pushAndRemoveUntil(
      context,
      ScreenNavigation.createRoute(
        widget: const HomeScreen(),
        showPageRoute: true,
      ),
      (route) => false,
    );
  }
}
