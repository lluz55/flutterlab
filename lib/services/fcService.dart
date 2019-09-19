import 'dart:async';

class FcService {
  static StreamConsumer<String> _ctl = StreamController<String>();

  static StreamController<String> get ctl => _ctl;

  static Stream<String> get stm => ctl.stream.asBroadcastStream();

  static sendMsg(String msg) {
    FcService.ctl.add(msg);
    print(ctl.stream.isBroadcast);
  }
}
