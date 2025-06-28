import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/family_head_info.dart';
import '../models/family_member_info.dart';

class FirestoreKeys {
  static const String familyHeads = 'family_heads';
  static const String familyMembers = 'family_members';
}

class FirestoreService {
  final CollectionReference headCollectionRef =
      FirebaseFirestore.instance.collection(
    FirestoreKeys.familyHeads,
  );

  Future<bool> isFamilyHeadAvailable(String mobile) async {
    final snapshot = await headCollectionRef.doc(mobile).get();
    return snapshot.exists;
  }

  Future<bool> saveFamilyHead(FamilyHeadInfo head) async {
    try {
      await headCollectionRef.doc(head.phone).set(head.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> saveFamilyMember(
    String headMobileNo,
    FamilyMemberInfo member,
  ) async {
    try {
      final memberCollection = headCollectionRef.doc(headMobileNo).collection(
            FirestoreKeys.familyMembers,
          );
      final docRef = await memberCollection.add(member.toJson());
      return docRef.id;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getFamilyHeadWithMembers(String phone) async {
    try {
      // Get the family head document
      final doc = await FirebaseFirestore.instance
          .collection(FirestoreKeys.familyHeads)
          .doc(phone)
          .get();

      FamilyHeadInfo? familyHeadInfo;
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        familyHeadInfo = FamilyHeadInfo.fromJson(data);
      }

      if (familyHeadInfo == null) return null;

      // Get all members under that head
      final membersSnap = await headCollectionRef
          .doc(phone)
          .collection(FirestoreKeys.familyMembers)
          .get();

      final members = membersSnap.docs
          .map(
            (doc) =>
                FamilyMemberInfo.fromJson(doc.data())..firebaseDocId = doc.id,
          )
          .toList();

      return {
        FirestoreKeys.familyHeads: familyHeadInfo,
        FirestoreKeys.familyMembers: members,
      };
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteFamilyMember({
    required String headMobileNo,
    required String? memberDocId,
  }) async {
    if (memberDocId == null) {
      return false;
    }
    try {
      final memberDocRef = headCollectionRef
          .doc(headMobileNo)
          .collection(FirestoreKeys.familyMembers)
          .doc(memberDocId);
      await memberDocRef.delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
