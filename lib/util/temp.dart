import 'package:flutter/material.dart';

class tile extends StatelessWidget {
  const tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.lightBlue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('lib/images/Cannaought_place.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cannaought Place Jn",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                  Text(
                    "Check for shelters ➡️ ",
                    style:
                        TextStyle(color: Colors.lightGreenAccent, fontSize: 10),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
