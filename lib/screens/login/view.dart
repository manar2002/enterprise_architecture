import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/app_router/app_router.dart';
import '../../widgets/confirm_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/input_form_field.dart';
import '../home/view.dart';
import '../sign_up/view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(height: getHeight(context, 13, subtractAppBar: false),),
          const MyText(
            data: 'Login',
            verticalMargin: 10,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          MyText(
            data: 'Enter your email & password',
            fontSize: 16,
            color: kGrayColor,
          ),
          const InputFormField(
            verticalMargin: 30,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const InputFormField(
            labelText: 'Password',
            secure: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: MyText(
                data: 'Forget Password ?',
                color: kBlackColor,
              ),
            ),
          ),
          ConfirmButton(
            title: "Login",
            onPressed: () => AppRouter.navigateAndPopAll(context, const HomeScreen()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyText(data: 'Don\'t have an account?'),
              TextButton(
                onPressed: () => AppRouter.navigateAndPopAll(context, const SignUpView()),
                child: MyText(
                  data: 'Sign up',
                  color: kPrimaryColor,
                ),
              ),
            ],),
        ],),
    );
  }
}
