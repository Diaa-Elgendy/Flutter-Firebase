import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/model/user_model.dart';
import 'package:flutter_firebase/view/resources/string_manager.dart';
import 'package:meta/meta.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitial());

  UserModel? userModel;

  void getUser() {
    emit(GetUserLoading());
    FirebaseFirestore.instance.collection('users').doc(StringManager.uId).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      print(userModel!.isEmailVerified);
      emit(GetUserSuccess());
    }).catchError((error) {
      emit(GetUserFailed(error.toString()));
    });
  }
}
