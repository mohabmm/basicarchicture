import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:basicarchicture/core/utilities/show_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'base_model.dart';

class AuthServiceModel extends BaseModel {
  File imageFiles;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Stream<FirebaseUser> get currentUser => _auth.onAuthStateChanged;

  Future<String> pickSaveImage() async {
    imageFiles = await ImagePicker.pickImage(source: ImageSource.camera);
    final String fileName = "${Random().nextInt(1000000)}.jpg" + "signupData";
    StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = ref.putFile(imageFiles);
    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  signUp(
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController nameController) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user;

    // call to cloud function to add user data
    final HttpsCallable callable =
        CloudFunctions.instance.getHttpsCallable(functionName: 'addUser');

    dynamic respUser = await callable.call(<String, dynamic>{
      'email': emailController.text,
      'name': nameController.text,
      'uid': user.uid,
      'numberOfRidesAsDriver': 0,
      'numberOfRidesAsGuest': 0,
      'driverRate': "0",
      'passengerRate': "0",
      'distanceCoveredAsDriver': 0,
      'distanceCoveredAsPassenger': 0,
      'cO2Driver': "0",
      'cO2Passenger': "0",
      'photoUrl':
          "https://sanitationsolutions.net/wp-content/uploads/2015/05/empty-image.png",
      'driverAuthnticated': false,
    }).then((response) {
      return response;
    }).catchError((onError) {
      print("the cloud functon  has error ");
      return null;
    });

    final HttpsCallable addAchievement = CloudFunctions.instance
        .getHttpsCallable(functionName: 'addAchievement');

    dynamic respAchievement = await addAchievement.call(<String, dynamic>{
      'firstRideAsDriver': false,
      'firstRidesAsGuest': false,
      'thirdRideAsDriver': false,
      'thirdRideAsGuest': false,
      'fifthRideAsDriver': false,
      'fifthRideAsGuest': false,
      'tenRidesAsDriver': false,
      'tenRidesAsGuest': false,
      'twentyRideAsDriver': false,
      'twentyRideAsGuest': false,
      'thirtyRideAsDriver': false,
      'thirtyRideAsGuest': false,
      'fortyRideAsDriver': false,
      'fortyRideAsGuest': false,
      'fiftyRideAsDriver': false,
      'fiftyRideAsGuest': false,
      'sixtyRideAsDriver': false,
      'sixtyRideAsGuest': false,
      'seventyRideAsDriver': false,
      'seventyRideAsGuest': false,
      'eightyRideAsDriver': false,
      'eightyRideAsGuest': false,
      'ninetyRideAsDriver': false,
      'ninetyRideAsGuest': false,
      'hundredRideAsDriver': false,
      'hundredRideAsGuest': false,
      'email': user.email
    }).then((response) {
      return response;
    }).catchError((onError) {
      print("the  achievement cloud functon  has error ");
      return null;
    });

    try {
      user.sendEmailVerification();
    } catch (e) {
      showSnackBar("error occured while sending verifcation email ");

      print('Something really unknown: $e');
    }
  }

  // save user document data in firestore data colection
  void signInWithEmailAndPassword(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user;

    if (user != null && user.isEmailVerified) {
      Navigator.pushNamed(context, 'homeview');
    } else {
      showSnackBar("we send verfication email to your email please verify it ");
    }
  }

  readImages(
      BuildContext context, String newNickName, String oldorcurrentimage) {
    var user = Provider.of<FirebaseUser>(context);

    _db
        .collection('user')
        .where("uid", isEqualTo: user.uid)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              oldorcurrentimage = doc.data['photo_url'];
            }));

    FirebaseAuth.instance.currentUser().then((user) {
      newNickName = user.displayName;
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> updateUserData(FirebaseUser user) {
    DocumentReference reportRef = _db.collection('users').document(user.uid);

    return reportRef.setData(
      {
        'uid': user.uid,
        'email': user.email,
      },
    );
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}
