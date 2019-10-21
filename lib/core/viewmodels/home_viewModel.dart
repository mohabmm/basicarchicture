import 'dart:async';

import 'package:basicarchicture/core/services/firebase_service.dart';

import '../../service_locator.dart';
import 'base_model.dart';

class HomeViewModel extends BaseModel {
  FirebaseService _fireBaseService = locator<FirebaseService>();

//  List<RideList> homeViewData;
  StreamSubscription homeViewSubscription;
  bool status;
  final user;

  HomeViewModel(this.user) {
//    _fireBaseService.getLeaderBoardPassenger();

//    homeViewSubscription = _fireBaseService.getRide().listen(_homeViewUpdated);
  }

  @override
  void dispose() {
    print("dispose function is called");
    try {
      homeViewSubscription.cancel();
      print("dispose function is called after cancel is called");
    } catch (exception) {
      print("the exception is " + exception.toString());
    } finally {
      super.dispose();
    }
  }

//  void _homeViewUpdated(List<RideList> homeViewListData) {
//    homeViewData = homeViewListData; // Set the stats for the UI
//
//    if (homeViewData == null) {
//      setState(ViewState.Error); // If null indicate we're still fetching
//    } else if (homeViewData.length == null || homeViewData.length == 0) {
//      setState(ViewState.NoDataAvailable);
//    } else if (homeViewListData.length == 0) {
//      setState(ViewState.Error);
//    } else {
//      setState(ViewState.DataFetched);
//    }
//  }

}
