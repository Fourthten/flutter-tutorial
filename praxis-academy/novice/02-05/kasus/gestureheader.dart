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
        // Call Header
        child: Header(headerText)
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
        // SilverGrid dengan MaxCrossAxisExtent
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

class Header extends StatelessWidget{
  Header(this.headerText,{Key key,}) : super(key: key);

   final GlobalKey globalKey = new GlobalKey();

   final String headerText;
   
   void collaps(){
     Scrollable.ensureVisible(globalKey.currentContext);
   }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      key: globalKey,
      onTap: collaps,
      child: Container(
           color: Colors.lightBlue,
           child: Center(child:
            Text(headerText)
            )
      ),
    );
  }
}
