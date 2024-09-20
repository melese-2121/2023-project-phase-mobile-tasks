import 'package:flutter/material.dart';

const itemCount = 20;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => debugPrint("Item $index Clicked"),
            title: Text("Item $index"),
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.select_all),
          );
        });
  }
}
