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
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StoreProvider>(context);
    void onClickDelete(index) async {
      if (await showAreYouSureDialog(context) == false) return;
      provider.deleteProduct(index);
    }

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
              child: const Icon(FluentIcons.add, size: 24.0),
              onPressed: () => provider.addProduct(Product()),
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
                        onPressed: () => onClickDelete(index),
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
