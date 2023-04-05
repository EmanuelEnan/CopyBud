import 'package:flutter/material.dart';

Widget template(String title, String sub, ElevatedButton button) {
  return Card(
    child: Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(sub),
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          button,
        ],
      ),
    ),
  );
}
