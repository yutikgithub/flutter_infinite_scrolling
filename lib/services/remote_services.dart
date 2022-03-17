import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/datamodel.dart';

class RemoteServices {

  List<DataModel> dataList = [];
  int? pack;

  Future<List<DataModel>> fetchCategories({int page = 0,pack}) async {

    var response = await http
        .get(Uri.parse(''));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {

        for(Map i in data)
        {
          dataList.add(DataModel.fromJson(i));         
        } 

        print("datalist ::: $dataList");

        return dataList;
      
    } else {

      return dataList;
      
    }
  }

}