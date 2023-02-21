import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/counter_model.dart';

class CounterService extends StateNotifier<CounterModel> {
  CounterService() : super(CounterModel(0));

  void plusCount() {
    state = CounterModel(state.count + 1);
  }

  void minusCount() {
    state = CounterModel(state.count - 1);
  }
}
