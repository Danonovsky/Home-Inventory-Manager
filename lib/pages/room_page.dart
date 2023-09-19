import 'package:fluent_ui/fluent_ui.dart';
import 'package:home_manager/models/product.dart';
import 'package:home_manager/services/store_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});
  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);
    return const Text('Elo');
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
              child: const Icon(FluentIcons.add, size: 24.0),
              onPressed: () => provider.addProduct(Product(
                id: const Uuid().v4(),
              )),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text(product.price.toStringAsFixed(2)),
                trailing: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FilledButton(
                        onPressed: () {},
                        child: const Icon(FluentIcons.edit),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FilledButton(
                        onPressed: () => provider.deleteProduct(index),
                        child: const Icon(FluentIcons.delete),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
