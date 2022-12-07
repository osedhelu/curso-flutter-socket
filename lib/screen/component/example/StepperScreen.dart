// ignore: file_names
import 'package:flutter/material.dart';

class StepperScreen extends StatelessWidget {
  const StepperScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const BodyStepper(),
    );
  }
}

class BodyStepper extends StatefulWidget {
  const BodyStepper({super.key});

  @override
  State<BodyStepper> createState() => _BodyStepperState();
}

class _BodyStepperState extends State<BodyStepper> {
  int curretStep = 0;

  void onStepContinue() {
    if (curretStep < 2) {
      setState(() {
        curretStep += 1;
      });
    }
  }

  void onStepCancel() {
    if (curretStep > 0) {
      setState(() {
        curretStep -= 1;
      });
    }
  }

  void onStepTapped(int value) {
    setState(() {
      curretStep = value;
    });
  }

  Widget controlsBuilder(BuildContext context, ControlsDetails details) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: details.onStepContinue, child: const Text("Siguiente")),
        const SizedBox(
          width: 10,
        ),
        OutlinedButton(
            onPressed: details.onStepCancel, child: const Text("Atras"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Stepper")),
      body: Stepper(
        elevation: 0,
        type: StepperType.horizontal,
        physics: const ClampingScrollPhysics(),
        currentStep: curretStep,
        onStepContinue: onStepContinue,
        onStepCancel: onStepCancel,
        onStepTapped: onStepTapped,
        controlsBuilder: controlsBuilder,
        steps: <Step>[
          Step(
              isActive: curretStep >= 0,
              title: const Text("Step 1"),
              content: Column(
                children: const <Widget>[
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                  Text("Step 1 mundo Description"),
                ],
              ),
              state: curretStep >= 0 ? StepState.complete : StepState.disabled),
          Step(
              isActive: curretStep >= 1,
              title: const Text("Step 2"),
              content: const Text("Step 2 mundo Description"),
              state: curretStep >= 1 ? StepState.complete : StepState.disabled),
          Step(
              isActive: curretStep >= 2,
              title: const Text("Step 3"),
              content: const Text("step 3 mundo Description"),
              state: curretStep >= 2 ? StepState.complete : StepState.disabled),
        ],
      ),
    );
  }
}
