import 'package:enterprise_architecture/screens/home/view.dart';
import 'package:enterprise_architecture/screens/splash/view.dart';
import 'package:flutter/material.dart';
import 'database/cart_helper.dart';
import 'database/fav_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CartHelper.instance.open();
  await FavProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SplashView(),
    );
  }
}