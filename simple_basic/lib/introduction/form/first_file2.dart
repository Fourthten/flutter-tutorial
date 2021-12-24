import 'package:flutter/material.dart';

class FirstClass extends StatefulWidget{
  @override
  _FirstClassState createState() => new _FirstClassState();
}

class _FirstClassState extends State<FirstClass> {
  String maritalStatus = 'single';
  bool termsChecked = true;

  List<String> locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Center(child: Text('title'),),
        actions: <Widget>[
          Icon(Icons.settings)
        ],
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    maxLength: 20,
                    decoration: InputDecoration(labelText: 'Enter Name', hintText: 'Name'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Age', labelText: 'Enter Age'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password', labelText: 'Enter Password'
                    )
                  ),
                  DropdownButton(
                    hint: Text('Please choose the city you live in'),
                    items: locations.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    onChanged: (location){},
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Single'),
                          value: 'single',
                          groupValue: maritalStatus,
                          onChanged: (maritalStatus){},
                        )
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Married'),
                          value: 'married',
                          groupValue: maritalStatus,
                          onChanged: (maritalStatus){},
                        )
                      ),
                    ],
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: termsChecked,
                    title: new Text('Sign up for the newspaper and related articles'),
                    onChanged: (termsChecked){}
                  ),
                  new RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('Register'),
                    onPressed: thisFunct
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void thisFunct() {}
}