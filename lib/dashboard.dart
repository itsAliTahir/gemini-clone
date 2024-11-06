import 'package:fluentui_system_icons/fluentui_system_icons.dart'; // Ensure you have this package for Fluent Icons
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: GradientText(
                "Hello, Ali Tahir",
                colors: const [
                  Color.fromARGB(255, 71, 132, 241),
                  Color.fromARGB(255, 216, 101, 116),
                ],
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: GradientText(
                "How can I help you today?",
                colors: const [
                  Color.fromARGB(255, 49, 50, 52),
                  Color.fromARGB(255, 49, 50, 52),
                ],
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),
            _buildGridRow(
              context,
              text1:
                  "Find the best-rated restaurants near me that are open right now.",
              icon1: FluentIcons.food_48_filled,
              text2:
                  "Suggest popular Netflix shows or movies to watch this weekend.",
              icon2: FluentIcons.movies_and_tv_24_regular,
            ),
            const SizedBox(height: 15),
            _buildGridRow(
              context,
              text1: "How can I reduce stress? Any quick relaxation tips?",
              icon1: Icons.health_and_safety,
              text2:
                  "Can you find me a step-by-step guide to basic yoga poses?",
              icon2: FluentIcons.accessibility_16_filled,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chats",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 30, 31, 33),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "AI Chatbot Introduction",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 30, 31, 33),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Prompt Testing",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGridRow(BuildContext context,
      {required String text1,
      required IconData icon1,
      required String text2,
      required IconData icon2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildGridItem(context, text: text1, icon: icon1),
        _buildGridItem(context, text: text2, icon: icon2),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context,
      {required String text, required IconData icon}) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.46,
          height: 150,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 30, 31, 33),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          bottom: 17,
          right: 17,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 19, 19),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
