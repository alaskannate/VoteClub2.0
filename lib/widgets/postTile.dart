import 'package:flutter/material.dart';

class PostTile extends StatefulWidget {
  final String postName;
  final String details;
  final bool isSwitchOn;
  final ValueChanged<bool> onSwitchChanged;

  const PostTile({
    super.key,
    required this.postName,
    required this.details,
    required this.isSwitchOn,
    required this.onSwitchChanged,
  });

  @override
  State<PostTile> createState() {
    return _PostTileState();
  }
  // @override
  // _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  late bool switchState;

  @override
  void initState() {
    super.initState();
    switchState = widget.isSwitchOn;
  }

  void _handleSwitchChanged(bool newValue) {
    setState(() {
      switchState = newValue;
    });
    widget.onSwitchChanged(
        newValue); // Ensure this callback is correctly implemented
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        shape: CustomCardShape(
            cutHeight: 185, cutWidth: 105), // Use the custom card shape here
        surfaceTintColor: Colors.transparent,
        elevation: 4.0,
        child: Stack(
          children: [
            Container(
              width: 300,
              height: 300,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white, // Optional: set a background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  // Bottom right is not rounded due to the cutout
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.postName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(widget.details),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15.0, // Align with the cutout
              right: 20.0, // Align with the cutout
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: const Color.fromARGB(82, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Cast Value:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCardShape extends ShapeBorder {
  final double cutWidth;
  final double cutHeight;

  CustomCardShape({this.cutWidth = 40.0, this.cutHeight = 80.0});

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.bottom - cutHeight)
      ..lineTo(rect.right - cutWidth, rect.bottom - cutHeight)
      ..lineTo(rect.right - cutWidth, rect.bottom)
      ..lineTo(rect.left, rect.bottom)
      ..close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return CustomCardShape(
      cutWidth: cutWidth * t,
      cutHeight: cutHeight * t,
    );
  }
}
