import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_prvdr/service/counter_service.dart';

import '../model/counter_model.dart';

final titleProvider = Provider<String>((ref) => 'My App');
final textProvider =
    Provider((ref) => 'You have pushed the button this many times:');
final counterProvider = StateProvider<int>((ref) => 0);

final counterNotifierProvider =
    StateNotifierProvider<CounterService, CounterModel>(
        (ref) => CounterService());
