## Pengenalan Widget
Widget menggambarkan tampilan aplikasi yang diberikan konfigurasi dan status saat ini.
Widget digunakan untuk mengontrol *interface* aplikasi.
### Hello World
```
import 'package:flutter/material.dart';
void main() {
  runApp(
    Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```
![HelloWorld](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/images/Helloworld.PNG)
### Basic Widgets
Basic yaitu Text, Row, Column, Stack, Container.
```
import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  // Fields di Widget subclass selalu memakai "final".
  final Widget title;
  @override
  Widget build(BuildContext context) {
    // Header
    return Container(
      // Tinggi Container 56px
      height: 56.0, // logical pixels
      // Padding 8px kiri kanan
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row adalah flex widget horizontal dengan tata letak linear.
      child: Row(
        // <Widget> adalah tipe dari item pada list.
        children: <Widget>[
          // Icons Menu
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded memperluas child untuk mengisi ruang tersedia.
          Expanded(
            child: title,
          ),
          // Icons Search
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material adalah kertas konseptual dimana UI muncul.
    return Material(
      // Column adalah flex widget vertical dengan tata letak linear.
      child: Column(
        children: <Widget>[
          MyAppBar(
            // Text widget untuk membuat style text.
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
```
Widget Stack menempatkan widget diatas satu sama lain dalam urutan.
Posisi widget pada children dari Stack untuk memposisikan relatif ke atas, kanan, bawah, atau kiri.
Stack berdasarkan posisi tata letak absolut web.
Widget Container membuat element visual rectangular. Container dapat di dekorasi dengan 
BoxDecoration seperti background, border, shadow. Container memiliki margin, padding dan constraint sesuai ukuran.
Container dapat ditransformasikan dalam ruang 3 dimensi dengan matriks.
Konfigurasi `uses-material-design: true` untuk menggunakan Material Icons.\
![Basic](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/images/Basic.PNG)
### Material Components
Flutter menyediakan widget untuk membuat aplikasi mengikuti Material Design. 
Material app membangun widget di root aplikasi maupun navigator yang mengelola widget dengan identifikasi string atau dikenal `routes`.
Navigator memungkinkan melakukan transisi diantara layar aplikasi.
Kode beralih dari MyAppBar dan MyScaffold ke AppBar dan Scaffold widget dan menambahkan floating action button.

