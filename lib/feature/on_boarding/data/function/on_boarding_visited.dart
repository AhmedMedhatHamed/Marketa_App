import 'package:marketa/core/database/cache_helper.dart';
import 'package:marketa/core/services/service_locator.dart';

void onBoardingVisited() {
  getIt <CacheHelper> ().saveData(key: 'isOnBoardingVisited', value: true);
}
