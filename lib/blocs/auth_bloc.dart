import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_realm_auth/realm_repository/app_service.dart';
import 'package:realm/realm.dart';

// Auth State Class
class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object?> get props => [];
}

class AuthenticationStateAuthenticated extends AuthenticationState {
  final User user;
  const AuthenticationStateAuthenticated(this.user);

  @override
  List<Object?> get props => [];
}

class AuthenticationStateUnauthenticated extends AuthenticationState {}

// Auth Events Class
class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class AuthenticationLoadState extends AuthenticationEvent {}

class AuthenticationUserChanges extends AuthenticationEvent {
  final User? user;
  const AuthenticationUserChanges(this.user);

  @override
  List<Object?> get props => [user];
}

// Auth Bloc Class
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AppService appService;
  late final StreamSubscription? _userSubscription;
  AuthenticationBloc(this.appService)
      : super(AuthenticationStateUnauthenticated()) {
    on<AuthenticationLoadState>((event, emit) {
      add(AuthenticationUserChanges(appService.app.currentUser));
    });
    on<AuthenticationUserChanges>((event, emit) {
      if (event.user == null) {
        appService.app.currentUser?.logOut();
        emit(AuthenticationStateUnauthenticated());
      } else {
        emit(AuthenticationStateAuthenticated(event.user!));
      }
    });
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
