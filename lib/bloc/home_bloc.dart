import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_hive_bloc/services/authentication.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Authentication authentication;

  HomeBloc(this.authentication) : super(HomeInitial()) {
    on<LoginEvent>((event, emit) async {
      final user = await authentication.authenticateUser(
        event.username,
        event.password,
      );
      if (user != null) {
        emit(SuccessfulLoginState(user));
      }
    });
  }
}
