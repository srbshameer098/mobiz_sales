import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repositiry/Api/mobiz_Api.dart';
import '../../Repositiry/Model_Class/mobiz_Model.dart';


part 'mobiz_event.dart';
part 'mobiz_state.dart';

class MobizBloc extends Bloc<MobizEvent, MobizState> {
  MobizApi mobizApi = MobizApi();
  late Mobiz mobizModel;

  MobizBloc() : super(MobizInitial()) {
    on<MobizEvent>((event, emit) async {
      emit(MobizblocLoading());
      try {
        mobizModel = await mobizApi.getMobiz();
        emit(MobizblocLoaded());
      } catch (e) {
        print(e);
        emit(MobizblocError());
      }
    });
  }
}
