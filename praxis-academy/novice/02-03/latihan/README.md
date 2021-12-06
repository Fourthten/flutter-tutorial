### Menambah Asset dan image
Spesifik lokasi di pubspec.yaml
```
flutter:
  assets:
    - assets/images/my_icon.png
    - assets/images/background.png
```
All assets
```
flutter:
  assets:
    - assets/
```
Assets variant
```
flutter:
  assets:
    - graphics/background.png
```
Example Code
```
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image from assets"),
        ),
        body: Image.asset('assets/images/paint.png'),
      ),
    );
  }
}
```
![images](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/images/images.PNG)
### Mengganti Icon Android
Untuk android lokasi di `android\app\src\main\res\mipmap` atau pubspec.yaml:
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_launcher_icons: ^0.7.4

flutter_icons:
  image_path: "assets/images/praxis.png"
  android: true
  ios: true
```
run in terminal
```
>flutter pub get
>flutter pub pub run flutter_launcher_icons:main
```
atau buka android studio, tunggu build selesai. 
klik kanan folder `res`, `New>Image Asset`, konfigurasi ikonnya.
![icon](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/images/icon.PNG)
### Launch/splash screen
Untuk android lokasi di `android\app\src\main\res\drawable\launch_background.xml`.
```
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- <item android:drawable="@android:color/white" /> -->
    <!-- insert image assets here -->
    <item>
        <bitmap
            android:gravity="center"
            android:src="@mipmap/ic_launcher" />
    </item>
</layer-list>
```
![navigasi](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/images/launchscreen.PNG)
### Navigasi
- Animasi widget di layar berbeda
1. Dua layar dengan gambar sama
```
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
        child: Image.network(
          'https://picsum.photos/250?image=9',
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}
```
2. Gunakan hero widget untuk koneksi dua layar dengan animasi
```
Hero(
  tag: 'imageHero',
  child: Image.network(
    'https://picsum.photos/250?image=9',
  ),
);
```
File [animatewidget_acrossscreen.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/animatewidget_acrossscreen.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/record/animation.gif" width="300">

- Navigasi layar baru dan kembali
1. Buat 2 routes
```
class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```
2. Navigasi route kedua menggunakan `Navigator.push()`
```
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
  );
}
```
3. Kembali ke route pertama menggunakan `Navigator.pop()`
```
onPressed: () {
  Navigator.pop(context);
}
```
File [navigation_newscreen.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/navigation_newscreen.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/record/navigate.gif" width="300">

- Navigasi dengan routes bernama
1. Buat 2 routes
```
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```
2. Tentukan routes
```
MaterialApp(
  // Start the app with the "/" named route. In this case, the app starts
  // on the FirstScreen widget.
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => FirstScreen(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) => SecondScreen(),
  },
);
```
3. Navigasi layar kedua
```
// Within the `FirstScreen` widget
onPressed: () {
  // Navigate to the second screen using a named route.
  Navigator.pushNamed(context, '/second');
}
```
4. Kembali ke layar pertama
```
// Within the SecondScreen widget
onPressed: () {
  // Navigate back to the first screen by popping the current route
  // off the stack.
  Navigator.pop(context);
}
```
File [navigate_namedroute.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/navigate_namedroute.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/record/namedroute.gif" width="300">

- Lewati argumen ke route bernama
1. Tentukan argumen
```
// You can pass any object to the arguments parameter.
// In this example, create a class that contains a customizable
// title and message.
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
```
2. Buat widget yang mengekstrak argumen
```
// A widget that extracts the necessary arguments from the ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}
```
3. Daftarkan widget di tabel route
```
MaterialApp(
  routes: {
    ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
  },
);
```
4. Navigasi ke widget
```
// A button that navigates to a named route. The named route
// extracts the arguments by itself.
RaisedButton(
  child: Text("Navigate to screen that extracts arguments"),
  onPressed: () {
    // When the user taps the button, navigate to the specific route
    // and provide the arguments as part of the RouteSettings.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExtractArgumentsScreen(),
        // Pass the arguments as part of the RouteSettings. The
        // ExtractArgumentScreen reads the arguments from these
        // settings.
        settings: RouteSettings(
          arguments: ScreenArguments(
            'Extract Arguments Screen',
            'This message is extracted in the build method.',
          ),
        ),
      ),
    );
  },
),
```
File [pass_argument.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/pass_argument.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/record/pass_argument.gif" width="300">

- Mengembalikan data dari layar
1. Tentukan home screen
```
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      // Create the SelectionButton widget in the next step.
      body: Center(child: SelectionButton()),
    );
  }
}
```
2. Tambah button yang menjalankan layar
```
class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the
  // result from Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
  }
}
```
3. Tampilkan layar selection dengan 2 button
```
class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // Pop here with "Yep"...
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // Pop here with "Nope"
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```
4. Ketika button diketuk, tutup layar selection
```
RaisedButton(
  onPressed: () {
    // The Yep button returns "Yep!" as the result.
    Navigator.pop(context, 'Yep!');
    // Navigator.pop(context, 'Nope!');
  },
  child: Text('Yep!'),
);
```
5. Tampilkan snackbar di home screen dengan selection
```
_navigateAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SelectionScreen()),
  );

  // After the Selection Screen returns a result, hide any previous snackbars
  // and show the new result.
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$result")));
}
```
File [returndata.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/returndata.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/record/returndata.gif" width="300">

- Kirim data ke layar baru
1. Todo class
```
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
```
2. Generate list todos
```
final todos = List<Todo>.generate(
  20,
  (i) => Todo(
        'Todo $i',
        'A description of what needs to be done for Todo $i',
      ),
);
```
3. Tampilan list todos menggunakan ListView
```
ListView.builder(
  itemCount: todos.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(todos[index].title),
    );
  },
);
```
4. Buat layar detail informasi todo
```
class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Todo todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
```
5. Navigasi dan lewati data ke layar detail
```
ListView.builder(
  itemCount: todos.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(todos[index].title),
      // When a user taps the ListTile, navigate to the DetailScreen.
      // Notice that you're not only creating a DetailScreen, you're
      // also passing the current todo to it.
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(todo: todos[index]),
          ),
        );
      },
    );
  },
);
```
File [senddata.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/senddata.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-03/latihan/record/senddata.gif" width="300">

Sumber:\
[Asset and Image](https://flutter.dev/docs/development/ui/assets-and-images)\
[Cookbook Navigation](https://flutter.dev/docs/cookbook#navigation)