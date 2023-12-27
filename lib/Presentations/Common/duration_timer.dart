import 'dart:async';

import 'package:rite_funeral_flutter/imports.dart';

class DurationTimer extends StatefulWidget {
  const DurationTimer({super.key});

  @override
  State<DurationTimer> createState() => _DurationTimerState();
}

class _DurationTimerState extends State<DurationTimer> {
  Duration durationLeft = Duration.zero;
  ValueNotifier<Map<String, dynamic>> time =
      ValueNotifier({"days": 00, "hours": 00, "minutes": 00, "seconds": 00});

  void startTimer(DateTime targetDateTime, Function callback) {
    durationLeft = targetDateTime.difference(DateTime.now());
    int countdownInSeconds = durationLeft.inSeconds;
    if (durationLeft.isNegative) return;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (durationLeft.inSeconds > 0) {
        setState(() {
          time.value["days"] = countdownInSeconds ~/ (24 * 3600);
          time.value['hours'] = (countdownInSeconds % (24 * 3600)) ~/ 3600;
          time.value['minutes'] = (countdownInSeconds % 3600) ~/ 60;
          time.value['seconds'] = countdownInSeconds % 60;
          countdownInSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer(DateTime.now().add(const Duration(days: 5)), () {});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: time,
        builder: (context, duration, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // if(duration['days']>0)
                _tile(val: '${duration['days']}', title: 'Days'),
                // if(duration['hours']>0)
                _tile(val: '${duration['hours']}', title: 'Hours'),
                // if(duration['minutes']>0)
                _tile(val: '${duration['minutes']}', title: 'Min'),
                // if(duration['seconds']>0)
                _tile(val: '${duration['seconds']}', title: 'Sec'),
              ],
            ));
  }

  Widget _tile({required String val, required String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(val, style: Styles.bold(fontSize: 24, color: Colors.white)),
        6.y,
        AppText(title, style: Styles.medium(fontSize: 14, color: Colors.white)),
      ],
    );
  }

  Widget collen() => _tile(val: ' : ', title: ' ');
}
