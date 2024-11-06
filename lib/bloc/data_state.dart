// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'data_bloc.dart';

class DataState extends Equatable {
  final int milliSeconds;
  final bool isTextFormOpen;
  final TextEditingController inputController;
  final FocusNode inputFocus;
  final String myText;
  final double offset;
  final List<ChatModel> chatList;
  final ScrollController chatScrollController;
  final bool isDrawerOpen;

  const DataState({
    this.milliSeconds = 100,
    this.isTextFormOpen = false,
    required this.inputController,
    required this.inputFocus,
    this.myText = "",
    this.offset = 0.0,
    required this.chatList,
    required this.chatScrollController,
    this.isDrawerOpen = false,
  });

  @override
  List<Object> get props => [
        milliSeconds,
        isTextFormOpen,
        inputController,
        inputFocus,
        myText,
        offset,
        chatList,
        chatScrollController,
        isDrawerOpen
      ];

  DataState copyWith({
    int? milliSeconds,
    bool? isTextFormOpen,
    TextEditingController? inputController,
    FocusNode? inputFocus,
    String? myText,
    double? offset,
    List<ChatModel>? chatList,
    ScrollController? chatScrollController,
    bool? isDrawerOpen,
  }) {
    return DataState(
      milliSeconds: milliSeconds ?? this.milliSeconds,
      isTextFormOpen: isTextFormOpen ?? this.isTextFormOpen,
      inputController: inputController ?? this.inputController,
      inputFocus: inputFocus ?? this.inputFocus,
      myText: myText ?? this.myText,
      offset: offset ?? this.offset,
      chatList: chatList ?? this.chatList,
      chatScrollController: chatScrollController ?? this.chatScrollController,
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
    );
  }
}
