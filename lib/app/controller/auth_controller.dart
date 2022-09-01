// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_magang/app/utils/loading.dart';

import '../modules/home/views/home_view.dart';
import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.userChanges();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamDataUsers() {
    CollectionReference users = firestore.collection("Users");
    return users.snapshots();
  }

  Future<DocumentSnapshot<Object?>> getUserDoc() async {
    String uid = auth.currentUser!.uid;
    DocumentReference user = firestore.collection("Users").doc(uid);
    return user.get();
  }

  //store user data
  void syncUsers(String name, String email, String password, String divisi,
      String nomor_induk) async {
    String uid = auth.currentUser!.uid.toString();

    CollectionReference users = firestore.collection('Users');
    try {
      users.doc(uid).set({
        'uid': uid,
        'name': name,
        'nomor_induk': nomor_induk,
        'email': email,
        'password': password,
        'divisi': divisi,
      });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Error",
        middleText: "Tidak Berhasil Memasukkan Data",
      );
    }
  }

  // Stream<QuerySnapshot> streamRole() async* {
  //   yield* firestore.collection("Users").snapshots();
  // }

  // Stream<DocumentSnapshot<Map<String, dynamic>>> streamRole() async* {
  //   String uid = auth.currentUser!.uid;
  //   log("${uid}");
  //   yield* firestore.collection("Users").doc(uid).snapshots();
  //   // log("${firestore.collection("Users").doc(uid).snapshots()}");
  // }

  Future<DocumentSnapshot<Object?>> role() async {
    String uid = auth.currentUser!.uid;
    DocumentReference users = firestore.collection('Users').doc(uid);
    return users.get();
  }

  //login
  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
        // StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        //   stream: streamRole(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return LoadingView();
        //     }
        //     String role = snapshot.data!.data()!["divisi"];
        //     if (role == "HR & Legal") {
        //       return const HomeHRView();
        //     } else {
        //       return HomeView();
        //     }
        //   },
        // );

        // User? user = FirebaseAuth.currentUser;
        // StreamBuilder<DocumentSnapshot>(
        //   stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.currentUser!.uid).snapshots(),
        //   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //     return checkDivision(snapshot.data);
        //   },
        // );

        // final userID = auth.currentUser?.uid;
        // firestore
        //     .collection('Users')
        //     .doc(userID)
        //     .get()
        //     .then((DocumentSnapshot doc) {
        //   bool divisi;
        //   if (divisi = doc.get('divisi') == 'HR & Legal') {
        //     Get.offAllNamed(Routes.HOME_H_R);
        //   } else {
        //     Get.offAllNamed(Routes.HOME);
        //   }
        // });

      } else {
        Get.defaultDialog(
            title: 'Verifikasi Email',
            middleText: 'Anda perlu verifikasi email terlebih dahulu.');
      }
      // Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Email tidak ditemukan.',
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Password salah.',
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Tidak dapat masuk.',
      );
    }
  }

  //register
  void register(String name, String email, String password, String divisi,
      String nomor_induk) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await myUser.user?.updateDisplayName(name);
      syncUsers(name, email, password, divisi, nomor_induk);
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: 'Verifikasi Email',
          middleText: 'Verifikasi Email sudah terkirim. Cek email anda.',
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: 'Okay');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Password terlalu lemah. Password minimal 6 karakter.',
        );
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Email sudah dipakai pada akun tersebut.',
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Tidak dapat mendaftarkan akun ini',
      );
    }
  }

  //resetpassword
  void resetPassword(String email) async {
    if (email != '' && GetUtils.isEmail(email)) {
      try {
        auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: 'Berhasil',
            middleText: 'Reset password sudah dikirim. Cek email anda',
            onConfirm: () {
              Get.back();
              Get.back();
            },
            textConfirm: 'Okay');
      } catch (e) {
        Get.defaultDialog(
            title: 'Terjadi kesalahan',
            middleText: 'Tidak dapat mengirimkan reset password');
      }
    } else {
      title:
      'Terjadi kesalahan';
      middleText:
      'Email tidak valid';
    }
  }

  //logout
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  // Widget checkDivision(DocumentSnapshot<Object?>? snapshot) {
  //   if (snapshot?.get('divisi') == 'HR & Legal') {
  //     return HomeHRView();
  //   } else {
  //     return HomeView();
  //   }
  // }
}
