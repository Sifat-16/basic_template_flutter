import 'package:hive_flutter/hive_flutter.dart';

import '../models/authenticated_user/authenticated_user_model.dart';



// for generic primitive values only
const appDataBoxName = 'app_data_c1x';
createAppDataBox() async => await Hive.openBox(appDataBoxName);
Box<dynamic> useAppDataBox() => Hive.box(appDataBoxName);

// for the currently authenticated user only
const appUserBoxName = 'app_user_x10v';
createAppUserBox() async => {
      Hive.registerAdapter(AuthenticatedUserModelAdapter()),
      await Hive.openBox<AuthenticatedUserModel>(appUserBoxName),
    };

Box<AuthenticatedUserModel> useAppUserBox() => Hive.box(appUserBoxName);
