import 'dart:async';
import 'dart:convert';

//----------------------------------------------------------------
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'datasequnce_event.dart';
//----------------------------------------------------------------

//------------------------------------------------------- First

class FirstFetchDataBloc extends Bloc<DataSequncePage1, List> {
  FirstFetchDataBloc() : super([]);

  @override
  Stream<List> mapEventToState(DataSequncePage1 event) async* {
    if (event == DataSequncePage1.requestData) {
      yield* firstrequestData_fn(state);
    }
  }
}

Stream<List> firstrequestData_fn(List state) async* {
  final response = await http.post(Uri.parse("http://localhost:9000/first"),
      body: {"request": "Hello"});

  // print(response);
  var databuff = [];
  if (response.statusCode == 200) {
    databuff = jsonDecode(response.body);
  } else {
    print("where is my server");
  }
  state = databuff;
  yield state;
}
