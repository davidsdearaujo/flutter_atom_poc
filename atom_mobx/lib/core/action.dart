import 'atom.dart';
import 'package:mobx/mobx.dart' as mobx;

class Action<T> extends Atom<T> {
  Action(T initialValue) : super(initialValue);
  void call(T newValue) {
    mobx.Action(() => value = newValue).call();
  }
}

class ActionWithoutParam extends Atom<void> {
  ActionWithoutParam() : super(null);
  void call() {
    mobx.Action(() => value = null).call();
  }
}
