import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/listscreen_service/listscreen_service.dart';

class MyBloc extends Bloc {
   MyService? service;
  List<String> itemList = [];
  bool isLoading = true;

  MyBloc() : super(null);

  get isLoadingStream => null;

  Future<void> fetchData() async {
    try {
      itemList = await service!.fetchData();
      isLoading = false;
    } catch (e) {


    }
  }

// Other methods for manipulating the itemList
}
