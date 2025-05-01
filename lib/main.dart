import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_caicedonia/pages/pages.dart';
import 'package:qr_scanner_caicedonia/providers/scan_list_provider.dart';
import 'package:qr_scanner_caicedonia/providers/ui_providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'mapa': (_) => MapaPage()},
        theme: ThemeData(
            primaryColor: Colors.redAccent,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.redAccent)),
      ),
    );
  }
}
