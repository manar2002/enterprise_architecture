import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../core/app_router/app_router.dart';
import '../on_boarding/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      AppRouter.navigateAndPopAll(context, const OnBoardingView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: kSplashColor,
        child: Image.asset(getAsset('logoB'),width: double.infinity,height: double.infinity,),
      ),
    );
  }
}
