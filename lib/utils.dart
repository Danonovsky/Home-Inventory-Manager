import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_manager/models/product.dart';

Future<bool> showAreYouSureDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Are you sure?'),
      actions: [
        ElevatedButton(
          child: const Text('Yes'),
          onPressed: () => Navigator.pop(context, true),
        ),
        FilledButton(
          child: const Text('No'),
          onPressed: () => Navigator.pop(context, false),
        ),
      ],
    ),
  );
  return result ?? false;
}

Future<Product?> showAddProductDialog(context) {
  var nameController = TextEditingController();
  var urlController = TextEditingController();
  var price = 0.0;
  var result = showDialog<Product?>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Add New Product'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              label: Text('Name'),
            ),
          ),
          TextFormField(
            controller: urlController,
            decoration: const InputDecoration(
              label: Text('Url'),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
            ],
            decoration: const InputDecoration(
              label: Text('Price'),
            ),
            onChanged: (value) => price = double.parse(value),
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
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context, null),
        ),
      ],
    ),
  );
  return result;
}
