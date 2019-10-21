import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final Firestore _db = Firestore.instance;

//  getLeaderBoardDriver() {
//    print("get Leaderboard Driver is called");
//    return _db
//        .collection("user")
//        .where("driverRate", isGreaterThan: "0")
//        .orderBy('driverRate', descending: true)
//        .limit(10)
//        .snapshots()
//        .listen(_leaderBoardDriverItemsUpdated);
//  }

}
