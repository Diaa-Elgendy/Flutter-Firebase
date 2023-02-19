import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/main.dart';
import 'package:flutter_firebase/model/user_model.dart';
import 'package:flutter_firebase/view/resources/enum_manager.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());

    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      print(error.runtimeType);
      emit(LoginFailedState(error.toString()));
      if (error is FirebaseAuthException){
        showToast(error.code, ToastStates.Error);
      }
    });
  }

  void userRegister({required String email, required String name, required String phone, required String password}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      createUser(email: email, name: name, phone: phone, uId: value.user!.uid);
    }).catchError((error) {
      emit(RegisterFailedState(error.toString()));
      if (error is FirebaseAuthException){
        showToast(error.code, ToastStates.Error);
      }
    });
  }

  void createUser({required String email, required String name, required String phone, required String uId}) async {
    UserModel userModel = UserModel(email: email, name: name, phone: phone, uId: uId);
    FirebaseFirestore.instance.collection('users').doc(uId).set(userModel.toMap()).then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {

      emit(CreateUserFailedState(error.toString()));
    });
  }
}
