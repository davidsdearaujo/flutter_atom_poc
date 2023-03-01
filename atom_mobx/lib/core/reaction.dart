import 'package:mobx/mobx.dart' as mobx;

import 'action.dart';

typedef ReactionDisposer = void Function();

class Reaction<T> {
  final T Function() observers;
  const Reaction(this.observers);
  ReactionDisposer effect(void Function(T) effect) {
    return mobx.reaction<T>((_) => observers.call(), effect);
  }
}

class ActionReaction<T> extends Reaction<T> {
  ActionReaction(Action<T> action) : super(() => action.value);
}
