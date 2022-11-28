import 'repositories/index.dart';
import 'services/index.dart';

class LogicInterface extends BLoI {
  LogicInterface():super(){
    Notification.setBLoI(this);
    // todo: at this point, you can setup DI
  }
}