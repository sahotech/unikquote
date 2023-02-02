import 'package:flutter/material.dart';

class FriendshipBtn extends StatelessWidget {
  const FriendshipBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade300,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Friendship',
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
                "Share your smile with the world. It's a symbol of friendship and peace. - Christie Brinkley A sweet friendship refreshes the soul",
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
