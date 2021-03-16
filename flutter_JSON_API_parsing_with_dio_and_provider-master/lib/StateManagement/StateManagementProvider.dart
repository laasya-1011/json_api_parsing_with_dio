import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:dio/dio.dart';

import '../models/AlbumModel.dart';

class StateManager with ChangeNotifier {
  StateManager() {}

  Dio dio = new Dio();

  Future fetchJson() async {
    //var response;
    var response = await dio.get("https://jsonplaceholder.typicode.com/photos");

    List<AlbumModel> _albumlist = [];
    if (response.statusCode == 200) {
      var jsonResponse = response.data;

      for (var item in jsonResponse) {
        AlbumModel album = new AlbumModel.fromJson(item);
        _albumlist.add(album);
      }

      return _albumlist;
    }
  }
}
