import 'package:flutter/material.dart';

class HappinessBtn extends StatelessWidget {
  const HappinessBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade200,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Happiness',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Plenty of people miss their share of happiness, not because they never found it, but because they didn’t stop to enjoy it.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  backgroundColor: Colors.transparent,
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
