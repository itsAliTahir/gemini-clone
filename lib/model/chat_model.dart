// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatModel {
  int index;
  String text;
  Roles role;
  ChatModel({
    required this.index,
    required this.text,
    required this.role,
  });
}

enum Roles { user, model }
