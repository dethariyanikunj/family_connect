import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int? _resendToken;

  /// Sends OTP to the given [phone] number.
  /// [onCodeSent] is called with verificationId when OTP is sent.
  /// [onFailure] is called with error message if any.
  Future<void> sendOTP(
    String phone,
    Function(String verificationId) onCodeSent,
    Function(String? error) onFailure,
  ) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone.replaceAll(' ', ''),
      forceResendingToken: _resendToken,
      // Used for resending
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Optional: Auto-sign in
      },
      verificationFailed: (FirebaseAuthException e) {
        onFailure(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        _resendToken = resendToken; // Store for future use
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Optional: handle auto-timeout
      },
    );
  }

  /// Resends OTP to the given [phone] number.
  /// Reuses [_resendToken] internally.
  Future<void> resendOTP(
      String phone,
      Function(String verificationId) onCodeSent,
      Function(String? error) onFailure) async {
    await sendOTP(
      phone,
      onCodeSent,
      onFailure,
    );
  }

  /// Verifies the given [otp] using [verificationId].
  /// Returns [UserCredential] on successful sign in.
  Future<UserCredential> verifyOTP(String verificationId, String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    return await _auth.signInWithCredential(credential);
  }
}
