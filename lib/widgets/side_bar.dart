import 'package:flutter/material.dart';
import '../data/data.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'images/spotify.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          SideMenuIcon(iconData: Icons.home, title: 'Home', onTap: () {}),
          SideMenuIcon(iconData: Icons.search, title: 'Search', onTap: () {}),
          SideMenuIcon(iconData: Icons.audiotrack, title: 'Radio', onTap: () {}),
          const SizedBox(height: 12.0),
          Expanded(child: LibraryPlaylists()),
        ],
      ),
    );
  }
}

class SideMenuIcon extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const SideMenuIcon({Key? key, required this.iconData, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: Colors.white, size: 28.0),
      title: Text(title, style: const TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis),
      onTap: onTap,
    );
  }
}

class LibraryPlaylists extends StatefulWidget {
  @override
  _LibraryPlaylistsState createState() => _LibraryPlaylistsState();
}

class _LibraryPlaylistsState extends State<LibraryPlaylists> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'YOUR LIBRARY',
                  style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...yourLibrary.map(
                (e) => ListTile(
                  dense: true,
                  title: Text(e, style: const TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis),
                  onTap: () {},
                ),
              ).toList(),
            ],
          ),
          const SizedBox(height: 24.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'PLAYLISTS',
                  style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...playlists.map(
                (e) => ListTile(
                  dense: true,
                  title: Text(e, style: const TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis),
                  onTap: () {},
                ),
              ).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
