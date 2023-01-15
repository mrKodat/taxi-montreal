import 'package:flutter/material.dart';

class BookingDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookingDetailState();
  }
}

class BookingDetailState extends State<BookingDetail> {
  static final formKey = GlobalKey<FormState>();
  static TextEditingController controllerTypeOfCar = TextEditingController();
  static TextEditingController controllerPassenger = TextEditingController();
  static TextEditingController controllerLuggage = TextEditingController();
  static TextEditingController controllerCarSeat = TextEditingController();

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
            controller: controllerTypeOfCar,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.time_to_leave,
                color: Colors.grey,
              ),
              hintText: 'Type of Car',
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
                hintText: 'Passenger Count',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Last Name is Required";
                }
              },
              controller: controllerPassenger),
          SizedBox(height: 20),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.work,
                  color: Colors.grey,
                ),
                hintText: 'Luggage Count',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: controllerLuggage),
          SizedBox(height: 20),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.airline_seat_recline_extra,
                  color: Colors.grey,
                ),
                hintText: 'Car Seat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: controllerCarSeat),
        ],
      ),
    ));
  }
}
