import 'package:flutter/material.dart';

class FormTest extends StatefulWidget {
  @override
  _FormTestState createState() => _FormTestState();
}

class _FormTestState extends State<FormTest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;

  Widget _buildNameField() {
    return TextFormField(
        maxLength: 20,
        decoration: InputDecoration(hintText: 'Name'),
        maxLines: 1,
        validator: (text) {
          if (text.isEmpty) {
            return 'Name cannot be empty';
          }
          return null;
        },
        onSaved: (text) {
          _name = text;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form - Tutorial 14'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                _buildNameField(),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: RaisedButton(
                    child: Text('Save'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print(_name);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
