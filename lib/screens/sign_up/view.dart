import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../core/app_router/app_router.dart';
import '../../widgets/confirm_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/input_form_field.dart';
import '../login/view.dart';
import '../otp/view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
                   SizedBox(height: getHeight(context, 13, subtractAppBar: false),),
          const MyText(
            data: 'Sign Up',
            verticalMargin: 10,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          MyText(
            data: 'Enter your credentials to continue',
            fontSize: 16,
            color: kGrayColor,
          ),
          const SizedBox(height: 30),
          const InputFormField(
            labelText: 'Username',
          ),
          const InputFormField(
            verticalMargin: 20,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const InputFormField(
            labelText: 'Password',
            secure: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: RichText(
              text: TextSpan(
                text: 'By continuing you agree to our ',
                style: TextStyle(
                  color: kGrayColor,
                ),
                children: [
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold
                    ),
                    children: [
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          color: kGrayColor,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              if (kDebugMode) {
                                print('Privacy Policy.');
                              }
                            },
                          ),
                        ],),
                    ],),
                ],),
            ),
          ),
          ConfirmButton(
            title: "Sign Up",
            onPressed: () => AppRouter.navigateAndPopAll(context, const OTPView()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyText(data: 'Have an account?'),
              TextButton(
                onPressed: () => AppRouter.navigateAndPopAll(context, const LoginView()),
                child: MyText(
                  data: 'Login now',
                  color: kPrimaryColor,
                ),
              ),
            ],),
        ],),
    );
  }
}
