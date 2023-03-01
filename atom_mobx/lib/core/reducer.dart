import 'package:atom_mobx/core.dart';
import 'package:flutter/foundation.dart';

abstract class Reducer {
  final _disposers = <VoidCallback>[];

  void observe<T>(T Function() observer, void Function(T) effect) {
    final disposer = Reaction<T>(observer).effect(effect);
    _disposers.add(disposer);
  }

  void action<T>(Action<T> action, void Function(T) effect) {
    final disposer = ActionReaction<T>(action).effect(effect);
    _disposers.add(disposer);
  }

  @mustCallSuper
  void dispose() {
    for (var disposer in _disposers) {
      disposer.call();
    }
  }
}
