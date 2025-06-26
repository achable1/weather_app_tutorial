import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/models/weather.dart';
import 'package:weather_app_tutorial/services/api_helper.dart';

final w = FutureProvider.autoDispose.family<Weather, String>(
  (ref, arg) async => ApiHelper.getWeatherByCityName(
    cityName: arg,
  ),
);
