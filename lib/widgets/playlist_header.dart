import 'package:flutter/material.dart';
import '../data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'images/hindimotivation.jpg',
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12.0, color: Colors.white),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Created by ${playlist.owner} • ${playlist.songs.length} songs, ${playlist.time}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
