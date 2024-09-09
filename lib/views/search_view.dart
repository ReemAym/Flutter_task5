// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/models/weather_model.dart';
// import 'package:weather_app/services/weather_service.dart';

// import '../cubits/get_weather_cubit/get_weather_cubit.dart';

// class SearchView extends StatelessWidget {
//   const SearchView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Search city',
//         ),

//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16,
//         ),
//         child: Center(
//           child: TextField(
//             onSubmitted: (value) async {

//               var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
//               getWeatherCubit.getWeather(CityName: value);
//               Navigator.pop(context);
//             },
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(
//                 vertical: 32,
//                 horizontal: 8,
//               ),
//               suffixIcon: const Icon(Icons.search),
//               labelText: 'Search',
//               hintText: 'Enter city name',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.orange,
//                 ),
//                 borderRadius: BorderRadius.circular(16),
//               ),

//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// WeatherModel? weatherModel;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0, // Remove shadow for a cleaner look
        backgroundColor: Colors.transparent,
        title: const Text(
          'Search City',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // Center align the title
      ),
      extendBodyBehindAppBar:
          true, // Extend body behind the app bar for full background
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade500, Colors.blue.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Search for a City',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onSubmitted: (value) {
                      var getWeatherCubit =
                          BlocProvider.of<GetWeatherCubit>(context);
                      getWeatherCubit.getWeather(CityName: value);
                      Navigator.pop(context);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      labelText: 'City Name',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                      hintText: 'Enter city name',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade500,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
