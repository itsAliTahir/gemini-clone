import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gemini_clone/dashboard.dart';
import 'package:gemini_clone/model/chat_model.dart';
import 'package:gemini_clone/theme/app_theme.dart';
import 'package:lottie/lottie.dart';
import 'package:typethis/typethis.dart';

import 'bloc/data_bloc.dart';
import 'widgets/build_action_buttons.dart';
import 'widgets/shrimmer_effect.dart';

class MyChat extends StatefulWidget {
  const MyChat({super.key});

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> with WidgetsBindingObserver {
  bool _isKeyboardVisible = false;
  TypeThisController cont = TypeThisController();

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      _isKeyboardVisible = bottomInset > 0.0;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(builder: (context, state) {
      return AnimatedContainer(
        duration: Duration(milliseconds: state.milliSeconds),
        height: state.isTextFormOpen && _isKeyboardVisible
            ? MediaQuery.of(context).size.height - 457
            : state.isTextFormOpen
                ? MediaQuery.of(context).size.height - 257
                : MediaQuery.of(context).size.height - 157,
        width: MediaQuery.of(context).size.width,
        child: state.chatList.isEmpty
            ? const DashboardGrid()
            : Container(
                margin: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  key: ValueKey(
                      state.chatList.length), // Force rebuild on list change
                  padding: const EdgeInsets.only(bottom: 50),
                  controller: state.chatScrollController,
                  itemCount: state.chatList.length,
                  itemBuilder: (context, index) {
                    return state.chatList[index].role == Roles.user
                        ? SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.20,
                                    bottom: 5,
                                    right: 20,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 41, 42, 44),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    state.chatList[index].text,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20, bottom: 5, right: 20, top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: Lottie.asset(
                                            'assets/gemini.json',
                                            animate: true)),
                                    const Icon(
                                      FluentIcons.speaker_2_48_regular,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                margin: const EdgeInsets.only(
                                    left: 20, bottom: 5, right: 20),
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                  ),
                                ),
                                child: state.chatList[index].text.isEmpty
                                    ? SizedBox(
                                        height: 55,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ContinuousShimmer(
                                              delay: const Duration(
                                                  milliseconds: 0),
                                              period: const Duration(
                                                  milliseconds:
                                                      1500), // Overlap shimmer animation
                                              baseColor: const Color.fromARGB(
                                                  200, 30, 30, 42),
                                              highlightColor:
                                                  const Color.fromARGB(
                                                      200, 25, 78, 167),
                                              child: Container(
                                                height: 15,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        200, 30, 30, 42),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                              ),
                                            ),
                                            ContinuousShimmer(
                                              delay: const Duration(
                                                  milliseconds: 300),
                                              period: const Duration(
                                                  milliseconds: 1500),
                                              baseColor: const Color.fromARGB(
                                                  200, 30, 30, 42),
                                              highlightColor:
                                                  const Color.fromARGB(
                                                      200, 25, 78, 167),
                                              child: Container(
                                                height: 15,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        200, 30, 30, 42),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                              ),
                                            ),
                                            ContinuousShimmer(
                                              delay: const Duration(
                                                  milliseconds: 150),
                                              period: const Duration(
                                                  milliseconds: 1500),
                                              baseColor: const Color.fromARGB(
                                                  200, 30, 30, 42),
                                              highlightColor:
                                                  const Color.fromARGB(
                                                      200, 25, 78, 167),
                                              child: Container(
                                                height: 15,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        200, 30, 30, 42),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : index == 3
                                        ? SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 200,
                                            child: Markdown(
                                              data: state.chatList[index].text,
                                              styleSheet: mmstyle,
                                            ),
                                          )
                                        : index == state.chatList.length - 1
                                            ? TypeThis(
                                                string:
                                                    state.chatList[index].text,
                                                speed: 1,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                richTextMatchers: const [
                                                  TypeThisMatcher(
                                                    "string",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            : Text(
                                                state.chatList[index].text,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                              ),
                              const SizedBox(height: 10),
                              buildActionButtons(
                                  context, state.chatList[index]),
                              const SizedBox(height: 50),
                            ],
                          );
                  },
                ),
              ),
      );
    });
  }
}




// Center(
//                 child: GradientText(
//                   "Hello, Altair",
//                   colors: const [
//                     Color.fromARGB(255, 71, 132, 241),
//                     Color.fromARGB(255, 216, 101, 116),
//                   ],
//                   style: const TextStyle(
//                       fontSize: 28, fontWeight: FontWeight.w600),
//                 ),
//               )