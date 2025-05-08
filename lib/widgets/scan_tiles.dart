import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_caicedonia/providers/scan_list_provider.dart';
import 'package:qr_scanner_caicedonia/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
            color: Colors.redAccent, child: Icon(Icons.delete_forever)),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScansPorId(scans[i]!.id!);
        },
        child: ListTile(
          leading: Icon(
            tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_double_arrow_right, color: Colors.red),
          onTap: () => launchURL(scans[i], context),
        ),
      ),
    );
  }
}
