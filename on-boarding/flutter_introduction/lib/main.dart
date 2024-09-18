import 'package:flutter/material.dart';
import 'name_generator.dart';
import 'sidebar_drawer.dart';

void main() {
  runApp(const NameGeneratorApp());
}

class NameGeneratorApp extends StatelessWidget {
  const NameGeneratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Generator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NameGenerator _nameGenerator = NameGenerator();
  String _currentName = '';
  List<String> _favorites = [];
  bool _showFavorites = false;

  void _generateName() {
    setState(() {
      _currentName = _nameGenerator.generate();
    });
  }

  void _toggleFavorite() {
    setState(() {
      if (_favorites.contains(_currentName)) {
        _favorites.remove(_currentName);
      } else {
        _favorites.add(_currentName);
      }
    });
  }

  void _viewFavorites() {
    setState(() {
      _showFavorites = true;
    });
  }

  void _viewHome() {
    setState(() {
      _showFavorites = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(159, 238, 175, 196),
      body: Row(
        children: [
          SidebarDrawer(
            onHomeSelected: _viewHome,
            onFavoritesSelected: _viewFavorites,
          ),
          Expanded(
            child:
                _showFavorites ? _buildFavoritesScreen() : _buildHomeScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              _currentName.isNotEmpty ? _currentName : 'Press Generate',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: null,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          _favorites.contains(_currentName)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: _toggleFavorite,
                      ),
                      Text(
                        _favorites.contains(_currentName) ? 'Unlike' : 'Like',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _generateName,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesScreen() {
    return ListView.builder(
      itemCount: _favorites.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          title: Text(_favorites[index]),
        );
      },
    );
  }
}
