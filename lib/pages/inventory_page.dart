import 'package:fluent_ui/fluent_ui.dart';
import 'package:home_manager/models/product.dart';
import 'package:home_manager/services/store_provider.dart';
import 'package:home_manager/utils.dart';
import 'package:provider/provider.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});
  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  addProduct(StoreProvider provider) async {
    var nameController = TextEditingController();
    var urlController = TextEditingController();
    var price = 0.0;
    final result = await showDialog<Product?>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Add New Product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoLabel(
              label: 'Name',
              child: TextBox(
                controller: nameController,
                placeholder: 'Name',
                expands: false,
              ),
            ),
            InfoLabel(
              label: 'Url',
              child: TextBox(
                controller: urlController,
                placeholder: 'Url',
                expands: false,
              ),
            ),
            InfoLabel(
              label: 'Price',
              child: NumberBox(
                value: price,
                onChanged: (value) => price = value ?? 0,
                placeholder: '0.00',
                smallChange: 0.01,
              ),
            ),
          ],
        ),
        actions: [
          FilledButton(
            child: const Text('Add'),
            onPressed: () {
              if (nameController.text.isEmpty) {
                return;
              }
              Navigator.pop(
                  context,
                  Product(
                    name: nameController.text,
                    url: urlController.text,
                    price: price,
                  ));
            },
          ),
          Button(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, null),
          ),
        ],
      ),
    );
    if (result == null) return;
    provider.addProduct(result);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);
    void deleteProduct(index) async {
      if (await showAreYouSureDialog(context) == false) return;
      provider.deleteProduct(index);
    }

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              child: const Icon(FluentIcons.add, size: 24.0),
              onPressed: () async => await addProduct(provider),
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
                        onPressed: () => deleteProduct(index),
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
