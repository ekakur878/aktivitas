import 'package:dio/dio.dart';

class ApiController {
  Future<List<dynamic>> getdatas() async {
    final response = await Dio().get('https://saiyaapi.site' + 'cnth/prak');

    final datas = response.data['payload'];
    return datas;
  }

  // Future<List<dynamic>> getdatas() async {
  // final sharedPreferences prefs = await SharedPreferences.getInstance();
  // final pins = prefs.getString('pin');
  // final _datas= {
  //   'pin': pins,}
  //   final response = await Dio().get('https://saiyaapi.site' + 'cnth/prak');

  //   final datas = response.data['payload'];
  //   return datas;
  // }
}
