import 'package:admingp/domain/cubit/pregress_hud/progress_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProgressHudCubit extends Cubit<ProgressHudStates> {
  bool loading = false;

  ProgressHudCubit() : super(DissmissProgress());

  static ProgressHudCubit get(context) => BlocProvider.of(context);


  showProgress() {
     loading=true;
     emit(ShowProgress());
     return loading;
  }

  dismissProgress() {
    loading=false;
    emit(DissmissProgress());
    return loading;
  }
}
