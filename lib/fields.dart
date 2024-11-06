import 'dart:async';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/data_bloc.dart';

class MyFields extends StatefulWidget {
  const MyFields({super.key});

  @override
  State<MyFields> createState() => _MyFieldsState();
}

class _MyFieldsState extends State<MyFields> with WidgetsBindingObserver {
  Timer? _keyboardCloseTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _keyboardCloseTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    // Cancel any existing timer before setting a new one
    _keyboardCloseTimer?.cancel();

    // Add a slight delay to debounce the check for keyboard close
    _keyboardCloseTimer = Timer(const Duration(milliseconds: 100), () {
      final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
      if (bottomInset == 0) {
        _onKeyboardClosed();
      }
    });
  }

  void _onKeyboardClosed() {
    final state = context.read<DataBloc>().state;

    if (state.isTextFormOpen && state.myText.isEmpty) {
      // If text form is open but empty, close the field
      context.read<DataBloc>().add(CloseTextFormField());
    } else {
      // If form has text, keep the focus on the input field
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(state.inputFocus);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            final bloc = context.read<DataBloc>();
            final state = bloc.state;

            if (state.isTextFormOpen && state.myText.isEmpty) {
              // Close the text field if it's open and empty
              bloc.add(CloseTextFormField());
            } else {
              // Request focus to open the keyboard
              WidgetsBinding.instance.addPostFrameCallback((_) {
                state.inputFocus.requestFocus();
              });
            }
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.only(bottom: 10),
            duration: Duration(milliseconds: state.milliSeconds),
            height: state.isTextFormOpen ? 200 : 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 19, 19),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(state.isTextFormOpen ? 20 : 0),
                topRight: Radius.circular(state.isTextFormOpen ? 20 : 0),
              ),
              boxShadow: [
                state.isTextFormOpen
                    ? const BoxShadow(
                        offset: Offset(0, -0.1),
                        color: Color.fromARGB(174, 158, 158, 158),
                        blurRadius: 2)
                    : const BoxShadow()
              ],
              border: const Border(
                top: BorderSide(
                  color: Color.fromARGB(171, 158, 158, 158),
                  width: 0.35,
                ),
              ),
            ),
            child: Center(
              child: Stack(
                children: [
                  state.isTextFormOpen
                      ? Positioned(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) {
                                      context
                                          .read<DataBloc>()
                                          .add(TextChangedEvent(value));
                                    },
                                    maxLines: 5,
                                    controller: state.inputController,
                                    focusNode: state.inputFocus,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: "Type, talk or share a photo",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_outward_rounded,
                                      color: Colors.grey),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: state.isTextFormOpen ? 50 : 0,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: state.isTextFormOpen
                                ? 125
                                : MediaQuery.of(context).size.width - 80,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: state.isTextFormOpen
                                    ? Colors.transparent
                                    : const Color.fromARGB(120, 158, 158, 158),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<DataBloc>()
                                          .add(OpenTextFormField());
                                    },
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 19, 19, 19),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      padding: const EdgeInsets.only(
                                          left: 18, right: 20),
                                      child: const Center(
                                        child: Text(
                                          "Type, talk or share a picture.",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 158, 158, 158),
                                              fontSize: 15),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  height: 53,
                                  margin: const EdgeInsets.only(right: 2.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: const Color.fromARGB(
                                        255, 211, 227, 253),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          color: const Color.fromARGB(
                                              255, 5, 29, 73),
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.mic,
                                            size: 22,
                                          )),
                                      IconButton(
                                          color: const Color.fromARGB(
                                              255, 5, 29, 73),
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.camera_alt_sharp,
                                            size: 22,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          state.myText.isNotEmpty
                              ? Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: IconButton(
                                    icon:
                                        const Icon(FluentIcons.send_32_regular),
                                    color: const Color.fromARGB(
                                        255, 137, 173, 232),
                                    onPressed: () {
                                      final bloc = context.read<DataBloc>();
                                      final state = bloc.state;

                                      if (state.myText.isNotEmpty) {
                                        bloc.add(SendMessage(state.myText));

                                        state.inputController.clear();
                                        state.inputFocus.unfocus();

                                        bloc.add(CloseTextFormField());

                                        if (state.chatList.isNotEmpty) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            state.chatScrollController
                                                .animateTo(
                                              state.chatScrollController
                                                  .position.maxScrollExtent,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeOut,
                                            );
                                            print(
                                                "done animation: ${state.chatScrollController.position.maxScrollExtent}");
                                          });
                                        }
                                      }
                                    },
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 30, 31, 33),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {},
                                    icon: const Icon(
                                      FluentIcons
                                          .sound_wave_circle_sparkle_48_regular,
                                      size: 30,
                                    ),
                                  )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
