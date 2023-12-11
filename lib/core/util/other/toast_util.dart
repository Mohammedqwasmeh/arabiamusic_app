import 'package:fluttertoast/fluttertoast.dart';
import 'package:arabiamusic_app/core/constant/colors.dart';

class ToastUtil {
  static Future<void> showToast({
    required String msg,
  }) async {
    await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: AppColors.purple[900],
    );
  }
}
