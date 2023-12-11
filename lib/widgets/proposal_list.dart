import 'package:flutter/material.dart';
import '../widgets/proposal_item/proposal_tile.dart';

import '/services/httpRequests.dart';

class ProposalList extends StatelessWidget {
const ProposalList({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    FutureBuilder<List<Proposal>>(
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
          );
  }
}