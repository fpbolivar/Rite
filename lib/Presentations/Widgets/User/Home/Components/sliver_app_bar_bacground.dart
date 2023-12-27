import 'package:rite_funeral_flutter/imports.dart';

class SliverAppBarBackground extends StatelessWidget {
  const SliverAppBarBackground({this.height, this.child, super.key});
  final double? height;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/flowers.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              foregroundDecoration: const BoxDecoration(color: Colors.black54),
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
