import 'package:flutter/material.dart';
import '../widgets/customUserIcon.dart';
import '/utility/categorySlider.dart';
import '../widgets/proposalTile.dart';
import '../utility/styleWrapper.dart';


class LandingPage extends StatelessWidget {

  const LandingPage({super.key, });

  @override
  Widget build(BuildContext context) {
    
    return Column(
            children: <Widget>[
               const CategorySlider(tileSize: TileSize.small,),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Number of ProposalTile widgets you want
                  itemBuilder: (context, index) {
                    return ProposalTile(
                      proposalAuthor: ' By john stevens',
                      proposalName: "Proposal ${index + 1}",
                      proposalDetails: "Details for Proposal ${index + 1}",
                      isSwitchOn: false, // Initial switch state
                      onSwitchChanged: (bool newValue) {
                        // Handle switch state change
                      },
                    );
                  },
                ),
              ),
            ],
                 );
  }
}
