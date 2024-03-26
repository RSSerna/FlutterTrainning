import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_db_app/provider/provider.dart';
import 'package:qr_db_app/theme/app_theme.dart';
import 'package:qr_db_app/utils/utils.dart' as util;
class HistorialListView extends StatelessWidget {
  const HistorialListView({
    Key? key,
    required this.tipo,
  }) : super(key: key);

  final String tipo;



  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
      itemCount: scanListProvider.scanModels.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(color: Colors.red),
          onDismissed: (_) {
            Provider.of<ScanListProvider>(context, listen: false)
                .borrarScanPorId(scanListProvider.scanModels[index].id!);
          },
          child: ListTile(
            leading: Icon(
              tipo == 'geo' ? Icons.map : Icons.link_sharp,
              color: AppTheme.primaryColor,
            ),
            title: Text(scanListProvider.scanModels[index].valor),
            subtitle: Text('ID: ${scanListProvider.scanModels[index].id}'),
            trailing: const Icon(
              Icons.arrow_right,
              color: AppTheme.primaryColor,
            ),
            onTap: () => util.launchUrlUtil(context, scanListProvider.scanModels[index]),
          ),
        );
      },
    );
  }
}
