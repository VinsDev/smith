import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smith/base.dart';
import 'package:smith/constants/values.dart';
import 'package:smith/providers/switch_notifier.dart';
import 'package:smith/widgets/messages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SwitchNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Smith',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splash: messageBox1("SMITH"),
          duration: 2000,
          nextScreen: const Base(),
        ),
      ),
    );
  }
}
