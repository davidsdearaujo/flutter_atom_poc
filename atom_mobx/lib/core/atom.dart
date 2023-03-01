import 'package:mobx/mobx.dart' as mobx;

class Atom<T> {
  final mobx.Observable<T> observable;

  Atom(T initialValue) : observable = mobx.Observable<T>(initialValue);

  T get value {
    return observable.value;
  }

  set value(T newValue) {
    mobx.Action(() => observable.value = newValue)();
  }
}
