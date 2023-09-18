import 'package:fluent_ui/fluent_ui.dart';
import 'package:home_manager/models/product.dart';
import 'package:home_manager/services/inventory_provider.dart';
import 'package:provider/provider.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});
  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<InventoryProvider>(context);
    return Column(
      children: [
        Center(
          child: FilledButton(
            child: const Icon(FluentIcons.add, size: 24.0),
            onPressed: () => provider.addProduct(Product()),
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
                    FilledButton(
                      onPressed: () {},
                      child: const Icon(FluentIcons.edit),
                    ),
                    FilledButton(
                      onPressed: () => provider.deleteProduct(index),
                      child: const Icon(FluentIcons.delete),
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