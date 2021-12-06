import 'dart:convert';
import 'dart:io';

main() async {
  await getContent();
}

Future<void> getContent(){
  var content = new HttpClient().getUrl(Uri.parse('https://jsonplaceholder.typicode.com/users'))
    .then((HttpClientRequest request) => request.close())
    // .then((HttpClientResponse response) => response.transform(new Utf8Decoder()).listen(print));
    .then((HttpClientResponse response) => response.pipe(new File('read.txt').openWrite()))
    .then((r) => print('Copy Success'));

  return content;
}