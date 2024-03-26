import 'package:flutter/material.dart';
import 'package:qr_db_app/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlUtil(BuildContext context, ScanModel scanModel) async {
  if (scanModel.tipo == 'http') {
    final url = scanModel.valor;
    final Uri uri;
    if (url.contains('https')) {
      uri = Uri.https(url.substring(8));
    } else {
      uri = Uri.http(url.substring(7));
    }
    print(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scanModel);
  }
}
