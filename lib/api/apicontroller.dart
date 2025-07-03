import 'package:dio/dio.dart';

class ApiController {
  Future<List<dynamic>> getdatas() async {
    final response = await Dio().get(
      'https://picsum.photos/v2/list?page=1&limit=5',
    );

    final datas = response.data;
    return datas;
  }
}
