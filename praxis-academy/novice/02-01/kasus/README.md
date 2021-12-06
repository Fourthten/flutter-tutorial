## Part 1
- Cara menulis aplikasi Flutter di Android.
- Struktur dasar aplikasi Flutter.
- Menemukan dan menggunakan *package* untuk memperluas fungsionalitas.
- Menggunakan hot reload untuk pengembangan lebih cepat.
- Menerapkan *stateful widget*.
- Membuat *infinite scrolling listview*.
### Memulai flutter pada android device / emulator
1. Buat flutter project dengan nama `myapp`
2. *replace* file `lib\main.dart` untuk menampilkan `Hello World`
   ```
    // Copyright 2018 The Flutter team. All rights reserved.
    // Use of this source code is governed by a BSD-style license that can be
    // found in the LICENSE file.
    // import package
    import 'package:flutter/material.dart';
    // run App
    void main() => runApp(MyApp());
    // Widget MyApp
    class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            // title
            title: 'Welcome to Flutter',
            // Scaffold struktur
            home: Scaffold(
                // appBar
                appBar: AppBar(
                title: Text('Welcome to Flutter'),
                ),
                // body
                body: Center(
                // text 'Hello World'
                child: Text('Hello World'),
                ),
            ),
            );
        }
    }
   ```
Aplikasi akan memunculkan text 'Hello World'.\
![helloworld](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/helloworld.PNG)
### Menggunakan eksternal *package*
1. Tambahkan *dependencies* `english_words` pada `pubspec.yaml`
   ```
    dependencies:
    flutter:
        sdk: flutter

    # The following adds the Cupertino Icons font to your application.
    # Use with the CupertinoIcons class for iOS style icons.
    cupertino_icons: ^0.1.2
   + english_words: ^3.1.0
   ```
2. *Pull package* di terminal
   ```
   flutter pub get
   ```
3. import package `import 'package:english_words/english_words.dart';` di `lib\main.dart`
4. Gunakan english_word untuk generate text
   ```
    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        + final wordPair = WordPair.random();
        return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
            title: Text('Welcome to Flutter'),
            ),
            body: Center(
            - child: Text('Hello World'),
            // Text generate english
            + child: Text(wordPair.asPascalCase),
            ),
        ),
        );
    }
    }
   ```
Aplikasi akan memunculkan *english word* yang di *generate* secara acak setiap di *restart*.\
![englishword](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/englishword.PNG)
### Menambahkan Stateful Widgets
   Stateless widgets tidak dapat dirubah. Stateful widgets memungkinkan berubah selama menggunakan widgets 
   terdiri dari 2 yaitu kelas instance dan kelas state itu sendiri yang tidak dapat dirubah dan tetap ada.
1. Buat kelas state
   ```
    class RandomWordsState extends State<RandomWords> {
        // TODO Add build() method
    }
   ```
2. Tambahkan *stateful RandomWords widget* ke `main.dart`
   ```
    class RandomWords extends StatefulWidget {
        @override
        RandomWordsState createState() => RandomWordsState();
    }
   ```
3. Tambahkan `build()` *method* ke `RandomWordsState`
   ```
    class RandomWordsState extends State<RandomWords> {
        @override
        Widget build(BuildContext context) {
            final wordPair = WordPair.random();
            // mengembalikan nilai text
            return Text(wordPair.asPascalCase);
        }
    }
   ```
4. Ganti *word generation code* dengan `RandomWords`
   ```
    class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            - final wordPair = WordPair.random();
            return MaterialApp(
            title: 'Welcome to Flutter',
            home: Scaffold(
                appBar: AppBar(
                title: Text('Welcome to Flutter'),
                ),
                body: Center(
                - child: Text(wordPair.asPascalCase),
                // call RandomWords
                + child: RandomWords(),
                ),
            ),
            );
        }
    }
   ```
Aplikasi memunculkan *english word* hasil *generate* dengan menggunakan stateful widget.\
![stateful](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/statefulwidget.PNG)
### Membuat Infinite Scrolling Listview
1. Tambahkan `_suggestions` *list* pada `RandomWordsState class` untuk menyimpan pasangan kata yang disarankan. 
   Tambahkan `_biggerFont` *variable* untuk font size besar.
   ```
    class RandomWordsState extends State<RandomWords> {
        final _suggestions = <WordPair>[];
        final _biggerFont = const TextStyle(fontSize: 18.0);
        // ···
    }
   ```
