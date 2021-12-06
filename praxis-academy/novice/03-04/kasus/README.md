### Aksesibilatas Scanner
1. Aplikasi [Baby Names](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-03/latihan)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/kasus/images/babynames.png" width="500">

Di aplikasi ini tidak ada sugesti atau tampilan yang harus diperbaiki.

2. Aplikasi [Weather Business Logic Component](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-01/latihan)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/kasus/images/weather.png" width="500">

Terdapat saran memperbaiki item label dan text contrast. Tambahkan label text dan ganti warna pada text input maupun border.
```
decoration: InputDecoration(
  hintText: "Enter a city",
  labelText: "Enter a city",
  focusedBorder: OutlineInputBorder(
	borderSide: BorderSide(color: Colors.black, width: 2.0),
	borderRadius: BorderRadius.circular(12)
  ),
  enabledBorder: OutlineInputBorder(
	borderSide: BorderSide(color: Colors.black, width: 2.0),
	borderRadius: BorderRadius.circular(12)
  ),
  suffixIcon: Icon(Icons.search),
  labelStyle: TextStyle(
	color: Colors.black,
	fontSize: 18.0
  ),
),
```
3. Aplikasi [Navigasi layar baru dan kembali](https://github.com/Fourthten/praxis-academy/tree/master/novice/02-03/latihan)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/kasus/images/navigator.png" width="250">

Terdapat saran memperbaiki text contrast. Perbaiki dengan ganti warna icon,
```
appBar: AppBar(
	iconTheme: IconThemeData(
	  color: Colors.black, //change your color here
	),
	title: Text("Second Route"),
),
```
4. Aplikasi [Provider Counter](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-01/latihan)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/kasus/images/floatingbutton.png" width="250">

Terdapat saran memperbaiki text contrast. Perbaiki dengan ganti warna icon,
```
child: new IconTheme(
	data: new IconThemeData(
	  color: Colors.black), 
	child: new Icon(Icons.add),
),
backgroundColor: Colors.grey[200],
```