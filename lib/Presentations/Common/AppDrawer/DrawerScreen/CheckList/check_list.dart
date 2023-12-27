import 'package:flutter_svg/flutter_svg.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/vendors_search.dart';
import 'package:rite_funeral_flutter/imports.dart';

class CheckList extends StatelessWidget {
   CheckList({super.key});


 final List<String> checkListTitle = [
    'Funeral  venues',
    "Flowers",
    'Coffine',
    'Transportation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(AppStrings.checkList,style: Styles.medium(
          color: AppColors.medium,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),),
        centerTitle: true,
      ),

      body:  Column(
        children: [
          15.y,
          Expanded(
            child: ListView.separated(

              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 18.sp),
              itemCount: checkListTitle.length,
              separatorBuilder: (context, index) {
                return 15.y;
              },
              itemBuilder: (context, index) {
                return  InkWell(
                  onTap: () {
                    Navigate.to(context, VendorsSearch());
                  },
                  child: Row(children: [
                    Container(
                      height: 60.sp,
                      width: 60.sp,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.textFieldColor,
                      ),
                      child: Center(child: Icon(Icons.add,color:AppColors.regular,size: 20.sp,),),
                    ),
                    10.x,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(checkListTitle[index], style: Styles.medium(
                          color: AppColors.medium,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )),
                        AppText('Browse vendors', style: Styles.medium(
                          color: AppColors.medium,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ))
                      ],
                    )
                  ],),
                );
              },),
          ),
        ],
      ),
    );
  }
}
