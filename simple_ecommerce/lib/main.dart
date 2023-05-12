import 'package:flutter/material.dart';

import 'core/utils/injection.dart';
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection().then((value) {
    runApp(const MyApp());
  });
}
