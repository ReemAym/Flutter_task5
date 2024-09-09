import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final dio;
  final String url = 'https://api.weatherapi.com/v1';
  final String apiKey = 'ba30e323281344cb935220523242908&q';

  WeatherService({this.dio});

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      var response =
          await dio.get('$url/forecast.json?key=$apiKey=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data["error"]["message"] ??
          'oops there was an error try later';
      throw Exception(errMessage);
    } catch (e) {
      print(e);
      throw Exception("try later");
    }
  }
}
