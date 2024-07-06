const yourLibrary = [
  'Recently Played',
  'Liked Songs',
  'Albums',
  'Artists',
  'Podcasts',
];

const playlists = [
  'Hindi Motivational',
  'English Motivational',
  'The Local Train Mix',
  'Amistat Mix',
  'Worship Songs',
];

class Song {
  final String id;
  final String title;
  final String singer;
  final String time;

  const Song({
    required this.id,
    required this.title,
    required this.singer,
    required this.time,
  });
}

const _hindimotivational = [
  Song(
    id: '0',
    title: 'Parinda',
    singer: 'Amaal Mallik',
    time: '5:14',
  ),
  Song(
    id: '1',
    title: 'Aashayein',
    singer: 'KK,Salim Merchant',
    time: '4:20',
  ),
  Song(
    id: '2',
    title: 'Besabriyaan',
    singer: 'Armaan Malik',
    time: '4:15',
  ),
  Song(
    id: '3',
    title: 'Kar Har Maidaan Fateh',
    singer: 'Sukhwinder,Shreya,Vikram',
    time: '5:12',
  ),
  Song(
    id: '4',
    title: 'Parwah Nahin',
    singer: 'Siddharth Basrur',
    time: '4:02',
  ),
  Song(
    id: '5',
    title: 'Lakshya',
    singer: 'Shankar',
    time: '6:15',
  ),
  Song(
    id: '6',
    title: 'De Mauka Zindagi',
    singer: 'JUNO,Bora',
    time: '2:47',
  ),
  Song(
    id: '7',
    title: 'Brothers Anthem',
    singer: 'Ajay-Atul',
    time: '5:53',
  ),
  Song(
    id: '8',
    title: 'Jeetne Ke Liye',
    singer: 'KK',
    time: '4:02',
  ),
  Song(
    id: '9',
    title: 'Bandeya Re Bandeya',
    singer: 'Arijit Singh',
    time: '4:14',
  ),
  Song(
    id: '10',
    title: 'Jhuk Na Paunga',
    singer: 'Papon',
    time: '4:24',
  ),
  Song(
    id: '11',
    title: 'Dua',
    singer: 'Arijit Singh',
    time: '4:20',
  ),
  Song(
    id: '12',
    title: 'Main Lad Lunga',
    singer: 'Amit Trivedi',
    time: '3:10',
  ),
  Song(
    id: '13',
    title: 'Jeete Hain Chal',
    singer: 'Kavita Seth',
    time: '4:08',
  ),
];

class Playlist {
  final String id;
  final String name;
  final String image;
  final String owner;
  final String time;
  final List<Song> songs;

  const Playlist({
    required this.id,
    required this.name,
    required this.image,
    required this.owner,
    required this.time,
    required this.songs,
  });
}

const hindimotivational = Playlist(
  id: '5-playlist',
  name: 'Hindi Motivational Songs',
  image: 'images/hindimotivation.jpg',
  owner: 'Harnoor',
  time: '1h 3min',
  songs: _hindimotivational,
);
