import 'package:dio/dio.dart';

import 'package:se_app2/hotel.dart';

class connect_Server {
  final _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8081/'));

  Future<List<Hotel>> getHotelInfo() async {
    final response = await _dio.get('');
    return (response.data['hotel'] as List)
        .map<Hotel>((json) => Hotel.fromJson(json))
        .toList();
  }

  Future<Hotel> createHotelInfo(String name) async {
    final response = await _dio.post('', data: {'name': name});
    return Hotel.fromJson(response.data);
  }

  Future deleteContact(String id) async {
    final response = await _dio.delete('/$id');
    return response.data;
  }
}