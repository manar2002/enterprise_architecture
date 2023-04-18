import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../core/app_router/app_router.dart';
import '../../widgets/confirm_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/drop_menu.dart';
import '../home/view.dart';

class SelectLocationView extends StatelessWidget {
  const SelectLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(getAsset('map')),
              const MyText(
                data: 'Select Your Location',
                fontWeight: FontWeight.bold,
                fontSize: 26,
                textAlign: TextAlign.center,
              ),
              MyText(
                data:
                    'Switch on your location to stay in tune with what’s happening in your area',
                verticalMargin: 15,
                color: kGrayColor,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
              DropMenu(
                labelText: 'Your Zone',
                items: const ['Cairo', 'Alex', 'Mansoura', 'Tanta'],
                onChanged: (v) {
                  if (kDebugMode) {
                    print("Your Zone is $v");
                  }
                },
              ),
              DropMenu(
                labelText: 'Your Area',
                items: const ['Maadi', 'Giza', 'Tahreer'],
                onChanged: (v) {
                  if (kDebugMode) {
                    print("Your Area is $v");
                  }
                },
              ),
              const SizedBox(height: 40),
              ConfirmButton(
                title: 'Submit',
                onPressed: () => AppRouter.navigateAndPopAll(context, const HomeScreen()),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
