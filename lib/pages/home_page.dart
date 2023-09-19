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
      debugPrint(index.toString());
      debugPrint(provider.rooms.length.toString());
      if (await showAreYouSureDialog(context) == false) return;
      provider.deleteRoom(index);
    }

    List<NavigationPaneItem> getRooms() {
      List<NavigationPaneItem> items = [];
      for (var i = 0; i < provider.rooms.length; i++) {
        var room = provider.rooms[i];
        var pane = PaneItem(
            icon: const Icon(FluentIcons.room),
            body: const RoomPage(),
            title: const Text('Room'),
            trailing: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FilledButton(
                    onPressed: () => deleteRoom(i),
                    child: const Icon(FluentIcons.delete),
                  ),
                ),
              ],
            ));
        items.add(pane);
      }
      return items;
    }

    return NavigationView(
      pane: NavigationPane(
        scrollBehavior: ScrollBehavior(),
        selected: provider.rooms.isNotEmpty ? _index : null,
        onChanged: (index) => setState(() => _index = index),
        displayMode: PaneDisplayMode.top,
        leading: Button(
          onPressed: () => provider.addRoom(Room()),
          child: const Icon(FluentIcons.add),
        ),
        items: getRooms(),
      ),
    );
  }
}
