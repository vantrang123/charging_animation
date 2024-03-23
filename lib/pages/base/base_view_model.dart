import 'package:flutter_template_rxdart/core/utils/helpers/dp_disposable.dart';

abstract class BaseViewModel<Input, Output> with DPDisposable {
  Input get input;
  Output get output;
}
