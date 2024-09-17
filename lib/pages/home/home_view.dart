import 'package:flutter/material.dart';
import 'package:movies_app/pages/browse/browse_view.dart';
import 'package:movies_app/pages/search/search_view.dart';
import 'package:movies_app/pages/watchlist/watchlist_view.dart';

class MovieHomePage extends StatefulWidget {
  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  int _selectedIndex = 0;

  List<Map<String, String>> newReleases = [
    {"imageUrl": "assets/images/narcos.png", "title": "Narcos"},
    {"imageUrl": "assets/images/deadpool2.png", "title": "Deadpool 2"},
    {"imageUrl": "assets/images/annabelle.png", "title": "Annabelle"},
    {"imageUrl": "assets/images/toy_story.png", "title": "Toy Story 4"},
  ];

  List<Map<String, String>> recommendedMovies = [
    {"imageUrl": "assets/images/deadpool2.png", "title": "Deadpool 2", "rating": "7.7", "duration": "1h 59m"},
    {"imageUrl": "assets/images/annabelle.png", "title": "Annabelle", "rating": "6.5", "duration": "1h 46m"},
    {"imageUrl": "assets/images/toy_story.png", "title": "Toy Story 4", "rating": "8.0", "duration": "1h 40m"},
    {"imageUrl": "assets/images/narcos.png", "title": "Narcos", "rating": "8.0", "duration": "1h 40m"}
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A2A2A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topBanner(),
            _sectionContainer('New Releases', _movieList(newReleases)),
            _sectionContainer('Recommended', _recommendedList(recommendedMovies)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF2A2A2A),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavIcon('assets/icons/Home icon.png', 0),
            _bottomNavIcon('assets/icons/search.png', 1),
            _bottomNavIcon('assets/icons/material.png', 2),
            _bottomNavIcon('assets/icons/bookmarks.png', 3),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavIcon(String iconPath, int index) {
    return IconButton(
      icon: Image.asset(
        iconPath,
        color: _selectedIndex == index ? Colors.yellow : Colors.white,
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieHomePage()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieSearchPage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieBrowsePage()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieWatchlistPage()),
            );
            break;
        }
      },
    );
  }

  Widget _topBanner() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/Dora.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 250,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100, // Adjusted height
            child: Stack(
              children: [
                Positioned(
                  top: -50, // Adjusted position to ensure image is partially visible above the banner
                  child: Image.asset(
                    'assets/images/featured_movie.png', // Replace with your image path
                    fit: BoxFit.cover,
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dora and the Lost City of Gold',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                '2019 PG-13 2h 7m',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sectionContainer(String title, Widget listWidget) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8),
      color: Colors.grey[850],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 10),
          listWidget,
        ],
      ),
    );
  }

  Widget _movieList(List<Map<String, String>> movies) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            width: 120,
            child: Column(
              children: [
                Image.asset(
                  movies[index]['imageUrl']!,
                  width: 120,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5),
                Text(
                  movies[index]['title']!,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _recommendedList(List<Map<String, String>> movies) {
    return Container(
      height: 240, // Adjusted height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  movies[index]['imageUrl']!,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.grey[800],
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movies[index]['title']!,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            movies[index]['rating']!,
                            style: TextStyle(color: Colors.yellow, fontSize: 12),
                          ),
                          SizedBox(width: 4), // Spacing between rating and star icon
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                        ],
                      ),
                      Text(
                        movies[index]['duration']!,
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
