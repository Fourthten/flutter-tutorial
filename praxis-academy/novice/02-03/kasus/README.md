### Launch screen
Untuk android, edit file `launch_background.xml` di lokasi `android\app\src\main\res\drawable` menjadi seperti ini:
```
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- <item android:drawable="@android:color/white" /> -->
    <!-- masukan gambar icon disini -->
    <item>
        <bitmap
            android:gravity="center"
            android:src="@mipmap/ic_launcher" />
    </item>
</layer-list>
```
![navigasi](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/images/launchscreen.PNG)
### Mengganti Icon Android
Letakan gambar yang ingin di jadikan icon android di `android\app\src\main\res\mipmap`.\
![icon](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/images/icon.PNG)
### Navigasi
Navigasi tab mempertahankan riwayat navigasinya sendiri. 
Sehingga setiap tab memiliki navigator sendiri menciptakan navigasi paralel. 
Bisa juga meluncurkan halaman full screen seperti alert dialog dimana diatas navigasi tab ada navigator root. 
Masing-masing navigator tab adalah navigator bersarang di bawah satu navigator root. 
```
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
```
Jalankan dengan perintah `flutter run --route=/signup` untuk masuk ke halaman signup. 
Pada halaman signup yang menjadi route yaitu halaman `CollectPersonalInfoPage` kemudian 
setelah di tap menuju ke halaman `ChooseCredentialsPage`. Setelah di tap maka akan memanggil onSignupComplete() 
yang nantinya menuju ke '/' route aplikasi atau halaman HomePage. 
Untuk membuat sample project jalankan perintah `flutter create --sample=widgets.Navigator.1 mysample`.\
File [signupnavigator.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/kasus/signupnavigator.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/kasus/record/navigatesignup.gif" width="300">

Sumber:\
[Launch Screen and App Icon](https://flutter.dev/docs/development/ui/assets-and-images)\
[Navigator](https://api.flutter.dev/flutter/widgets/Navigator-class.html)