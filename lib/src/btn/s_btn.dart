import 'package:flutter/material.dart';

class SuccessBtn extends StatelessWidget {
  const SuccessBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink.shade300,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Success',
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
                "The moment we believe that success is determined by an ingrained level of ability as opposed to resilience and hard work, we will be brittle in the face of adversity.",
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
