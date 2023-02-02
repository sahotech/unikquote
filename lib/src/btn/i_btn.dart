import 'package:flutter/material.dart';

class InspirationBtn extends StatelessWidget {
  const InspirationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black38,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Inspiration',
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
                "Love is the answer, but while you're waiting for the answer, sex raises some pretty interesting questions. I am not afraid of death, I just don't want to be there when it happens.",
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
