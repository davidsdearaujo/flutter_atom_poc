import '../core.dart';

class ProductState {
  final _name = Atom<String?>(null);
  String? get name => _name.value;
  void setName(String newValue) => _name.value = newValue;

  final _description = Atom<String?>(null);
  String? get description => _description.value;
  void setDescription(String newValue) => _description.value = newValue;

  final _price = Atom<double>(0);
  double get price => _price.value;
  void setPrice(double newValue) => _price.value = newValue;
}
