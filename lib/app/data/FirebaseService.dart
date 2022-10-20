import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'models/WrestlingDataItem.dart';

// import 'models/wrestling_data_entity.dart';

class FirebaseService {
  static Future<List<WrestlingDataItem>> fetchDataFromFirebase() async {
    final data = await FirebaseDatabase.instance.ref('data').get();

    List<WrestlingDataItem> list = [];
    for (var element in data.children) {
      if (element.value != null) {
        final decodedValue = jsonDecode(jsonEncode(element.value));

        // print(decodedValue);
        // print(decodedValue.runtimeType);
        final wrestlingData =
            WrestlingDataItem.fromJson(decodedValue as Map<String, dynamic>);
        list.add(wrestlingData);
        // print('wrestlingData: ${wrestlingData.toJson()}');
      }
    }
    return list;
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
