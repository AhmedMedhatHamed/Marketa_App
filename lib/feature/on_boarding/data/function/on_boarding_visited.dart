import 'package:marketa/core/database/cache_helper.dart';

void onBoardingVisited() {
  CacheHelper().saveData(key: 'isOnBoardingVisited', value: true);
}
