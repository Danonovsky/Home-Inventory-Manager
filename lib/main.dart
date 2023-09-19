import 'package:fluent_ui/fluent_ui.dart';
import 'package:home_manager/pages/wrapper_page.dart';
import 'package:home_manager/services/store_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Manager',
      color: Colors.red,
      theme: FluentThemeData(
        accentColor: Colors.purple,
        brightness: Brightness.dark,
      ),
      home: ChangeNotifierProvider<StoreProvider>(
        create: (_) => StoreProvider(),
        child: const WrapperPage(title: 'Home Manager'),
      ),
    );
  }
}
