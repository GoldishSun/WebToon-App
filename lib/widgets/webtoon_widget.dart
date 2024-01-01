import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:webtoon_app/screens/detail_screen.dart';

class WebToonCard extends StatelessWidget {
  final WebToonModel webtoon;
  const WebToonCard({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(webtoon: webtoon),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            width: 100,
          ),
          Hero(
            tag: webtoon.id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    offset: const Offset(7, 7),
                    color: Colors.black.withOpacity(1),
                  ),
                ],
              ),
              child: Image.network(
                webtoon.thumb,
                scale: 3,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            alignment: Alignment.center,
            child: Text(webtoon.title),
          ),
        ],
      ),
    );
  }
}
