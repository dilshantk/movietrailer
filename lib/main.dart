import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task1/provider/data_provider.dart';
import 'package:task1/provider/home_page_provider.dart';
import 'package:task1/provider/people_data_provider.dart';
import 'package:task1/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(create: (context) => PeopleDataProvider()),
      ],
      child: MaterialApp(
        title: 'Moviebooking',
        theme: ThemeData(backgroundColor: Colors.black87),
        home: const SplashScreen(),
      ),
    );
  }
}
