import "dart:developer";

import "package:check_vpn/check_vpn.dart";
import "package:flutter/material.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await gatherInformation();
  runApp(const MyApp());
}

Future<void> gatherInformation() async {
  SuccessResult successResult = SuccessResult();
  FailureResult failureResult = FailureResult();

  await CheckVPN.instance.getInfo(
    apiKey: "YOUR KEY HERE",
    onSuccessResult: (SuccessResult res) {
      successResult = res;
    },
    onFailureResult: (FailureResult err) {
      failureResult = err;
    },
  );

  log("IP: ${successResult.ip}");
  log("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");
  log("Security: ${successResult.security?.toJson()}");
  log("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");
  log("Location: ${successResult.location?.toJson()}");
  log("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");
  log("Network: ${successResult.network?.toJson()}");
  log("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");
  log("Error message: ${failureResult.message}");
  return Future<void>.value();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Check VPN Example",
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      home: const Scaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}
