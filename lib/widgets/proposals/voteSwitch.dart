import 'package:flutter/material.dart';

class VoteSwitch extends StatefulWidget {
  const VoteSwitch({super.key});

  @override
  _VoteSwitchState createState() => _VoteSwitchState();
}

class _VoteSwitchState extends State<VoteSwitch> {
  bool switchState = false;

  // Function to handle switch state change
  // The newValue parameter comes from the onChanged void function below.
  // hover over "onChanged" to read more.
  void _handleSwitchChanged(bool newValue) {
    setState(() {
      switchState = newValue;
    });
    // Additional logic for when the switch changes
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: const Color.fromARGB(82, 0, 0, 0), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            "Cast Vote:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          const Text("Yes"),
          RotatedBox(
            quarterTurns: 3,
            child: Switch(
              value: switchState,
              onChanged: _handleSwitchChanged,
            ),
          ),
          const Text('No'),
        ],
      ),
    );
  }
}

class VoteSwitch2 extends StatefulWidget {
  const VoteSwitch2({super.key});

  @override
  _VoteSwitch2State createState() => _VoteSwitch2State();
}

class _VoteSwitch2State extends State<VoteSwitch2> {
  bool switchState = false;

  void _handleSwitchChanged(bool newValue) {
    setState(() {
      switchState = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: const Color.fromARGB(82, 0, 0, 0), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            "Cast Vote:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          const Text("Yes"),
          RotatedBox(
            quarterTurns: 3,
            child: Switch(
              value: switchState,
              onChanged: _handleSwitchChanged,
            ),
          ),
          const Text('No'),
        ],
      ),
    );
  }
}

class VoteSwitch3 extends StatefulWidget {
  const VoteSwitch3({super.key});

  @override
  _VoteSwitch3State createState() => _VoteSwitch3State();
}

class _VoteSwitch3State extends State<VoteSwitch3> {
  bool switchState = false;

  void _handleSwitchChanged(bool newValue) {
    setState(() {
      switchState = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: const Color.fromARGB(82, 0, 0, 0), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            "Cast Vote:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          const Text("Yes"),
          RotatedBox(
            quarterTurns: 3,
            child: Switch(
              value: switchState,
              onChanged: _handleSwitchChanged,
            ),
          ),
          const Text('No'),
        ],
      ),
    );
  }
}
