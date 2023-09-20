import 'package:fluent_ui/fluent_ui.dart';
import 'package:home_manager/models/room.dart';
import 'package:home_manager/services/store_provider.dart';
import 'package:provider/provider.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key, required this.room});
  final Room room;
  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  Room get room => widget.room;
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<StoreProvider>(context);
    return Text(room.name);
  }
}
