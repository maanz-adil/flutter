import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_login/views/music_view.dart';
import 'package:provider/provider.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'views/login_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MusicApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel()..listenToAuthChanges(),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Google Sign In Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginView(),
      ),
    );
  }
}