```
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}
class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai layout untuk Material Components utama.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body
      body: Center(
        child: Text('Hello, world!'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // digunakan oleh teknologi assistive
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
```
![Material](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/images/MaterialDesign.PNG)
### Menangani gestures
Aplikasi menyertakan beberapa interaksi pengguna dengan sistem dengan mendeteksi gesture input.
```
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}
```
Widget GestureDetector mendeteksi gesture yang dibuat pengguna.
GestureDetector memanggil onTap() callback lalu mencetak pesan di console
untuk mendeteksi input gestures seperti tap, drag, scale.
Banyak widget menggunakan GestureDetector untuk memberikan callback widget lain 
seperti IconButton, RaisedButton, FloatingActionButton yang memiliki `onPressed()` callback yang dipicu oleh pengguna.\
![Gesture](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/images/Gesture.PNG)
### Mengubah widget sebagai respon input
Widget stateless menerima argument dari parent widget yang disimpan dalan final variabel. 
Saat widget diminta untuk `build()`, widget menggunakan nilai tersimpan untuk memperoleh argument baru untuk widget yang dibuat.
StatefulWidgets adalah widget khusus untuk bereaksi dengan cara yang menarik pada input pengguna dengan membuat objek State 
kemudian digunakan untuk menahan state, contohnya RaisedButton.
```
class Counter extends StatefulWidget {
  // Konfigurasi state yang menyimpan nilai yang disediakan parnt dan digunakan oleh build
  // method dari state. Fields subclass selalu memakai "final".
  @override
  _CounterState createState() => _CounterState();
}
class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      // Panggilan ke setState memberi tahu Flutter framework sesuatu berubah di State ini
      // yang menjalankan kembali build method sehingga tampilan mencerminkan perubahan value.
      // Jika merubah _counter tanpa panggil setState() maka build method tidak dipanggil dan tidak ada yang terjadi.
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    // method menjalankan kembali setiap setState di panggil,
    // seperti _increment method above. Flutter framework menjalankan build methods 
    // kembali dengan cepat, sehingga membangun kembali apapun
    // perlu pembaharuan daripada berubah secara individual seperti widget
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
        Text('Count: $_counter'),
      ],
    );
  }
}
```
StatefulWidget dan State adalah objek terpisah. 
Widget adalah objek sementara untuk presentasi aplikasi saat ini.
State objek call build() untuk mengingat informasi.
Membuat 2 new StatelessWidget untuk menampilkan dan menghitung counter.
```
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}
class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}
class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      ++_counter;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      CounterIncrementor(onPressed: _increment),
      CounterDisplay(count: _counter),
    ]);
  }
}
```
![Counter](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/images/Counter.PNG)\
File [main_latihan1.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/main_latihan1.dart)
### Menyatukan Semua
Contoh konsep menyatukan semua
```
import 'package:flutter/material.dart';
class Product {
  const Product({this.name});
  final String name;
}
typedef void CartChangedCallback(Product product, bool inCart);
class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: ObjectKey(product));
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;
  Color _getColor(BuildContext context) {
    // Tema tergantung BuildContext yang mengindikasi dimana build ditaruh karena tema digunakan.
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }
  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}
class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);
  final List<Product> products;
  // Framework memanggil createState widget pertama kali
  // jika parent membangun kembali dan menggunakan tipe
  // widget yang sama, framework menggunakan kembali State object
  // tanpa membuat State object baru.
  @override
  _ShoppingListState createState() => _ShoppingListState();
}
class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();
  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // Ketika pengguna mengubah cart, perlu merubah
      // _shoppingCart ke dalam setState call untuk memicu rebuild.
      // Framework lalu memanggil build di bawah yang memperbaharui tampilan aplikasi.
      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
        // List Product
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}
```
![GetitAll](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/images/GetitAll.PNG)\
File [main_latihan2.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/main_latihan2.dart)
### Menanggapi event siklus hidup widget
Subclass state dapat menggantikan initState untuk melakukan pekerjaan yang terjadi sekali. 
Implementasi `initState` diperlukan untuk memanggil `super.initState`.
Ketika objek state tidak diperlukan, framework memanggil `dispose()` pada objek state.
Implementasi `dispose` biasanya diakhiri dengan memanggil `super.dispose`.
### Key
Gunakan key untuk mengontrol widget yang cocok dengan framework saat widget dibangun kembali.
Dengan key, framework membutuhkan 2 widget memiliki key dan runtimeType yang sama.
### Global Key
Global key mengidentifikasi child widget. Global key harus unik secara global di seluruh widget dan dapat 
digunakan untuk mengambil state yang terkait dengan widget.
## Layout
Digunakan untuk tata letak widget.
1. Pilih [layout widget](https://flutter.dev/docs/development/ui/widgets/layout). 
2. Buat visible widget.\
    Text
    ```
    Text('Hello World'),
    ```
    Image
    ```
    Image.asset(
      'images/lake.jpg',
      fit: BoxFit.cover,
    ),
    ```
    Icon
    ```
    Icon(
      Icons.star,
      color: Colors.red[500],
    ),
    ```
3. Tambah visible widget ke layout widget. 
child untuk single widget, contoh center atau container. 
children untuk list widget, contoh row, column, listview, stack.
    ```
    Center(
      child: Text('Hello World'),
    ),
    ```
4. Tambah layout widget ke halaman.\
   Material App untuk menggunakan widget Scaffold yang menyediakan banner, background color, API untuk drawer, snackbar, bottom sheet.
   ```
   class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Flutter layout demo',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter layout demo'),
            ),
            body: Center(
              child: Text('Hello World'),
            ),
          ),
        );
      }
    }
   ```
   Non-Material App tidak menyediakan appBar, title, background color.
   ```
   class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: Text(
              'Hello World',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 32,
                color: Colors.black87,
              ),
            ),
          ),
        );
      }
    }
   ```
`Row` untuk layout horizontal. `Column` untuk layout vertical. `mainAxisAlignment` untuk layout horizontal (row) dan vertical (column). 
`crossAxisAlignment ` untuk layout vertical (row) dan horizontal (column).\
Sizing widget untuk fit row atau column menggunakan widget expanded. 
Flex pada widget expanded untuk mengatur ukuran ruang. Default flex 1,
```
Expanded(
  flex: 2,
  child: Image.asset('images/pic2.jpg'),
),
```
Packing widget menggunakan `MainAxisSize.min`.\
Contoh Nested row dan column:
```
var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
  ],
);

final ratings = Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
  ),
);
```
Layout widget umum:
- Standard widget terdiri dari Container, GridView, ListView, Stack.
- Material widget (khusus) terdiri dari Card, ListTile.
## Menambahkan Interaktivitas
Widget stateless tidak pernah berubah. Icon, IconButton, dan Text adalah contoh stateless widget. 
Widget stateful bersifat dinamis yang dapat mengubah tampilannya sebagai respons dari peristiwa yang dipicu oleh interaksi pengguna atau ketika menerima data. 
Checkbox, Radio, Slider, InkWell, Form, dan TextField adalah contoh widget stateful.
State widget disimpan dalam objek State, memisahkan state widget dari penampilannya. 
State terdiri dari nilai yang dapat berubah, seperti nilai slider saat ini atau apakah checkbox dicentang. 
Saat state widget berubah, objek state memanggil setState(), memberi tahu framework untuk menggambar ulang widget.
### Membuat stateful widget
Menerapkan stateful widget membutuhkan 2 kelas:
- Subclass StatefulWidget yang mendefinisikan widget itu.
- Subclass State yang berisi state untuk widget itu dan mendefinisikan metode build().
```
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
```
File [example_stateful.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/example_stateful.dart)\
![Stateful](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/images/stateful.PNG)
### Manage state
1. Widget mengelola state sendiri
Listview otomatis scroll ketika isi melebihi render box.
```
// TapboxA manages its own state.
//------------------------- TapboxA ----------------------------------
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
```
File [ownstate.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/ownstate.dart)\
2. Parent widget mengelola widget state
```
// ParentWidget manages the state for TapboxB.
//------------------------ ParentWidget --------------------------------
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}
//------------------------- TapboxB ----------------------------------
class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
```
File [parentwidget.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/parentwidget.dart)\
app state sendiri dan parent widget:

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/record/ownstate.gif" width="300">

3. Pendekatan mix-and-match
```
//---------------------------- ParentWidget ----------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.
    return GestureDetector(
      onTapDown: _handleTapDown, // Handle the tap events in the order that
      onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color:
              widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
```
File [mixandmatch.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/mixandmatch.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/latihan/record/mixandmatch.gif" width="300">

### Widget interaktif lainnya
Flutter menawarkan berbagai tombol dan widget interaktif serupa. 
Gunakan GestureDetector untuk membangun interaktivitas ke widget khusus apa pun.

Sumber:\
[Introduction to Widget](https://flutter.dev/docs/development/ui/widgets-intro)\
[Layout in Flutter](https://flutter.dev/docs/development/ui/layout)\
[Adding Interactivity](https://flutter.dev/docs/development/ui/interactive)