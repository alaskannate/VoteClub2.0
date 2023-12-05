import 'package:flutter/material.dart';

class CustomButtonNude extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const CustomButtonNude(
      {super.key,
      required this.label,
      required this.onPressed,
      this.icon,
      this.backgroundColor = const Color.fromARGB(0, 33, 149, 243)});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    // If icon is not null, add it to the children list
    if (icon != null) {
      children.add(
          Icon(icon, color: Colors.black)); // Customize your icon style here
      // Add spacing between icon and text if both are present
      if (label != null) children.add(const SizedBox(width: 8));
    }

    // If label is not null, add it to the children list
    if (label != null) {
      children.add(Text(
        label!,
        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ));
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // To wrap content
          children: children,
        ),
      ),
    );
  }
}

//  CUSTOM STATEFUL BUTTON

double metric = 0;

class CustomStatefulButtonNude extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;

  const CustomStatefulButtonNude(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon});

  @override
  State<CustomStatefulButtonNude> createState() =>
      _CustomStatefulButtonNudeState();
}

class _CustomStatefulButtonNudeState extends State<CustomStatefulButtonNude> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.abc_outlined),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              metric += 10;
            });
          },
        ),
        Text('Metric : $metric'),
      ],
    );
  }
}
