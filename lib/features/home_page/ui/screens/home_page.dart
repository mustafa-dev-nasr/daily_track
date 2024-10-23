import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Addinfo extends StatelessWidget {
  const Addinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Avatar Example'),
      ),
      body: Center(
        child: Lottie.network(
          'https://assets10.lottiefiles.com/packages/lf20_jcikwtux.json', // Example animation URL
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
