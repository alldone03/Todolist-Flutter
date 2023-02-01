import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Andrew Garfield"),
            accountEmail: const Text("capek@ngoding.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
            otherAccountsPictures: const [
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   backgroundImage: NetworkImage(
              //       "https://randomuser.me/api/portraits/women/74.jpg"),
              // ),
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   backgroundImage: NetworkImage(
              //       "https://randomuser.me/api/portraits/men/47.jpg"),
              // ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/todoapp');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Add List"),
            onTap: () {
              Navigator.pushNamed(context, '/adddata');
            },
          ),
        ],
      ),
    );
  }
}
