import 'package:ecommerce_app/core/viewModel/auth_view_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
//injection dependencies
class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthViewModel());
  }

}