import 'package:login_screen/src/core/models/training_block.dart';
import 'package:login_screen/src/core/models/user_abstract.dart';

class UserClient extends AbstractUser {
  String uniqueCodeClient;
  List<TrainingBlock> listTrainingBlock;
}
