
import 'package:flutter/foundation.dart';

import 'reaction.dart';

abstract class ReactionDisposerMixin {
  final _disposers = <ReactionDisposer>[];

  @protected
  void reaction<T>(T Function() observers, void Function(T) effect) {
    final disposer = Reaction(observers).effect(effect);
    _disposers.add(disposer);
  }

  @mustCallSuper
  void dispose() {
    for (var disposer in _disposers) {
      disposer.call();
    }
  }
}
