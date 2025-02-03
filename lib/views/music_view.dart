import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PlaylistScreen(),
    );
  }
}

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Music'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Playlists'),
              Tab(text: 'Artists'),
              Tab(text: 'Albums'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PlaylistsTab(),
            ArtistsTab(),
            AlbumsTab(),
          ],
        ),
      ),
    );
  }
}

class PlaylistsTab extends StatefulWidget {
  const PlaylistsTab({super.key});

  @override
  _PlaylistsTabState createState() => _PlaylistsTabState();
}

class _PlaylistsTabState extends State<PlaylistsTab> {
  List<Map<String, dynamic>> playlists = [
    {"icon": Icons.favorite, "title": "SONGS YOU LIKE", "songs": "345 songs"},
    {"icon": Icons.star, "title": "NEW SONGS", "songs": "By you"},
    {"icon": Icons.volume_up, "title": "VINTAGE MUSIC", "songs": "67 songs"},
    {"icon": Icons.bookmark, "title": "RECOMMENDED MUSIC APP", "songs": "128 songs"},
  ];
  void _addPlaylist() {
    setState(() {
      playlists.add({
        "icon": Icons.music_note,
        "title": "New Playlist",
        "songs": "0 songs",
      });
    });
    Fluttertoast.showToast(
      msg: "Playlist added",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.white,
    );
  }
  Future<void> _refreshPlaylists() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      playlists.shuffle();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Artists, songs or podcasts',
              filled: true,
              fillColor: Colors.grey.shade800,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
            onPressed: _addPlaylist,
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 10),
                Text('CREATE PLAYLIST', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshPlaylists,
              child: ListView.builder(
                itemCount: playlists.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(playlists[index]['title']),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        playlists.removeAt(index);
                      });
                    },
                    child: Card(
                      color: Colors.grey.shade900,
                      child: ListTile(
                        leading: Icon(
                          playlists[index]['icon'],
                          color: Colors.white,
                        ),
                        title: Text(playlists[index]['title']),
                        subtitle: Text(playlists[index]['songs']),
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArtistsTab extends StatelessWidget {
  final List<String> artists = ["Artist 1", "Artist 2", "Artist 3", "Artist 4"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: artists.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey.shade900,
          child: ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text(artists[index]),
            onTap: () {},
          ),
        );
      },
    );
  }
}

class AlbumsTab extends StatelessWidget {
  final List<String> albums = ["Album 1", "Album 2", "Album 3", "Album 4"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey.shade900,
          child: ListTile(
            leading: Icon(Icons.album, color: Colors.white),
            title: Text(albums[index]),
            onTap: () {},
          ),
        );
      },
    );
  }
}