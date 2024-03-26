import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_db_app/models/scan_model.dart';
import 'package:qr_db_app/provider/provider.dart';
import 'package:qr_db_app/screens/screens.dart';
import 'package:qr_db_app/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_rounded),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarTodos();
            },
          ),
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const _CustomBottomNavigationBarWidget(),
      floatingActionButton: const _CusFloatingNavButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    final currentIndex = uiProvider.selectedIndexMenu;

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return const MapsScreen();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return const DirectionsScreen();
      default:
        return const MapsScreen();
    }
  }
}

class _CusFloatingNavButtom extends StatelessWidget {
  const _CusFloatingNavButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.qr_code),
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', false, ScanMode.QR);
        String barcodeScanRes = 'https://fernando-herrera.com';
        // String barcodeScanRes = 'geo:45.280089,-75.922405';
        if(barcodeScanRes == '-1') return;
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        
        launchUrlUtil(context,nuevoScan);
      },
    );
  }
}

class _CustomBottomNavigationBarWidget extends StatelessWidget {
  const _CustomBottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedIndexMenu;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.link), label: 'Links'),
      ],
      onTap: (int i) {
        uiProvider.selectedIndexMenu = i;
      },
    );
  }
}
