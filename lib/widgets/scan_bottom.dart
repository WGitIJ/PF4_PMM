import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () {
        print('Botó polsat!');
        String barcodeScanRes = 'https://flutter.dev';
        final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nuevoScan(barcodeScanRes);
        String barcodeScanRes1 = 'geo:40.689247,-74.044502';
        final ScanListProvider scanListProvider1 = Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider1.nuevoScan(barcodeScanRes1);
      },
    );
  }
}
