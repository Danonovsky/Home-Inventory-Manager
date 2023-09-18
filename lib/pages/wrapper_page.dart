import 'package:fluent_ui/fluent_ui.dart';
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

  final List<NavigationPaneItem> _pages = [
    PaneItem(
      icon: const Icon(FluentIcons.home),
      body: const HomePage(),
      title: const Text('Home'),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.visuals_store),
      body: const InventoryPage(),
      title: const Text('Inventory'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(widget.title),
      ),
      pane: NavigationPane(
        selected: _index,
        onChanged: (index) => setState(() => _index = index),
        items: _pages,
      ),
    );
  }
}
