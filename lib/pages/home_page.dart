import 'package:fluent_ui/fluent_ui.dart';
import 'package:home_manager/models/room.dart';
import 'package:home_manager/pages/room_page.dart';
import 'package:home_manager/services/store_provider.dart';
import 'package:home_manager/utils.dart';
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

    void deleteRoom(index) async {
      if (await showAreYouSureDialog(context) == false) return;
      provider.deleteRoom(index);
    }

    List<Tab> getRooms() {
      List<Tab> items = [];
      for (var i = 0; i < provider.rooms.length; i++) {
        var room = provider.rooms[i];
        var pane = Tab(
          icon: const Icon(FluentIcons.room),
          body: RoomPage(room: room),
          text: Text(room.name),
          semanticLabel: room.name,
          onClosed: () => deleteRoom(i),
        );
        items.add(pane);
      }
      return items;
    }

    return TabView(
      tabs: getRooms(),
      currentIndex: _index,
      closeButtonVisibility: CloseButtonVisibilityMode.always,
      onChanged: (index) => setState(() => _index = index),
      onNewPressed: () => provider.addRoom(Room(name: "New Room")),
    );
  }
}
