import 'package:flutter/material.dart';

class AbsurdBtn extends StatelessWidget {
  const AbsurdBtn({super.key});

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
                  'Absurd',
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
                "Cut off from his religious, metaphysical and transcendental roots, man is lost; all his actions become senseless, absurd, useless.",
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
