import 'package:flutter/material.dart';
import 'package:home_manager/pages/home_page.dart';
import 'package:home_manager/pages/inventory_page.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key, required this.title});
  final String title;

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  int _index = 0;

  final List<NavigationRailDestination> _pages = const [
    NavigationRailDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: Text('Home'),
    ),
    NavigationRailDestination(
      selectedIcon: Icon(Icons.room),
      icon: Icon(Icons.room_outlined),
      label: Text('Inventory'),
    ),
  ];

  final List<Widget> _views = const [HomePage(), InventoryPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              selectedIndex: _index,
              onDestinationSelected: (index) => setState(() => _index = index),
              destinations: _pages,
              extended: true,
            ),
            Expanded(
              child: _views[_index],
            ),
          ],
        ),
      ),
    );
  }
}
