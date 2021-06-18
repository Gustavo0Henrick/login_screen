import 'package:login_screen/src/core/models/user_abstract.dart';
import 'package:login_screen/src/core/models/user_trainer.dart';

class UserAdm extends AbstractUser {
  String gymName;
  List<int> listTrainerIds;
  List<UserTrainer> listUserTrainers;
}
