import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../model/chat_model.dart';

Widget buildActionButtons(BuildContext context, ChatModel chat) {
  return Row(
    children: [
      const SizedBox(width: 40),
      Tooltip(
        message: "Like",
        child: Bounceable(
          onTap: () {},
          child: const Icon(Icons.thumb_up_alt_outlined,
              color: Colors.grey, size: 20),
        ),
      ),
      const SizedBox(width: 20),
      Tooltip(
        message: "Dislike",
        child: Bounceable(
          onTap: () {},
          child: const Icon(Icons.thumb_down_alt_outlined,
              color: Colors.grey, size: 20),
        ),
      ),
      const SizedBox(width: 20),
      Tooltip(
        message: "Share",
        child: Bounceable(
          onTap: () {},
          child: const Icon(Icons.share_outlined, color: Colors.grey, size: 20),
        ),
      ),
      const SizedBox(width: 20),
      Tooltip(
        message: "Copy",
        child: Bounceable(
          onTap: () {
            Clipboard.setData(ClipboardData(text: chat.text));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Copied to clipboard!')),
            );
          },
          child: const Icon(Icons.copy_outlined, size: 20, color: Colors.grey),
        ),
      ),
      const Spacer(),
      Tooltip(
        message: "More",
        child: Bounceable(
          onTap: () {},
          child: const Icon(Icons.more_vert_outlined,
              size: 20, color: Colors.grey),
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}
