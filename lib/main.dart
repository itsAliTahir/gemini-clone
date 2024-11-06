import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'bloc/data_bloc.dart';
import 'splash_screen.dart';

void main() {
  Gemini.init(apiKey: "Api Key Here");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 19, 19, 19),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
