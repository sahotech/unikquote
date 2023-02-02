import 'package:flutter/material.dart';

class PositivityBtn extends StatelessWidget {
  const PositivityBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black26,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Positivity',
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
                "Chaotic people have chaotic lives, and i think they create that. But if you try and have an inner peace and a positive attitude. I think you crack that.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  backgroundColor: Colors.transparent,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
