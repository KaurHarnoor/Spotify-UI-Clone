import 'package:flutter/material.dart';
import 'package:spotify_ui_clone/data/data.dart';
import '../widgets/components.dart';
import '../widgets/music_controls.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) SideBar(),
                const Expanded(
                  child: PlaylistView(),
                ),
              ],
            ),
          ),
          MusicControls(),
        ],
      ),
    );
  }
}

class PlaylistView extends StatelessWidget {
  const PlaylistView({super.key});

  @override
  Widget build(BuildContext context) {
    const playlist = hindimotivational;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _NavigationButton(icon: Icons.chevron_left, onTap: () {}),
              const SizedBox(width: 16.0),
              _NavigationButton(icon: Icons.chevron_right, onTap: () {}),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined, size: 30.0),
            label: const Text('User'),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            padding: const EdgeInsets.only(),
            icon: const Icon(Icons.keyboard_arrow_down, size: 30.0, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFAF1018),
              Colors.black,
            ],
            stops: const [0, 0.3],
          ),
        ),
        child: RawScrollbar(
          thumbVisibility: true,
          thumbColor: Colors.grey,
          radius: const Radius.circular(5.0),
          thickness: 8.0,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
            children: [
              const PlaylistHeader(playlist: playlist),
              TrackList(tracks: playlist.songs),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavigationButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: const BoxDecoration(
          color: Colors.black26,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 28.0, color: Colors.white),
      ),
    );
  }
}
