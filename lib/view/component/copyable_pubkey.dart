import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyablePubkey extends StatelessWidget {
  const CopyablePubkey({super.key, required this.pubkey});

  final String pubkey;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        try {
          await Clipboard.setData(ClipboardData(text: pubkey));
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Center(child: Text('コピーしました')),
              ),
            );
          }
        } catch (_) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Center(child: Text('コピーできませんでした')),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      child: Row(
        children: [
          const Icon(
            Icons.copy,
            size: 14,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              pubkey,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
