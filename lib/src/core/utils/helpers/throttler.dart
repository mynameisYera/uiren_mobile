import 'dart:async';
import 'dart:ui';

class Throttler {

  Throttler({this.throttleTime = const Duration(milliseconds: 100)});
  final Duration throttleTime;
  Timer? _timer;
  bool _isThrottled = false;

  void throttle(VoidCallback action) {
    if (!_isThrottled) {
      _isThrottled = true;
      action();

      _timer = Timer(throttleTime, () {
        _isThrottled = false;
      });
    }
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
