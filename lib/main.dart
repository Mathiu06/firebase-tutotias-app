import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/bloc/provider.dart';
import 'package:friendlychat/pages/tutor_page.dart';

import 'package:friendlychat/preferencias_usuario/preferencias_usuario.dart';
import 'package:friendlychat/service/authentication.dart';
import 'package:friendlychat/theme/theme_data.dart';

import 'model/root_page.dart';

const title = "Friendly Chat";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _prefs = new PreferenciasUsuario();
  await _prefs.initPrefs();

  runApp(new FriendlyChatApp());
}

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: defaultTargetPlatform == TargetPlatform.iOS
            ? kIOSTheme
            : kDefaultTheme,
        routes: {
          // home: RootPage(title: title, auth: Auth()),
          'home': (BuildContext context) =>
              RootPage(title: title, auth: Auth()),
          'tutor': (BuildContext context) => TutorPage(),
        },
        initialRoute: 'home',
      ),
    );
  }
}
