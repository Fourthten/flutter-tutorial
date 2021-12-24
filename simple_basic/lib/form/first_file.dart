import 'package:flutter/material.dart';

class FirstClass extends StatefulWidget{
  @override
  _FirstClassState createState() => new _FirstClassState();
}

class _FirstClassState extends State<FirstClass> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  int age = 0;
  String password = '';
  String maritalStatus = 'single';
  bool termsChecked = true;

  List<String> locations = ['A', 'B', 'C', 'D'];
  String selectedLocation = '';

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
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Enter Name', hintText: 'Name'),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter a name';
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        name = value.toString();
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Age', labelText: 'Enter Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value != null && value.isEmpty) return 'Please enter age';
                    },
                    onSaved: (value) {
                      setState(() {
                        age = int.tryParse(value.toString()) ?? 0;
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password', labelText: 'Enter Password'
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) return 'Please enter a name';
                      if (value != null && value.length < 8) return 'Password should be more than 8 characters';
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value.toString();
                      });
                    },
                  ),
                  DropdownButton(
                    hint: Text('Please choose the city you live in'),
                    items: locations.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    onChanged: (newValue){
                      setState(() {
                        selectedLocation = newValue.toString();
                      });
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Single'),
                          value: 'single',
                          groupValue: maritalStatus,
                          onChanged: (value){
                            setState(() {
                              maritalStatus = value.toString();
                            });
                          },
                        )
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Married'),
                          value: 'married',
                          groupValue: maritalStatus,
                          onChanged: (value){
                            setState(() {
                              maritalStatus = value.toString();
                            });
                          },
                        )
                      ),
                    ],
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: termsChecked,
                    title: new Text('Sign up for the newspaper and related articles'),
                    onChanged: (value){
                      setState(() {
                        termsChecked = value ?? true;
                      });
                    },
                  ),
                  new RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('Register'),
                    onPressed: (){
                      onPressedSubmit(context);
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPressedSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print("Name " + name);
      print("Age " + age.toString());
      print("City " + selectedLocation);
      print("Marital Status " + maritalStatus);
      print("Password " + password);
      print("Termschecked " + termsChecked.toString());
    }
  }
}