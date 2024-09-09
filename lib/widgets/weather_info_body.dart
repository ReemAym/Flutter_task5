

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColorTheme(weatherModel.weatherCondition),
            getColorTheme(weatherModel.weatherCondition)[300]!,
            getColorTheme(weatherModel.weatherCondition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(203, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  "https:${weatherModel.image!}",
                  width: 80,
                ),
                Column(
                  children: [
                    Text(
                      '${weatherModel.temp}°C',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 56,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      weatherModel.weatherCondition,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(218, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.thermostat,
                  size: 20,
                ),
                Text(
                  'Max: ${weatherModel.maxTemp.round()}°C',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Min: ${weatherModel.minTemp.round()}°C',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
