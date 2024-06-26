import 'package:flutter/material.dart';
//import 'package:form_field_validator/form_field_validator.dart';
import 'package:im_stepper/stepper.dart';
import 'package:multi_validator/multi_validator.dart';

class MultiPageBasic extends StatefulWidget {
  const MultiPageBasic({Key? key}) : super(key: key);

  @override
  _MultiPageBasicState createState() => _MultiPageBasicState();
}

class _MultiPageBasicState extends State<MultiPageBasic> {
  //
  GlobalKey<FormState> basicFormKey = GlobalKey<FormState>();

  int activeIndex = 0;
  int totalIndex = 2;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (activeIndex != 0) {
          activeIndex--;
          setState(() {});
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Basic Multi Step",
          ),
        ),
        //
        body: bodyBuilder(),
      ),
    );
  }

  Widget bodyBuilder() {
    switch (activeIndex) {
      case 0:
        return basicDetails();
      case 1:
        return educationDetails();

      default:
        return basicDetails();
    }
  }

  Widget basicDetails() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Center(
            child: DotStepper(
              activeStep: activeIndex,
              dotRadius: 20.0,
              shape: Shape.pipe,
              spacing: 10.0,
            ),
          ),
          Text(
            "Step ${activeIndex + 1} of $totalIndex",
            style: const TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Name",
            ),
            validator: requiredValidator(
              errorText: "Required *",
            ),
          ),
          TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              validator: multiValidator([
                requiredValidator(
                  errorText: "Required *",
                ), emailValidator(
                  errorText: "Not Valid Email",
                ),
              ])),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Passoword",
            ),
            validator: inLengthValidator(
              6,
              errorText: "Min 6 characters required",
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if (basicFormKey.currentState?.validate() ?? false) {
                  // next
                  setState(() {
                    activeIndex++;
                  });
                }
              },
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget educationDetails() {
    return ListView(
      padding: const EdgeInsets.all(
        12.0,
      ),
      children: [
        Center(
          child: DotStepper(
            activeStep: activeIndex,
            dotRadius: 20.0,
            shape: Shape.pipe,
            spacing: 10.0,
          ),
        ),
        Text(
          "Step ${activeIndex + 1} of $totalIndex",
          style: const TextStyle(
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Name",
          ),
          validator: requiredValidator(
            errorText: "Required *",
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        SizedBox(
          height: 40.0,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Register",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  requiredValidator({required String errorText}) {}

  multiValidator(List list) {}

  inLengthValidator(int i, {required String errorText}) {}

  emailValidator({required String errorText}) {}
}
