import 'package:flutter/material.dart';
import 'package:aktivitas/widget/sushilist.dart';

class SushiList extends StatelessWidget {
  const SushiList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sushiList = List.generate(10, (index) {
      return {
        "name": "sushi ${index + 1}",
        "image": "assets/images/sushi.jpg", // Gambar contoh
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      };
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: sushiList.length,
                itemBuilder: (context, index) {
                  final sushi = sushiList[index];
                  return sushiListed(
                    name: sushi["name"]!,
                    imagePath: sushi["image"]!,
                    description: sushi["description"]!,
                  );
                },
              ),
            ),
            SizedBox(width: double.infinity),
          ],
        ),
      ),
    );
  }
}
