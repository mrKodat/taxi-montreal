import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountPageState();
  }
}

class AccountPageState extends State<AccountPage> {
  static final formKey = GlobalKey<FormState>();
  static TextEditingController controllerFirstName = TextEditingController();
  static TextEditingController controllerLastName = TextEditingController();
  static TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            maxLines: 1,
            controller: controllerFirstName,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'First Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return "First Name is Required";
              }
            },
          ),
          SizedBox(height: 20),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: 'Last Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Last Name is Required";
                }
              },
              controller: controllerLastName),
          SizedBox(height: 20),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                hintText: 'Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: phoneNumber),
        ],
      ),
    ));
  }
}
