import 'package:flutter/material.dart';
import '/utility/categorySlider.dart';
import '../widgets/proposal_item/proposal_tile.dart';
import '../widgets/proposal_list.dart';

import '/services/httpRequests.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        // CategorySlider(tileSize: TileSize.large),
        Expanded(
          child: ProposalList()
        ),
      ],
    );
  }
}
