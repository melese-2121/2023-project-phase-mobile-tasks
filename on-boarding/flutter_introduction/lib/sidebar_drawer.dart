import 'package:flutter/material.dart';

class SidebarDrawer extends StatelessWidget {
  final VoidCallback onHomeSelected;
  final VoidCallback onFavoritesSelected;

  SidebarDrawer({required this.onHomeSelected, required this.onFavoritesSelected});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final sidebarWidth = screenWidth > 600 ? 300.0 : 80.0;

    return Container(
      width: sidebarWidth,
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: screenWidth > 600 ? const Text('Home') : null,
            onTap: onHomeSelected,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: screenWidth > 600 ? const Text('Favorites') : null,
            onTap: onFavoritesSelected,
          ),
        ],
      ),
    );
  }
}
