// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// Press the Navigation Drawer button to the left of AppBar to show
// a simple Drawer with two items.
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      accountName: Text(
        'Long Soeng',
      ),
      accountEmail: Text(
        'longsoeng@gmail.com',
      ),
      currentAccountPicture: const CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: Text(
            'Favorites',
          ),
          leading: const Icon(Icons.favorite_outline),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text(
            'Settings',
          ),
          leading: const Icon(Icons.settings_outlined),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        
      ],
    );
    return Drawer(
        child: drawerItems,
    );
  }
}

