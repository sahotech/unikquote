import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: )10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 50),
                  Container(
                    width: 120,
                    height: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 50),
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 25,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: 150,
                height: 25,
                color: Colors.white,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 155,
                    height: 150,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 155,
                    height: 150,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 155,
                    height: 150,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 155,
                    height: 150,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 155,
                    height: 150,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 155,
                    height: 150,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 155,
                    height: 150,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 155,
                    height: 150,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
