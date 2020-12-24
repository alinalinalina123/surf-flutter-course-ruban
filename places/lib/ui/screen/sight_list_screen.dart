import 'package:flutter/material.dart';
import 'package:places/ui/cards/sight_card.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';

//Widget that displays list of sights
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appBarTitle),
      body: ListView.builder(
        itemCount: mocks.length,
        itemBuilder: (context, index) {
          return SightCard(sight: mocks[index]);
        },
      ),
    );
  }
}
