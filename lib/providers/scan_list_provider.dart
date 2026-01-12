import 'package:flutter/material.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipusSeleccionat = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final newScan = ScanModel(valor: valor);
    final id = await DBProvider.db.insertScan(newScan);
    newScan.id = id;

    if(newScan.tipus == tipusSeleccionat) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansPerTipus(String tipus) async {
    final scans = await DBProvider.db.getScansByType(tipus);
    this.scans = [...scans];
    tipusSeleccionat = tipus;
    notifyListeners();
  }

  borrarTots() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    cargarScansPerTipus(tipusSeleccionat);
  }
}
