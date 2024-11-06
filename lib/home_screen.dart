import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_clone/chat.dart';
import 'package:gemini_clone/drawer.dart';
import 'package:gemini_clone/fields.dart';

import 'bloc/data_bloc.dart';
import 'myappbar.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const MyAppBar(
            avatarImage: 'assets/placeholder.jpg',
          ),
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: DelayedDisplay(
                      fadeIn: !state.isDrawerOpen,
                      slidingBeginOffset: const Offset(0, 0.2),
                      fadingDuration: const Duration(milliseconds: 100),
                      child: const MyChat())),
              Positioned(
                  bottom: 0,
                  child: DelayedDisplay(
                      fadeIn: !state.isDrawerOpen,
                      slidingBeginOffset: const Offset(0, 0.5),
                      fadingDuration: const Duration(milliseconds: 100),
                      child: const MyFields())),
              Positioned(
                  top: 0,
                  child: DelayedDisplay(
                      fadeIn: state.isDrawerOpen,
                      slidingBeginOffset: const Offset(0, 1),
                      child: const MyDrawer())),
            ],
          ),
        );
      },
    );
  }
}
