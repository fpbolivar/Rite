import 'package:dotted_border/dotted_border.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AppDottedBorder extends StatelessWidget {
  const AppDottedBorder({this.title, this.onTap, super.key});
  final String? title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        color: Colors.black54.withOpacity(0.3),
        child: InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 90,
              color: Colors.grey.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.add_circle_outline,
                      weight: 1,
                      size: 28,
                      color: Colors.black54,
                    ),
                  ),
                  if (title != null)
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: AppText(
                        title!,
                        style: Styles.regular(fontSize: 16),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
