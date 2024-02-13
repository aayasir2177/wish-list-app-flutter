import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  final List<String> _selectedItems = [];

  List<String> get selectedItems => _selectedItems;

  toglleFavorite(word) {
    if (_selectedItems.contains(word)) {
      _selectedItems.remove(word);
    } else {
      _selectedItems.add(word);
    }

    print(_selectedItems);
    notifyListeners();
  }

  bool doesExist(word) {
    return _selectedItems.contains(word);
  }
}
