import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  get emailvalidate => null;

  void validate() {
    if (formkey.currentState!.validate()) {
      print("ok");
    } else {
      print("Error");
    }
  }

  String? emailvalid(value) {
    if (value.isEmpt) {
      return "Error";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("someapp"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: EmailValidator(errorText: "not valid"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required";
                      } else if (val.length < 6) {
                        return "at least 6 characters required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: validate,
                    child: Text("login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
