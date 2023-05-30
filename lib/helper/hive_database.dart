import 'package:hive_flutter/hive_flutter.dart';
import 'package:covid_19/model/data_model.dart';

class HiveDatabase {
  static final Box<DataModel> _localDB = Hive.box<DataModel>("data");

  void addData(DataModel data) {
    _localDB.add(data);
  }

  int getLength() {
    return _localDB.length;
  }

  bool checkLogin(String username, String password) {
    bool found = false;
    for (int i = 0; i < getLength(); i++) {
      if (username == _localDB.getAt(i)!.username &&
          password == _localDB.getAt(i)!.password) {
        // ignore: avoid_print
        print("Login Success");
        found = true;
        break;
      } else {
        found = false;
      }
    }

    return found;
  }
}
