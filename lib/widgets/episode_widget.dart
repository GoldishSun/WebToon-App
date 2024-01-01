import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webtoon_app/models/webtoon_episode_model.dart';
import 'package:webtoon_app/models/webtoon_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.ep,
    required this.webtoon,
  });

  final WebToonEpisodeModel ep;
  final WebToonModel webtoon;

  void onButtonTap() async {
    await launchUrlString(
        'https://comic.naver.com/webtoon/detail?titleId=${webtoon.id}&no=${ep.id}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '   ${ep.title}',
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
