### ListView dengan JSON atau List Data
File [listview.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-02/kasus/listview.dart)\
runApp call widget HomePage berisi state HomePageState. Di dalamnya memiliki Scaffold dengan ListView yang menampilkan Card. 
`http.get(Uri.encodeFull())` untuk mendapatkan data dari url, nantinya akan di decode dengan `json.decode` yang akan ditampilkan pada Card.\
![listview](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-02/kasus/images/listjson.PNG)
### TodoList dengan JSON List Data
File [listtodo.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-02/kasus/listtodo.dart)\
File sama seperti sebelumnya ditambah beberapa fitur. `alertTodoItem` untuk menampilkan pop up alert add/remove. 
`addItem` untuk menambahkan Card pada list. Pada aplikasi ini menggunakan array index untuk menyimpan data list yang ditambahkan. 
HomePage menampilkan data JSON yang belum di tambahkan pada list page. 
Widget ListPage memiliki ListPageState untuk menampilkan list data yang telah ditambahkan.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-02/kasus/record/todolist.gif" width="300">

Sumber:\
[JSON and serialization](https://flutter.dev/docs/development/data-and-backend/json)\
[Simple JSON with Flutter](https://flutter.institute/simple-json-with-flutter/)\
[ListView with JSON or List Data](https://kodestat.gitbook.io/flutter/flutter-listview-with-json-or-list-data)