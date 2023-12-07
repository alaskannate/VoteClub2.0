import 'package:flutter/material.dart';
import 'customUserIcon.dart';
import 'voteSwitch.dart';

class ProposalTile extends StatefulWidget {
  final String proposalAuthor;
  final String proposalName;
  final String proposalDetails;
  final bool isSwitchOn;
  // final ValueChanged<bool> onSwitchChanged;

  const ProposalTile({
    super.key,
    required this.proposalAuthor,
    required this.proposalName,
    required this.proposalDetails,
    this.isSwitchOn = false,
    required Null Function(bool newValue) onSwitchChanged,
    // required this.onSwitchChanged,
  });

  @override
  _ProposalTileState createState() => _ProposalTileState();
}

class _ProposalTileState extends State<ProposalTile> {
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
    // widget.onSwitchChanged(
    //     newValue); // Ensure this callback is correctly implemented
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 500,
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white, // Optional: set a background color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(05),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          // Bottom right is not rounded due to the cutout
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.proposalAuthor,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  widget.proposalName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(widget.proposalDetails),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     CustomUserIcon(),
                     VoteSwitch(),
                  ],
                ),
              ],
            ),
          ),
        ],
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
