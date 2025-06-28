# 🏠 FamilyConnect – Head & Member Registration Module

Welcome to `FamilyConnect`, a Flutter app developed as part of an assignment for Wallet Hunter. This app enables efficient registration and visual management of family structures.

---

## 📱 App Information

- **App Name**: FamilyConnect
- **Package Name**: `com.wallethunter.family_connect`
- **Description**: A Flutter-based registration system to manage family hierarchies with smart linking, OTP login, and visual family tree export.

---

## 🚀 Features

- 🧭 Splash Screen with App Logo
- 🔒 OTP-based Login with Firebase (Send, Verify, Resend)
- 📶 No Internet View Handling
- 🌐 Multi-language Support
- 👤 Register Family Head & Multiple Members
- 📌 Auto-link Samaj to Temple
- 📂 Firestore: Save Head and Member Info
- ✅ Field Validations & Permissions
- 📊 GetX State Management
- 🧩 Modular UI & Code Reusability
- 🌳 Family Tree Visualization using GraphView
- 📷 Export Family Tree to PDF/Image
- 🧼 Delete Members only visible via Head Mobile
- 💥 Firebase Crashlytics Integration

---

## 🧱 Tech Stack

- **Flutter**: 3.24.5
- **Dart**: >=3.5.4 <4.0.0
- **Firebase**: Auth, Firestore, Crashlytics
- **GraphView**: Tree rendering
- **GetX**: State management
- **Screenshot + Printing**: For export

---

## 📲 Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/dethariyanikunj/familyconnect.git
   cd familyconnect
   ```

2. Get packages:
   ```bash
   flutter pub get
   ```

3. Firebase Setup:
    - Add `firebase_options.dart`
    - Enable **Phone Auth**, **Crashlytics** in Firebase Console
    - Setup Emulator or use test phone numbers (see below)

4. Run the project:
   ```bash
   flutter run
   ```

## 📦 Folder Structure

```
lib/
├── app_services/        # Firebase services (Auth, Firestore, Crashlytics)
├── const/               # App Constants
├── models/              # FamilyHeadInfo, FamilyMemberInfo
├── views/               # Views and screens
├── widgets/             # Custom reusable UI components
├── utils/               # Constants, validators, regex
├── localizations/       # LanguageKey support
```

---

## 📂 Firebase Firestore

- Family data saved under:
```
family_heads/{headPhoneNo}/family_members/{memberId}
```
- Family tree and delete functionality restricted to head's phone number

---

## 🧪 Sample Credentials (for Testing)

| Phone Number      | OTP    |
|-------------------|--------|
| +91 1111111111    | 123456 |
| +91 2222222222    | 123456 |

Ensure these test numbers are pre-configured in Firebase Console.

---

## 🎬 Demo Video

📺 [Watch Demo](https://your-video-link-here.com)

---

## 👨‍💻 Developer
**Nikunj Dethariya**  
10+ years of experience in mobile development  
📧 [Contact via email](mailto:dethariyanikunj@gmail.com)

---

## 📄 License
MIT – use freely with attribution.
