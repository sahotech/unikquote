import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 18,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: 275,
                height: 18,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 18,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: 250,
                height: 18,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