2. Tambahkan `_buildSuggestions()` *function* pada `RandomWordsState class`
   ```
    Widget _buildSuggestions() {
        return ListView.builder(
        // padding item
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
            if (i.isOdd) return Divider(); /*2*/

            final index = i ~/ 2; /*3*/
            if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            }
            return _buildRow(_suggestions[index]);
        });
    }
   ```
   /1/ itemBuilder dipanggil sekali perpasangan kata dan menempatkannya pada baris ListTile. 
      Baris genap menambahkan baris ListTile pasangan kata. Baris ganjil menambahkan widget 
      Divider untuk memisahkan entri secara visual.\
   /2/ Tambahkan widget divider one-pixel-high setiap baris ListView.\
   /3/ Membagi i dengan 2 dan *return integer*. Menghitung jumlah pasangan kata ListView 
      dikurangi widget divider. Misal 1,2,3,4,5 menjadi 0,1,1,2,2.\
   /4/ Jika mencapai akhir pasangan kata maka hasilkan 10 kata lagi dan tambah ke daftar.
3. Tambahkan `_buildRow()` *function* pada `RandomWordsState`
   ```
    Widget _buildRow(WordPair pair) {
        // style ListTile
        return ListTile(
            title: Text(
            pair.asPascalCase,
            style: _biggerFont,
            ),
        );
    }
   ```
4. Pada `RandomWordsState` *class*, perbarui `build()` *method* untuk menggunakan `_buildSuggestions()`, 
   daripada langsung memanggil *word generation library*. (Scaffold mengimplementasikan dasar tata letak visual Material Design.)
   ```
    Widget build(BuildContext context) {
        // Scaffold struktur
        return Scaffold(
            // appBar
            appBar: AppBar(
            title: Text('Startup Name Generator'),
            ),
            // body
            body: _buildSuggestions(),
        );
    }
   ```
5. Pada `MyApp` *class*, perbaharui `build()` *method* dengan mengganti `title`, dan mengubah home menjadi `RandomWords widget`
   ```
    Widget build(BuildContext context) {
        return MaterialApp(
        + title: 'Startup Name Generator',
        + home: RandomWords(), 
        - title: 'Welcome to Flutter',
        - home: Scaffold(
        -     appBar: AppBar(
        -     title: Text('Welcome to Flutter'),
        -     ),
        -     body: Center(
        -     child: RandomWords(),
        -     ),
        - ),
        );
    }
   ```
Aplikasi memunculkan scroll listview tak terhingga.\
![infinitescroll](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/infinitelist.PNG)\
File [main_part1.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/main_part1.dart)
## Part 2
- Menambahkan interaktivitas ke *stateful widget*.
- Membuat dan menavigasi ke layar kedua.
- Mengubah tampilan aplikasi menggunakan tema.
### Menambah icons pada list
1. Tambahkan `_saved` *Set* pada `RandomWordsState`. `Set` menyimpan pasangan kata yang disukai, 
   `Set` di implementasikan tanpa memungkinkan duplikat entri daripada `List`.
    ```
    class RandomWordsState extends State<RandomWords> {
        final List<WordPair> _suggestions = <WordPair>[];
        final Set<WordPair> _saved = Set<WordPair>();   // Tambah baris ini.
        final TextStyle _biggerFont = TextStyle(fontSize: 18.0);
        ...
    }
    ```
2. Pada `_buildRow` *function* tambahkan `alreadySaved` *check* untuk memastikan pasangan kata belum ditambahkan ke favorit.
   ```
    Widget _buildRow(WordPair pair) {
        final bool alreadySaved = _saved.contains(pair);  // Add this line.
        ...
    }
   ```
