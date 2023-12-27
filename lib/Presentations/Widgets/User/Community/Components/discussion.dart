import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({this.isMe = false,super.key});

 final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: isMe?  20.0:0).r,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        physics:  const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
         return Padding(
           padding:  EdgeInsets.only(left:index==1? 30.0:0,bottom: 30),
           child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CacheImage(url: Assets.image,isCircle: true,height: 40.sp,width: 40.sp,),
                12.x,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'Aqib javid',
                        style: Styles.medium(
                          color: AppColors.light,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      6.y,
                      AppText(
                        'Lorem ipsum dolor sit amet. Qui quia veniam vel consequuntur quisquam quo praesentium voluptatibus et quae ipsa et quam internos At\nnulla dolorem sed voluptatum dolorem',
                        maxLine: 5,
                        style: Styles.light(
                          color: const Color(0xFF7F7F7F),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,

                        ),
                      ),
                      11.y,
                      Row(
                        children: [
                          _buildIconWithText(20, 18.03, const Color(0xFFCBCBCB), '15',Assets.like),
                          25.x,
                          _buildIconWithText(20, 20, const Color(0xFFCBCBCB), 'Reply',Assets.reply
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
         );
        },
      ),
    );
  }

  Widget _buildIconWithText(
      double iconWidth, double iconHeight, Color iconColor, String text,String icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: iconWidth,
          height: iconHeight,
          child: SvgPicture.asset(icon),
        ),
        6.x,
        AppText(
          text,
          style: Styles.medium(
            color: const Color(0xFFCBCBCB),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,

          ),
        ),
      ],
    );
  }
}


