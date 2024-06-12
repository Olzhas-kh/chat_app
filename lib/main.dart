import 'package:chat_app/feature/auth/login/logic/provider/auth_provider.dart';
import 'package:chat_app/feature/auth/login/presentation/screens/login_screen.dart';
import 'package:chat_app/feature/chat/logic/provider/chat_provider.dart';
import 'package:chat_app/feature/home/presentation/screens/home_screen.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AuthentificationWrapper(),
      ),
    );
  }
}
class AuthentificationWrapper extends StatelessWidget {
  const AuthentificationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authprovider, child){
        if(authprovider.isSignedIn){
          return HomeScreen();
        }
        else {
          return LoginScreen();
        }
      }
    );
  }
}
