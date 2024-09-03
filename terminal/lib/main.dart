import 'package:model_flight_logbook_terminal/data/repositories/local_settings_repo_impl.dart';
import 'package:model_flight_logbook_terminal/ui/screen/flight_session_status/flight_session_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:model_flight_logbook_terminal/injector.dart';
import 'package:model_flight_logbook_terminal/l10n/generated/app_localizations.dart';
import 'package:model_flight_logbook_terminal/ui/screen/settings/settings_screen.dart';
import 'package:model_flight_logbook_terminal/ui/screen/rfid_scan/rfid_scan_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await initInjector();
  await LocalSettingsRepoImpl.initCache();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        RfidScanScreen.route: (context) => const RfidScanScreen(),
        SettingsScreen.route: (context) => const SettingsScreen(),
        FlightSessionStatusScreen.route: (context) => const FlightSessionStatusScreen(),
      },
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
    );
  }
}
