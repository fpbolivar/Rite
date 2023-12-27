import 'package:rite_funeral_flutter/Domain/Model/Saved/my_saved.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/imports.dart';

import 'Components/item_tile.dart';

class MySaved extends StatelessWidget {
  MySaved({super.key});

  final List<MySavedModel> model = [
    MySavedModel(
        title: 'Harmony Farewell House',
        image: 'assets/images/onboard1.png',
        location: 'London UK',
        reivew: 4.0),
    MySavedModel(
        title: 'Harmony Farewell House',
        image: 'assets/images/onboard2.png',
        location: 'UK London',
        reivew: 4.9)
  ];

  @override
  Widget build(BuildContext context) {
    return MainWidget(
        title: AppStrings.mySaved,
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ItemTile(
                modelData: model[index],
              );
            },
            separatorBuilder: (context, index) {
              return 10.y;
            },
            itemCount: model.length));
  }
}
