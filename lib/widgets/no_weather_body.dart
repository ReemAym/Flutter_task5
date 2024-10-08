import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(129, 223, 64, 251),
            Color.fromARGB(120, 104, 58, 183)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_off,
                size: 100,
                color: Colors.white.withOpacity(0.8),
              ),
              const SizedBox(height: 30),
              const Text(
                'No weather data available 😔',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Search for a city to get started! 🔍',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     // Add your search functionality here
              //   },
              //   icon: const Icon(Icons.search),
              //   label: const Text('Search Now'),
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.white.withOpacity(0.8),
              //     onPrimary: Colors.deepPurple,
              //     textStyle: const TextStyle(fontSize: 18),
              //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30),
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
