part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class OpenTextFormField extends DataEvent {}

class CloseTextFormField extends DataEvent {}

class TextChangedEvent extends DataEvent {
  final String text;

  const TextChangedEvent(this.text);
}

class SendMessage extends DataEvent {
  final String text;

  const SendMessage(this.text);
}

class ScrollPositionUpdated extends DataEvent {
  final double offset;

  const ScrollPositionUpdated(this.offset);
}

class RemoveFocusAndClearEvent extends DataEvent {}

class OpenDrawer extends DataEvent {}