3. Pada `_buildRow()` tambahkan `heart-shaped icons` di `ListTile objects` untuk mengaktifkan favorit.
   ```
    Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
        // style ListTile
        return ListTile(
            title: Text(
            pair.asPascalCase,
            style: _biggerFont,
            ),
            // Tambah Icon Favorite
            trailing: Icon(   // Tambah baris ini... 
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
            ),                // ... sampai sini.
        );
    }
   ```
![List](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/iconlist.png)
### Menambah interaktivitas
1. Menambahkan kemampuan interaksi dengan *heart icons tappable*.
   Pengguna dapat mengetuk entri pada list untuk mengubah status tambah atau hapus dari favorit.
   Modifikasi `_buildRow` *function*
   ```
    Widget _buildRow(WordPair pair) {
        final alreadySaved = _saved.contains(pair);
        return ListTile(
            title: Text(
            pair.asPascalCase,
            style: _biggerFont,
            ),
            trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
            ),
            // cek pasangan kata tersimpan
            onTap: () {      // Tambah baris ini...
            setState(() {
                if (alreadySaved) {
                _saved.remove(pair);
                } else { 
                _saved.add(pair); 
                } 
            });
            },               // ... sampai sini.
        );
    }
   ```
![Interaktivitas](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/interaktivitas.png)
### Navigasi ke Layar Baru
1. Menambah halaman baru dan menavigasi diantara *home route* dan *new route*.
   Tambahkan *icon* dan *action* pada `build` *method*.
   ```
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text('Startup Name Generator'),
            actions: <Widget>[      // Tambah baris ini...
            // Icon list onpressed
            IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
            ],                      // ... sampai sini.
        ),
        body: _buildSuggestions(),
        );
    }
   ```
2. Tambahkan `_pushSaved()` *function* pada RandomWordsState
   ```
    void _pushSaved() {
    }
   ```
3. Panggil `Navigator.push` untuk *push route* ke *navigator stack*
   ```
    void _pushSaved() {
        // pindah route
        Navigator.of(context).push(
        );
    }
   ```
4. Tambahkan `MaterialPageRoute ` dan pembangunannya. Tambahkan *ListTile rows*.
   `divideTiles()` *method* dari ListTile menambahkan *horizontal spacing* diantara ListTile.
   `divided` *variable* dikonversi ke list dengan *convenience function*, toList().
   ```
    void _pushSaved() {
        Navigator.of(context).push(
            MaterialPageRoute<void>(   // Tambah baris ini...
            builder: (BuildContext context) {
                final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
                    return ListTile(
                    title: Text(
                        pair.asPascalCase,
                        style: _biggerFont,
                    ),
                    );
                },
                );
                final List<Widget> divided = ListTile
                .divideTiles(
                    context: context,
                    tiles: tiles,
                )
                .toList();
            },
            ),                       // ... sampai sini.
        );
    }
   ```
5. *Builder property* mengembalikan Scaffold untuk *new route* dengan nama "Saved Suggestions".
   *Body* terdiri dari `ListView` yang berisi  `ListTiles rows` dengan setiap baris dipisahkan oleh `divider`. 
   Tambahkan *horizontal dividers*
   ```
    void _pushSaved() {
        Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) {
                    // ...
                    return Scaffold(         // Tambah baris ini...
                        // appBar
                        appBar: AppBar(
                            title: Text('Saved Suggestions'),
                        ),
                        // body
                        body: ListView(children: divided),
                    );                       // ... sampai sini.
                },
            ),
        );
    }
   ```
![Navigasi](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/navigasi.png)
### Mengubah UI Menggunakan Tema
1. *theme* mengontrol tampilan aplikasi sesuai keinginan. Mengubah tema aplikasi dengan mengkonfigurasi `ThemeData class`.
   *default theme* mengubah *primary color* aplikasi menjadi putih.
   ```
    class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Startup Name Generator',
            theme: ThemeData(          // Tambah baris ini... 
                primaryColor: Colors.white,
            ),                         // ... sampai sini.
            home: RandomWords(),
            );
        }
    }
   ```
![Theme](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/images/theme.png)\
File [main_part2.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/kasus/main_part2.dart)

Sumber:\
[Write Your First Flutter App, part 1](https://flutter.dev/docs/get-started/codelab)\
[Write Your First Flutter App, part 2](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2/#0)