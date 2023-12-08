import 'package:flutter/material.dart';
import '../widgets/customUserIcon.dart';
import '/utility/categorySlider.dart';
import '../widgets/proposalTile.dart';
import '../appWrapper.dart';

import '/services/httpRequests.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CategorySlider(tileSize: TileSize.large),
        Expanded(
          child: FutureBuilder<List<Proposal>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var proposal = snapshot.data![index];
                    return ProposalTile(
                      proposalAuthor:
                          'Author Name', // Assuming a static author for now
                      proposalName: proposal.title,
                      proposalDetails: proposal.body,
                      isSwitchOn: false,
                      onSwitchChanged: (bool newValue) {
                        // Handle switch state change
                      },
                    );
                  },
                );
              } else {
                return const Text('No data available');
              }
            },
          ),
        ),
      ],
    );
  }
}
