import 'package:flutter/material.dart';

class LocationDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LocationDetailState();
  }
}

class LocationDetailState extends State<LocationDetail> {
  static final formKey = GlobalKey<FormState>();
  static TextEditingController controllerDate = TextEditingController();
  static TextEditingController controllerTime = TextEditingController();
  static TextEditingController controllerPickUpLocation =
      TextEditingController();
  static TextEditingController controllerDropOffLocation =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            maxLines: 1,
            controller: controllerDate,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.date_range,
                color: Colors.grey,
              ),
              hintText: 'Date',
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
                  Icons.date_range,
                  color: Colors.grey,
                ),
                hintText: 'Time',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Last Name is Required";
                }
              },
              controller: controllerTime),
          SizedBox(height: 20),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.map_outlined,
                  color: Colors.grey,
                ),
                hintText: 'Pick Up Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: controllerPickUpLocation),
          SizedBox(height: 20),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.map_rounded,
                  color: Colors.grey,
                ),
                hintText: 'Drop Of Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: controllerDropOffLocation),
        ],
      ),
    ));
  }
}
