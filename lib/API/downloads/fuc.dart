import 'dart:convert';

import 'package:bloc_learn/API/downloads/downloads.dart';
import 'package:bloc_learn/API/downloads/result.dart';
import 'package:bloc_learn/core/constants.dart';
import 'package:bloc_learn/infrastructure/api_key.dart';
import 'package:http/http.dart' as http;
Future<List<Result>> getDownloads() async {
  try {
    var getresult = await http.get(Uri.parse('$domain/trending/all/day?api_key=$apiKey'));
    
    if (getresult.statusCode == 200) {
      var responce = jsonDecode(getresult.body);
      var result = Downloads.fromJson(responce);
      
      if (result.results != null) {
        return result.results!;
      } else {
        List<Result> empty = [];
        return empty;
      }
    } else {
      return [];
    }
  } catch (e) {
    // Exception occurred during the API request
    print('An error occurred: $e');
    // You can handle the exception here or perform any necessary error handling logic
    return [];
  }
}
