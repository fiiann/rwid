import 'package:rwid/core/utils/injector.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    // BlocProvider<HomeBloc>(create: (context) => di.locator<HomeBloc>()),
  ];
}
