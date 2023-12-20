import 'package:desing_app/theme/theme.dart';
import 'package:desing_app/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme.colorScheme;

    return Scaffold(
      body: HeaderWavesGradient(color: appTheme.onSecondary),
    );
  }
}