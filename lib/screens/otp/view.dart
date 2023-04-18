import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../core/app_router/app_router.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/input_form_field.dart';
import '../select_location/view.dart';

class OTPView extends StatelessWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const MyText(
              data: 'Enter your 4-digit code',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            const InputFormField(
              verticalMargin: 30,
              labelText: 'Code',
              hintText: '- - - -',
              keyboardType: TextInputType.number,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: MyText(
                    data: 'Resend Code',
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  onTap: () => AppRouter.navigateAndPopAll(context, const SelectLocationView()),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor
                    ),
                    child: Icon(Icons.arrow_forward_ios, color: kWhiteColor),
                  ),
                ),
              ],),
          ],),
      ),
    );
  }
}
