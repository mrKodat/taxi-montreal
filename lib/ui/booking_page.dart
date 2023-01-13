import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:taxi/ui/widget/account_page.dart';
import 'package:taxi/ui/widget/booking_detail.dart';
import 'package:taxi/ui/widget/location_page.dart';
import 'package:taxi/ui/widget/upload.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

int _index = 0;

class _BookingPageState extends State<BookingPage> {
  var currentStep = 0;
  @override
  Widget build(BuildContext context) {
    var mapData = HashMap<String, String>();
    mapData["first_name"] = AccountPageState.controllerFirstName.text;
    mapData["last_name"] = AccountPageState.controllerLastName.text;
    mapData["phone"] = AccountPageState.phoneNumber.text;
    mapData["type_of_car"] = BookingDetailState.controllerTypeOfCar.text;
    mapData["passenger"] = BookingDetailState.controllerPassenger.text;
    mapData["luggage"] = BookingDetailState.controllerLuggage.text;
    mapData["car_seat"] = BookingDetailState.controllerCarSeat.text;
    mapData["date"] = LocationDetailState.controllerDate.text;
    mapData["time"] = LocationDetailState.controllerTime.text;
    mapData["pick_up_location"] =
        LocationDetailState.controllerPickUpLocation.text;
    mapData["drop_of_location"] =
        LocationDetailState.controllerDropOffLocation.text;

    List<Step> steps = [
      Step(
        title: Text('Personal'),
        content: AccountPage(),
        state: currentStep == 0 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: Text('Location'),
        content: LocationDetail(),
        state: currentStep == 1 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: Text('Booking'),
        content: BookingDetail(),
        state: currentStep == 2 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            FlutterIcons.keyboard_backspace_mdi,
            color: Color.fromRGBO(33, 45, 82, 1),
          ),
        ),
        title: Text(
          "BOOK NOW",
          style: TextStyle(
            color: Color.fromRGBO(33, 45, 82, 1),
          ),
        ),
      ),
      body: Container(
        child: Stepper(
          currentStep: this.currentStep,
          steps: steps,
          type: StepperType.horizontal,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < steps.length - 1) {
                if (currentStep == 0 ||
                    AccountPageState.formKey.currentState!.validate()) {
                  currentStep = currentStep + 1;
                } else if (currentStep == 1 ||
                    LocationDetailState.formKey.currentState!.validate()) {
                  currentStep = currentStep + 1;
                } else if (currentStep == 1 ||
                    BookingDetailState.formKey.currentState!.validate()) {
                  currentStep = currentStep + 1;
                }
              } else {
                currentStep = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
            });
          },
        ),
      ),
    );
  }
}
