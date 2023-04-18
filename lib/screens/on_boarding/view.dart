import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../core/app_router/app_router.dart';
import '../../widgets/confirm_button.dart';
import '../../widgets/custom_text.dart';
import '../welcome/view.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(getAsset('woman'),
            width: getWidth(context, 1),
            height: getHeight(context, 1, subtractAppBar: false),
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: MyText(
                    data: "Welcome\nto our store",
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    textAlign: TextAlign.center,
                  ),
                ),
                MyText(
                  data: 'Ger your clothes in a fast way',
                  color: kGrayColor,
                  textAlign: TextAlign.center,
                ),
                ConfirmButton(
                  title: "Get Started",
                  verticalMargin: 20,
                  onPressed: () => AppRouter.navigateAndPopAll(context, const WelcomeView()),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}