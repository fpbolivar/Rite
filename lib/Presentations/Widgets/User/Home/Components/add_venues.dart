import 'package:rite_funeral_flutter/Presentations/Common/dotted_boder_widget.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/vendors_search.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AddVenues extends StatefulWidget {
  const AddVenues({super.key});

  @override
  State<AddVenues> createState() => _AddVenuesState();
}

class _AddVenuesState extends State<AddVenues> {
  @override
  Widget build(BuildContext context) {
    return AppDottedBorder(
      title: "Add venues",
      onTap: () {
        Navigate.to(context, VendorsSearch());
      },
    );
  }
}
