import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';

class AmplitudeService {
  final Amplitude _amplitude;

  AmplitudeService()
      : _amplitude = Amplitude(Configuration(apiKey: '87f74c9bd5e530fc0c2d1d856cf72cb9'));

  Future<void> init() async {
    await _amplitude.isBuilt;
    await _amplitude.flush();
  }

  // Future<void> logEvent(String eventName, {Map<String, dynamic>? properties}) async {

  //   await _amplitude.track(BaseEvent('eventName', userId: eventName, eventProperties: properties));
  // }
  Future<void> logEvent(String eventName, {Map<String, dynamic>? properties}) async {
    final event = BaseEvent(
      eventName,
      eventProperties: properties, 
    );

    await _amplitude.track(event);
  }
}
