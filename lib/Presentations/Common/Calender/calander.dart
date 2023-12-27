import 'package:rite_funeral_flutter/imports.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RangePicker extends StatefulWidget {
  const RangePicker(
      {this.onSelectionDateRange,
        this.predication,
        required this.ignoreDates,
        this.initialDateRange,
        this.controller,
        this.width,
        this.height,
        Key? key})
      : super(key: key);
  final List<DateTime> ignoreDates;
  final void Function(DateRangePickerSelectionChangedArgs)?
  onSelectionDateRange;
  final DateRangePickerController? controller;
  final List<PickerDateRange>? initialDateRange;
  final bool Function(DateTime)? predication;
  final double? width;
  final double? height;
  @override
  _RangePickerState createState() => _RangePickerState();
}

class _RangePickerState extends State<RangePicker> {
  static DateRangePickerController controller = DateRangePickerController();
  var mySelectedDay;
  final kToday = DateTime.now();
  final kFirstDay = DateTime.now();
  final kLastDay = DateTime.now().add(const Duration(days: 180));

  bool isDisableSelection = false;
  @override
  Widget build(BuildContext context) {
    // Color selectedColor =  Theme.of(context).primaryColor;
    return Container(
      width: widget.width ?? 340.w,
      height: widget.height ?? 250.h,
      alignment: Alignment.center,
      child: SfDateRangePicker(
        minDate: DateTime.now().add(const Duration(days: 1)),
        maxDate: DateTime.now().add(const Duration(days: 182)),
        initialSelectedRanges: widget.initialDateRange,
        controller: widget.controller ?? controller,
        selectableDayPredicate: widget.predication ??
                (a) {
              DateTime date = DateTime.now();
              DateTime optimizedDate =
              DateTime(date.year, date.month, date.day, 00, 00, 00, 00);

              return !widget.ignoreDates.contains(a) ||
                  a.isBefore(optimizedDate);
            },

        // enableMultiView: true,

        // selectionRadius: -20,
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.extendableRange,
        onSelectionChanged: widget.onSelectionDateRange ??
                (date) {
              // print(date.value);
            },

        selectionColor: Theme.of(context).primaryColor.withOpacity(0.5),
        rangeSelectionColor: Theme.of(context).primaryColor.withOpacity(0.5),
        monthViewSettings: DateRangePickerMonthViewSettings(
          // showTrailingAndLeadingDates: true,
          viewHeaderStyle: DateRangePickerViewHeaderStyle(
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 13,
            ),
          ),
        ),

        selectionShape: DateRangePickerSelectionShape.circle,

        startRangeSelectionColor: Theme.of(context).primaryColor,
        endRangeSelectionColor: Theme.of(context).primaryColor,

        initialDisplayDate: DateTime.now(),
        selectionTextStyle:
        Styles.medium(fontSize: 14, color: Colors.white),
        rangeTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 14,
        ),
        monthCellStyle: DateRangePickerMonthCellStyle(
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 12,
          ),

          // cellDecoration: BoxDecoration(
          //   shape: BoxShape.circle,
          // ),
        ),
        // cellBuilder: (context, details) => Container(
        //   // width: details.bounds.width,
        //   // height: details.bounds.width,
        //   alignment: Alignment.center,
        //   // margin: EdgeInsets.all(5),
        //   //
        //   // decoration:
        //   //     BoxDecoration(color: Colors.lightGreen, shape: BoxShape.circle),
        //   child: Text(
        //     details.date.day.toString(),
        //   ),
        // ),
        headerStyle: DateRangePickerHeaderStyle(
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}