import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/Providers/platform_provider.dart';
import 'package:provider/provider.dart';
import 'package:platform_convertor/Views/material_screen.dart';

import 'Views/cupertino_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlatformProvider()),
      ],
      child: Consumer<PlatformProvider>(
        builder: (context, value, _) => (value.isIos == false)
            ? MaterialApp(
                theme: ThemeData(useMaterial3: true),
                debugShowCheckedModeBanner: false,
                //
                home: const Detail())
            : const CupertinoApp(
                debugShowCheckedModeBanner: false,
                home: HomePage(),
              ),
      ),
    ),
  );
}
