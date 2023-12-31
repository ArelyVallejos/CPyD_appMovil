import 'package:cpyd/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen(
      {Key? key, required this.initialUrl, required this.destinationUrl})
      : super(key: key);

  final String initialUrl;
  final String destinationUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        title: const Text('      Login UTEM'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 3, 204, 204),
            Color.fromARGB(255, 2, 129, 129)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
        backgroundColor: Colors.white,
      ),
      body: WebView(
        initialUrl: initialUrl,
        userAgent: "random",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          controller.clearCache();
          CookieManager().clearCookies();
        },
        navigationDelegate: (navReq) {
          if (navReq.url.startsWith(destinationUrl)) {
            // Si la pagina a la que vamos es la de resultados, guardo
            // el JWT, y navego a HomeScreen
            var responseUrl = Uri.parse(navReq.url);

            SharedPreferences.getInstance().then((SharedPreferences prefs) {
              responseUrl.queryParameters.forEach((key, value) {
                prefs.setString(key, value);
              });
            });

            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
