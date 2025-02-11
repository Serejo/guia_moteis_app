import 'package:flutter/material.dart';
import 'package:guia_moteis_app/data/models/motel_model.dart';
import 'package:guia_moteis_app/presentation/widgets/motel_card_header.dart';
import 'package:guia_moteis_app/presentation/widgets/motel_card_suites_list.dart';

class MotelCard extends StatelessWidget {
  final Motel motel;
  const MotelCard({
    Key? key,
    required this.motel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      color: Colors.grey[200],
      shape: const RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MotelCardHeader(motel: motel),
            const SizedBox(height: 8),
            MotelCardSuitesList(motel: motel, mediaQuery: mediaQuery),
          ],
        ),
      ),
    );
  }
}
