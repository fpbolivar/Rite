import 'package:rite_funeral_flutter/Domain/Model/Vendors/vendors_model.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/Components/members_tile.dart';
import 'package:rite_funeral_flutter/imports.dart';

class GroupMembers extends StatelessWidget {
   GroupMembers({super.key});

  final List<VendorsModel> members = [
    VendorsModel(
      title: 'Andrea Porter',
      subTitle: 'Andrea.example@gmail.com',
      image: Assets.image,
    ),
    VendorsModel(
      title: 'Andrea Porter',
      subTitle: 'Andrea.example@gmail.com',
      image: 'assets/images/flowers.png',
    ),
    VendorsModel(
      title: 'Andrea Porter',
      subTitle: 'Andrea.example@gmail.com',
      image: 'assets/images/flowers.png',
    ),
    VendorsModel(
      title: 'Andrea Porter',
      subTitle: 'Andrea.example@gmail.com',
      image: 'assets/images/flowers.png',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: members.length,
          shrinkWrap: true,
          itemBuilder:(context, index) {
          return MembersTile(
            vendors: members[index],
          );
        },)
      ],
    );
  }
}
