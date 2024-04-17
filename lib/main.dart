import 'package:flutter/material.dart';
import 'package:flutter_test_app/config/theme/app_theme.dart';
import 'package:flutter_test_app/presentation/providers/discover_provider.dart';
import 'package:flutter_test_app/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DiscoverProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          title: 'TokTik',
          home: const DiscoverScreen()),
    );
  }
}
