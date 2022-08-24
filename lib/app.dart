import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'components/adaptive/app_shell.dart';
import 'env/environment_settings.dart';
import 'integration/dependency_injection.dart';

class KurtLourensApp extends StatefulWidget {
  final EnvironmentSettings env;
  const KurtLourensApp(this.env, {Key? key}) : super(key: key);

  @override
  createState() => _KurtLourensAppState();
}

class _KurtLourensAppState extends State<KurtLourensApp> {
  @override
  initState() {
    super.initState();
    initDependencyInjection(widget.env);

    if (kReleaseMode) {
      // initFirebaseAdMob();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const AppShell();
  }
}
