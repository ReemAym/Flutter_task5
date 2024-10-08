import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.redAccent.shade100,
            Colors.red.shade200,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: Colors.white70,
                size: 100,
              ),
              SizedBox(height: 30),
              Text(
                'Oops!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We couldn\'t retrieve the weather data right now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please check your connection or try again later.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white60,
                ),
              ),
              SizedBox(height: 30),
              // ElevatedButton(
              //   onPressed: () {
              //     context.read<GetWeatherCubit>().fetchWeather();
              //   },
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     primary: Colors.white,
              //     onPrimary: Colors.blueAccent,
              //   ),
              //   child: Text(
              //     'Retry',
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.blueAccent,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
