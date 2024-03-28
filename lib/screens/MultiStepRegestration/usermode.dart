import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';

class UserModal extends ChangeNotifier {
  String? name;
  String? email;
  String? password;
  String? education;

  int activeIndex = 0;
  int totalIndex = 3;

  changeStep(int index) {
    activeIndex = index;
    notifyListeners();
  }
}

 class MultiPageProvider extends StatefulWidget {
  const MultiPageProvider({Key? key}) : super(key: key);

  @override
  _MultiPageProviderState createState() => _MultiPageProviderState();
}

class _MultiPageProviderState extends State<MultiPageProvider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModal>(
      create: (context) => UserModal(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Using Provider",
          ),
        ),
        body: Consumer<UserModal>(
          builder: (context, modal, child) {
            switch (modal.activeIndex) {
              case 0:
                return const BasicDetails();
              case 1:
                return const EducationDetails();
              case 2:
                return const Details();
              default:
                return const BasicDetails();
            }
          },
        ),
      ),
    );
  }
}

class BasicDetails extends StatefulWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  GlobalKey<FormState> basicFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModal>(builder: (context, modal, child) {
      return Form(
        key: basicFormKey,
        child: ListView(
          padding: const EdgeInsets.all(
            12.0,
          ),
          children: [
            Center(
              child: DotStepper(
                activeStep: modal.activeIndex,
                dotRadius: 20.0,
                shape: Shape.pipe,
                spacing: 10.0,
              ),
            ),
            Text(
              "Step ${modal.activeIndex + 1} of ${modal.totalIndex}",
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
                  ),
                  emailValidator(
                    errorText: "Not Valid Email",
                  ),
                ])),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Passoword",
              ),
              validator: minLengthValidator(
                6,
                errorText: "Min 6 characters required",
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "phone",
              ),
              validator: minLengthValidator(
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
                    modal.changeStep(1);
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
    });
  }

  requiredValidator({required String errorText}) {}

  minLengthValidator(int i, {required String errorText}) {}

  multiValidator(List list) {}

  emailValidator({required String errorText}) {}
}

class EducationDetails extends StatelessWidget {
  const EducationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModal>(builder: (context, modal, child) {
      return ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Center(
            child: DotStepper(
              activeStep: modal.activeIndex,
              dotRadius: 20.0,
              shape: Shape.pipe,
              spacing: 10.0,
            ),
          ),
          Text(
            "Step ${modal.activeIndex + 1} of ${modal.totalIndex}",
            style: const TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          buildTextFormField("height"),

          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "wieght",
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
    });
  }



  TextFormField buildTextFormField(label) {
    return TextFormField(
          decoration:  InputDecoration(
            labelText: label,
          ),
          validator: requiredValidator(
            errorText: "Required *",
          ),
        );
  }

  requiredValidator({required String errorText}) {}
}
class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModal>(builder: (context, modal, child) {
      return ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Center(
            child: DotStepper(
              activeStep: modal.activeIndex,
              dotRadius: 20.0,
              shape: Shape.pipe,
              spacing: 10.0,
            ),
          ),
          Text(
            "Step ${modal.activeIndex + 1} of ${modal.totalIndex}",
            style: const TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          buildTextFormField("height"),

          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "wieght",
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
    });
  }



  TextFormField buildTextFormField(label) {
    return TextFormField(
      decoration:  InputDecoration(
        labelText: label,
      ),
      validator: requiredValidator(
        errorText: "Required *",
      ),
    );
  }

  requiredValidator({required String errorText}) {}
}

