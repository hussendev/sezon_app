import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sezon_app/services/auth/fb_auth_controller.dart';
import 'package:sezon_app/utils/extensions/context_extenssion.dart';

import '../../../../models/process_response.dart';

class AuthGetXController extends GetxController {

  final FbAuthController _authController = FbAuthController();
  RxBool loading = false.obs;

  // Future<>

    Future<bool> signIn({required String email , required String password,required BuildContext context})async{
      loading.value=true;
    ProcessResponse processResponse= await _authController.signIn(email: email, password: password);

      if(processResponse.success){
        loading.value=false;
      }else{
        context.showSnackBar(message: processResponse.message,error: true);
      }
      loading.value=false;
    return processResponse.success;

    }

    Future<bool> createAccount ({
      required String email,
      required String phone,
      required String password,
      required BuildContext context
    }) async{
      loading.value=true;
      ProcessResponse processResponse= await _authController.createAccount(email: email, phone: phone, password: password);

      if(processResponse.success){
        loading.value=false;
      }else{
        context.showSnackBar(message: processResponse.message,error: true);
      }
      loading.value=false;
      return processResponse.success;
    }


}
