part of 'social_cubit.dart';

@immutable
abstract class SocialState {}

class SocialInitial extends SocialState {}

class GetUserLoading extends SocialState {}

class GetUserSuccess extends SocialState {}

class GetUserFailed extends SocialState {
  String error;

  GetUserFailed(this.error) {
    print(error.toString());
  }
}
