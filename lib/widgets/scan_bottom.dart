import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
import 'package:qr_scan/screens/scanner_screen.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () async {
        print('Botó polsat!');

        // Abrir la pantalla de escáner
        final barcodeScanRes = await Navigator.push<String>(
          context,
          MaterialPageRoute(builder: (_) => const ScannerPage()),
        );
        if (barcodeScanRes != null && barcodeScanRes.isNotEmpty) {
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.nuevoScan(barcodeScanRes);
        }
      },
    );
  }

}
