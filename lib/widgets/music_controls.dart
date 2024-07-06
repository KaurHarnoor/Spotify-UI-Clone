import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/track_model.dart';

class MusicControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            TrackInfo(),
            const Spacer(),
            PlayerControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) MoreControls(),
          ],
        ),
      ),
    );
  }
}

class TrackInfo extends StatefulWidget {
  @override
  _TrackInfoState createState() => _TrackInfoState();
}

class _TrackInfoState extends State<TrackInfo> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final track = context.watch<TrackModel>().currentTrack;
    if (track == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'images/hindimotivation.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              track.title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 4.0),
            Text(
              track.singer,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey[300], fontSize: 12.0),
            ),
          ],
        ),
        const SizedBox(width: 12.0),
        IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.white : Colors.white,
          ),
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
        ),
      ],
    );
  }
}

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final track = context.watch<TrackModel>().currentTrack;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.shuffle, color: Colors.white),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_previous_outlined, color: Colors.white),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.play_circle_outline, color: Colors.white),
              iconSize: 34.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_next_outlined, color: Colors.white),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.repeat, color: Colors.white),
              iconSize: 20.0,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white)),
            const SizedBox(width: 8.0),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              track?.time ?? '0:00',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

class MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.devices_outlined, color: Colors.white),
          iconSize: 20.0,
          onPressed: () {},
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.volume_up_outlined, color: Colors.white),
              onPressed: () {},
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen_outlined, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}
