import 'package:adietalk_radio/common/utils/enums.dart';
import 'package:flutter/material.dart';

class HomeTabNotifier with ChangeNotifier {
  late QueryType queryType;
  late int _index; // store as 0–6 (0=Monday, 6=Sunday)

  HomeTabNotifier() {
    // Set default to today’s weekday (0-based)
    _index = DateTime.now().weekday - 1;
    queryType = _queryTypeFromIndex(_index);
  }

  int get index => _index;

  void setIndex(int index) {
    _index = index;
    queryType = _queryTypeFromIndex(index);
    notifyListeners();
  }

  QueryType _queryTypeFromIndex(int index) {
    switch (index) {
      case 0:
        return QueryType.monday;
      case 1:
        return QueryType.tuesday;
      case 2:
        return QueryType.wednesday;
      case 3:
        return QueryType.thursday;
      case 4:
        return QueryType.friday;
      case 5:
        return QueryType.saturday;
      case 6:
        return QueryType.sunday;
      default:
        return QueryType.monday; // fallback
    }
  }
}
