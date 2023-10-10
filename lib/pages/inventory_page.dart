import 'package:flutter/material.dart';
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
    final result = await showAddProductDialog(context);
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
            child: ElevatedButton(
              child: const Icon(Icons.add, size: 24.0),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Icon(Icons.edit),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: OutlinedButton(
                        onPressed: () => deleteProduct(index),
                        child: const Icon(Icons.delete),
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
