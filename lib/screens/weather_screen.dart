import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/extensions/int.dart';
import 'package:weather_app_tutorial/providers/current_weather_provider.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/views/weather_info.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);
    return weatherData.when(
      data: (weather) => GradientContainer(
        children: [
          const SizedBox(width: double.infinity),
          Column(
            children: [
              Text(
                weather.name,
                style: TextStyles.h1,
              ),
              20.h,
              Text(
                DateTime.now().dateTime,
                style: TextStyles.subtitleText,
              ),
              30.h,
              SizedBox(
                width: 260,
                child: Image.asset(
                    "assets/icons/${weather.weather.first.icon.replaceAll('n', 'd')}.png"),
              ),
              40.h,
              Text(
                weather.weather.first.description,
                style: TextStyles.h2,
              ),
              40.h,
              const WeatherInfo(),
            ],
          )
        ],
      ),
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
