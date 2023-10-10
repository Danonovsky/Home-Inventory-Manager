import 'package:flutter/material.dart';
import 'package:home_manager/pages/room_page.dart';
import 'package:home_manager/services/store_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);

    List<Widget> getRooms() {
      List<Widget> items = [];
      for (var i = 0; i < provider.rooms.length; i++) {
        var room = provider.rooms[i];
        items.add(RoomPage(room: room));
      }
      return items;
    }

    return Column(
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getRooms().length,
            itemBuilder: (context, i) {
              var room = provider.rooms[i];
              return ListTile(
                title: Text(room.name),
              );
            },
          ),
        ),
      ],
    );
  }
}
