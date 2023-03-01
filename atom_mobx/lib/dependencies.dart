import 'package:auto_injector/auto_injector.dart';

import 'reducers/product_on_sale_reducer.dart';
import 'services/scaffold_messenger_service.dart';
import 'states/internet_state.dart';
import 'states/product_state.dart';

class Dependencies {
  static T get<T>() => _injector.get<T>();

  static final _injector = AutoInjector(on: (i) {
    //Controllers
    // i.addController(ProductOnSaleAggregate.new);

    //Reducers
    i.addReducer(ProductOnSaleReducer.new);

    //States
    i.addLazySingleton(InternetState.new);
    i.addLazySingleton(ProductState.new);

    //Services
    i.addReducer(ScaffoldMessengerService.new);

    i.commit();
  });
}

extension AutoInjectorExtension on AutoInjector {
  void addReducer(Function constructor) {
    addSingleton<dynamic>(constructor, onDispose: (value) => value.dispose());
  }

  void addController(Function constructor) {
    addLazySingleton<dynamic>(constructor,
        onDispose: (value) => value.dispose());
  }
}
