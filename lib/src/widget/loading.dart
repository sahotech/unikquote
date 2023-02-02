import 'package:flutter/material.dart';

class CLoading extends StatelessWidget {
  const CLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.brown,
        ),
      ),
    );
  }
}
