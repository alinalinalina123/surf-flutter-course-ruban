import 'package:flutter/material.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/ui/cards/sight_card.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_fab.dart';

import 'add_sight_screen.dart';

//Widget that displays list of sights
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarTitle,
        type: AppBarType.main,
      ),
      floatingActionButton: CustomFloatingActionButton(
        title: newPlaceButtonTitle,
        icon: Icons.add,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AddSightScreen();
            }),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: mocks.length,
        itemBuilder: (context, index) {
          return SightCard(
            sight: mocks[index],
            index: index,
            stateUpdated: () {
              setState(() {
                updateStateOfData();
              });
            },
          );
        },
      ),
    );
  }
}
