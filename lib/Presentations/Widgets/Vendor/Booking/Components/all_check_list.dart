import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/ChechList/add_check_list.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/ChechList/check_list.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AllCheckList extends StatefulWidget {
   AllCheckList({super.key});

  @override
  State<AllCheckList> createState() => _AllCheckListState();
}

class _AllCheckListState extends State<AllCheckList> {
  List<String> titles = [
    "Research venues",
    "Research funeral sites",
    "Invite guests",
    "Kevin smith event ",
    "Research funeral sites",
    "Invite guests",
    "Kevin smith event ",
  ];

  List<bool> check = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape:const CircleBorder(),
        backgroundColor: AppColors.primary,
        child: const Center(child: Icon(Icons.add,color: AppColors.whiteColor,),),
        onPressed: () {
          Navigate.to(context, const AddCheckList());
        
      },),
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          'Checklist',
          style: Styles.medium(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.y,
            AppText('Check List',style: Styles.medium(
              fontSize: 14.sp,
            ),),
            for (int i = 0; i < titles.length; i++)
              CheckAndTitleTile(
                value: check[i],
                title: titles[i],
                mainAxisAlignment: MainAxisAlignment.start,
                onChanged: (vl) => _onChange(vl, i),
              ),
          ],
        ),
      ),
    );
  }

   _onChange(bool? val, int index) {
     setState(() {
       check[index] = val ?? false;
     });
   }
}
