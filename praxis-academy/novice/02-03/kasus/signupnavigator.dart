import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for Navigator',
      // MaterialApp berisi Navigator top-level
      initialRoute: '/',
      routes: {
        // route page
        '/': (BuildContext context) => HomePage(),
        // signup page
        '/signup': (BuildContext context) => SignUpPage(),
      },
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.display1,
      // Container Style
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Text('Home Page'),
      ),
    );
  }
}

// Collect Personal Info Page
class CollectPersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.display1,
      // deteksi gesture
      child: GestureDetector(
        onTap: () {
          // pindah ke credentials page,
          Navigator.of(context)
            .pushReplacementNamed('signup/choose_credentials');
        },
        // container style
        child: Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: Text('Collect Personal Info Page'),
        ),
      ),
    );
  }
}

// Choose Credentials Page
class ChooseCredentialsPage extends StatelessWidget {
  const ChooseCredentialsPage({
    this.onSignupComplete,
  });

  final VoidCallback onSignupComplete;

  @override
  Widget build(BuildContext context) {
    // deteksi gesture
    return GestureDetector(
      // call onSignupComplete
      onTap: onSignupComplete,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.display1,
        // Container style
        child: Container(
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: Text('Choose Credentials Page'),
        ),
      ),
    );
  }
}

// Signup Page
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SignUpPage membuat navigator sendiri yang menjadi nested navigator.
    return Navigator(
      // route page
      initialRoute: 'signup/personal_info',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        // cek nama halaman
        switch (settings.name) {
          case 'signup/personal_info':
          // Ke halaman CollectPersonalInfoPage lalu navigasi ke 'signup/choose_credentials'.
            builder = (BuildContext _) => CollectPersonalInfoPage();
            break;
          case 'signup/choose_credentials':
          // Ke halaman ChooseCredentialsPage lalu aktifkan 'onSignupComplete()'.
            builder = (BuildContext _) => ChooseCredentialsPage(
              onSignupComplete: () {
                // Referensi Navigator.of(context) menuju ke
                // top level Navigator karena SignUpPage berada diatas
                // nested Navigator yang dibuatnya. pop()
                // akan memunculkan "sign up" dan kembali ke
                // "/" route atau HomePage.
                Navigator.of(context).pop();
              },
            );
            break;
          default:
            // error
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}