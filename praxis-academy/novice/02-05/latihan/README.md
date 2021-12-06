### Sliver
Sliver merupakan bagian dari area scrollable untuk mendapatkan efek custom scrolling.
- SliverList mengambil parameter delegasi yang menyediakan item list pada scrollview. 
Dapat menentukan aktual list dari children dengan SliverChildListDelegate atau SliverChildBuilderDelegate (simple).
- SliverGrids dapat menentukan children dengan delegasi atau daftar eksplisit seperti SliverList. 
Ada format tambahan untuk dimensi cross-axis pada grid. 
Custom grid layout :
1. Count constructor menghitung berapa banyak item dalam case pada horizontal axis.
   `SliverGrid.count(children: scrollItems, crossAxisCount: 4)`
2. Extent constructor untuk menentukan maximum width untuk grid pada item. 
   Berguna jika ukuran item di grid bervariasi yang dapat membatasi berapa besar ruang yang harus dipakai secara horizontal. 
   `SliverGrid.extent(children: scrollItems, maxCrossAxisExtent: 90.0) // 90 logical pixels`
3. Default constructor meneruskan parameter gridDelegate eksplisit.
   ```
   // Re-implementing the above SliverGrid.count example:
    SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
    ),
    delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
        return new Container(
            color: randomColor(),
            height: 150.0);
        }
    );
   ```
- SliverAppBar\
  Mengatur height dan appearance saat diperluas ke ukuran penuh atau 
  versi 'compressed' dengan mengatur parameter flexibleSpace dan expandedHeight. 
  Pada SliverAppBar dapat mengatur parameter floating untuk membuat appbar muncul kembali 
  saat scroll ke bawah bahkan saat belum mencapai bagian atas daftar. 
  Jika menambahkan parameter snap dan floating dapat membuat appbar kembali ke tampilan saat di scroll ke bawah. 
### Menyatukan Semua: collapsible scrolling list dengan SliverPersistentHeader
Terdiri dari 4 header yang berisi SliverGrid(Header 1), SliverFixedExtentList(Header 2), 
SliverGrid dengan MaxCrossAxisExtent(Header 3), SliverList(Header 4). 
Saat di scroll ke bawah maka isi header di atasnya akan tertutup namun header tetap muncul.
```
// import package
import 'package:flutter/material.dart';
import 'dart:math' as math;

// run App
void main() => runApp(MyApp());

// Widget MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // appBar dan Body
      home: Scaffold(
        appBar: AppBar(
            // title
            title: Text('Collapsing List Demo')),
        // call CollapsingList
        body: CollapsingList(),
      ),
    );
  }
}

// _SliverAppBarDelegate
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  // constructor
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  // get minExtent
  @override
  double get minExtent => minHeight;

  // get maxExtent
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  // size child
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  // cek delegasi dengan yang lama sama atau tidak dan rebuild
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

// Widget CollapsingList
class CollapsingList extends StatelessWidget {
  // SliverPersistentHeader
  SliverPersistentHeader makeHeader(String headerText) {
    // app bar
    return SliverPersistentHeader(
      pinned: true, // posisi appbar tetap muncul (true)
      // call _SliverAppBarDelegate
      delegate: _SliverAppBarDelegate(
        // min max height appbar
        minHeight: 60.0,
        maxHeight: 200.0,
        // Container style
        child: Container(
            color: Colors.lightBlue, 
            child: Center(child: Text(headerText))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Body
    return CustomScrollView(
      // List widget sliver pada scroll view
      slivers: <Widget>[
        // SliverGrid
        makeHeader('Header Section 1'),
        SliverGrid.count(
          // jumlah grid horizontal = 3
          crossAxisCount: 3,
          // child grid widget
          children: [
            Container(color: Colors.red, height: 150.0),
            Container(color: Colors.purple, height: 150.0),
            Container(color: Colors.green, height: 150.0),
            Container(color: Colors.orange, height: 150.0),
            Container(color: Colors.yellow, height: 150.0),
            Container(color: Colors.pink, height: 150.0),
            Container(color: Colors.cyan, height: 150.0),
            Container(color: Colors.indigo, height: 150.0),
            Container(color: Colors.blue, height: 150.0),
          ],
        ),
        // SliverFixedExtentList
        makeHeader('Header Section 2'),
        SliverFixedExtentList(
          // height item
          itemExtent: 150.0,
          // delegasi mengontrol transformasi matriks dari children
          delegate: SliverChildListDelegate(
          // child list
            [
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
            ],
          ),
        ),
        // SliverGrid dengan MaxCrossAxisExtent
        makeHeader('Header Section 3'),
        SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            // max crossaxis (ukuran area)
            maxCrossAxisExtent: 150.0,
            // spacing mainaxis (margin vertikal)
            mainAxisSpacing: 10.0,
            // spacing crossaxis (margin horizontal)
            crossAxisSpacing: 10.0,
            // ratio child (height item)
            childAspectRatio: 4.0,
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              // style container
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: new Text('grid item $index'),
              );
            },
            // jumlah child
            childCount: 20,
          ),
        ),
        // SliverList
        makeHeader('Header Section 4'),
        // Ini bisa menjadi SliverFixedExtentList.
        // ini contoh dari SliverList construction.
        SliverList(
          delegate: SliverChildListDelegate(
          // child list
            [
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
            ],
          ),
        ),
      ],
    );
  }
}
```
File contoh [collapscroll.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-05/latihan/collapscroll.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-05/latihan/record/getitall.gif" width="300">

Sumber:\
[Sliver Demystified](https://medium.com/flutter/slivers-demystified-6ff68ab0296f)