import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_clone/model/chat_model.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc()
      : super(DataState(
            inputController: TextEditingController(),
            inputFocus: FocusNode(),
            chatScrollController: ScrollController(),
            chatList: const [])) {
    on<CloseTextFormField>(_closeTextFormField);
    on<OpenTextFormField>(_openTextFormField);
    on<TextChangedEvent>(_textChanged);
    on<SendMessage>(_sendMessage);
    on<RemoveFocusAndClearEvent>(_removeFocusAndClear);
    on<OpenDrawer>(_openDrawer);
  }

  // Open text field and set focus
  void _openTextFormField(OpenTextFormField event, Emitter<DataState> emit) {
    emit(state.copyWith(isTextFormOpen: true));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      state.inputFocus.requestFocus();
    });
  }

  // Close text field and clear focus
  void _closeTextFormField(CloseTextFormField event, Emitter<DataState> emit) {
    emit(state.copyWith(isTextFormOpen: false));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      state.inputFocus.unfocus();
    });
  }

  // Remove focus and clear text
  void _removeFocusAndClear(
      RemoveFocusAndClearEvent event, Emitter<DataState> emit) {
    state.inputController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state.inputFocus.unfocus();
    });
  }

  // Update state when text changes
  void _textChanged(TextChangedEvent event, Emitter<DataState> emit) {
    emit(state.copyWith(myText: event.text));
  }

  void _openDrawer(OpenDrawer event, Emitter<DataState> emit) {
    // Toggle the drawer state by flipping the current value
    final newDrawerState = !state.isDrawerOpen;
    emit(state.copyWith(isDrawerOpen: newDrawerState));
  }

  // Send message and add to chat list
  void _sendMessage(SendMessage event, Emitter<DataState> emit) async {
    // Add the user's message to the chat list
    final updatedChatList = List<ChatModel>.from(state.chatList)
      ..add(ChatModel(
        index: state.chatList.isNotEmpty ? state.chatList.length : 0,
        text: event.text,
        role: Roles.user,
      ))
      ..add(ChatModel(
        index: state.chatList.isNotEmpty ? state.chatList.length + 1 : 1,
        text: "", // Placeholder message for shimmer effect
        role: Roles.model,
      ));

    emit(state.copyWith(chatList: updatedChatList));

    // Scroll to bottom after adding message
    _scrollToBottom();

    // Fetch the response using the updated method
    emit(state.copyWith(myText: ""));
    await _geminiGetResponse();
  }

  // Method to fetch response from Gemini API
  Future<void> _geminiGetResponse() async {
    final gemini = Gemini.instance;

    try {
      // Fetch the full response once
      final value =
          await gemini.text(state.chatList[state.chatList.length - 2].text);

      if (value != null && value.output != null) {
        final fullResponse = value.output;

        // Update the placeholder message with the full response text
        final updatedChatList = List<ChatModel>.from(state.chatList);
        updatedChatList[updatedChatList.length - 1] = ChatModel(
          index: updatedChatList.length - 1,
          text: fullResponse!,
          role: Roles.model,
        );

        emit(state.copyWith(chatList: updatedChatList));

        // Scroll to bottom after updating response
        _scrollToBottom();
      }
    } catch (e) {
      log('Error fetching response from gemini.text', error: e);
    }

    emit(state.copyWith(chatList: state.chatList));
  }

  // Method to scroll to bottom when a new message is added
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.chatScrollController.hasClients) {
        state.chatScrollController.animateTo(
          state.chatScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Future<void> close() {
    state.inputController.dispose();
    state.inputFocus.dispose();
    state.chatScrollController.dispose();
    return super.close();
  }
}

// ChatModel(
//     index: 0,
//     text: "This Message is Send by User",
//     role: Roles.user),
// ChatModel(
//     index: 1,
//     text: "This Message is Sent by AI",
//     role: Roles.model),
// ChatModel(
//     index: 2,
//     text: "This Message is Send by User",
//     role: Roles.user),
// ChatModel(
//     index: 3,
//     text: "This Message is Sent by AI",
//     role: Roles.model),
