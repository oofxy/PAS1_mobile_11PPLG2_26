import 'package:get/get.dart';
import '../controllers/library_controller.dart';

class MyBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<LibraryController>(() => LibraryController());
  }
}