import 'package:fluent_ui/fluent_ui.dart';

Future<bool> showAreYouSureDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => ContentDialog(
      title: const Text('Are you sure?'),
      actions: [
        Button(
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
