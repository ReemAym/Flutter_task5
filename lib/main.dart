import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

import 'views/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getColorTheme(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getColorTheme(String? condition) {
  Color baseColor;

  if (condition == 'Sunny') {
    baseColor = Colors.amber;
  } else if (condition == 'Partly cloudy' || condition == 'Overcast') {
    baseColor = Colors.blueGrey;
  } else if (condition == 'Cloudy') {
    baseColor = Colors.grey;
  } else if (condition == 'Mist') {
    baseColor = Colors.cyan;
  } else if (condition == 'Patchy rain possible' ||
      condition == 'Light rain' ||
      condition == 'Moderate rain' ||
      condition == 'Heavy rain' ||
      condition == 'Patchy light rain' ||
      condition == 'Light rain shower' ||
      condition == 'Moderate or heavy rain shower' ||
      condition == 'Torrential rain shower') {
    baseColor = Colors.lightBlue;
  } else if (condition == 'Patchy snow possible' ||
      condition == 'Light snow' ||
      condition == 'Moderate snow' ||
      condition == 'Heavy snow' ||
      condition == 'Patchy light snow' ||
      condition == 'Light snow shower' ||
      condition == 'Moderate or heavy snow shower') {
    baseColor = Colors.blue;
  } else if (condition == 'Patchy sleet possible' ||
      condition == 'Light sleet' ||
      condition == 'Moderate or heavy sleet' ||
      condition == 'Light sleet showers' ||
      condition == 'Moderate or heavy sleet showers') {
    baseColor = Colors.indigo;
  } else if (condition == 'Patchy freezing drizzle possible' ||
      condition == 'Light drizzle' ||
      condition == 'Freezing drizzle' ||
      condition == 'Heavy freezing drizzle' ||
      condition == 'Patchy light drizzle') {
    baseColor = Colors.lightBlue;
  } else if (condition == 'Thundery outbreaks possible' ||
      condition == 'Patchy light rain with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy snow with thunder') {
    baseColor = Colors.deepPurple;
  } else if (condition == 'Fog' || condition == 'Freezing fog') {
    baseColor = Colors.teal;
  } else if (condition == 'Ice pellets' ||
      condition == 'Light showers of ice pellets' ||
      condition == 'Moderate or heavy showers of ice pellets') {
    baseColor = Colors.purple;
  } else if (condition == 'Blizzard' || condition == 'Blowing snow') {
    baseColor = Colors.blueGrey;
  } else {
    baseColor = Colors.blue; // Default base color
  }

  return createMaterialColor(baseColor);
}

// Helper function to create a MaterialColor from a Color
MaterialColor createMaterialColor(Color color) {
  List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(i * 0.1);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}



// class MyHomePage extends StatelessWidget {
//   final String title;
//   const MyHomePage({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // The title text which will be shown on the action bar
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(
//           'Hello, World!',
//         ),
//       ),
//     );
//   }
// }
