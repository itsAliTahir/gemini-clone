import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 56,
      color: const Color.fromARGB(255, 19, 19, 19),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today",
            style: TextStyle(color: Colors.white, fontSize: 13),
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
                  Icons.messenger_outline_sharp,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Brief Initial Greeting",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
//
//
//
//
//

          const Text(
            "Previous 30 days",
            style: TextStyle(color: Colors.white, fontSize: 13),
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
                  Icons.messenger_outline_sharp,
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
                  Icons.messenger_outline_sharp,
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
    );
  }
}
