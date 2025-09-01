import 'package:adietalk_radio/common/utils/enums.dart';
import 'package:flutter/material.dart';

class HomeTabNotifier with ChangeNotifier {
  QueryType queryType = QueryType.all;
  String _index = 'All';

  String get index => _index;

  void setIndex(String index) {
    _index = index;
    switch (index) {
      case 'All':
        setQueryType(QueryType.all);
        break;
      case 'Monday':
        setQueryType(QueryType.monday);
        break;
      case 'Tuesday':
        setQueryType(QueryType.tuesday);
        break;
      case 'Wednesday':
        setQueryType(QueryType.wednesday);
        break;
      case 'Thursday':
        setQueryType(QueryType.thursday);
        break;
      case 'Friday':
        setQueryType(QueryType.friday);
        break;

      default:
        setQueryType(QueryType.all);
    }
    notifyListeners();
  }

  void setQueryType(QueryType q) {
    queryType = q;
  }
}
