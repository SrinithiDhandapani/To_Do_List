# This project is a part of a hackathon run by  https://www.katomaran.com

---

# TickMate 🕒

TickMate is a powerful and intuitive task management app built using Flutter. Designed for productivity and simplicity, it helps users efficiently manage their daily tasks and boost focus through a clean and modern user experience.

---

## 📱 Features

- 📝 Create, update, and delete tasks
- ✅ Organize tasks by completion status
- 🔒 Google Sign-In using Firebase Authentication
- 🌙 Light/Dark mode toggle
- 📅 Task persistence using Hive local database
- 🧹 Swipe to delete with animation (using flutter_slidable)
- 🔄 Responsive UI with support for multiple screen sizes

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.5.3 or higher)
- Android Studio / VSCode
- Firebase project setup for Android

### Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/tickmate.git
cd tickmate
flutter pub get
flutter pub run build_runner build
flutter run 
```
### 📦 APK Download
A working debug APK can be downloaded here:  https://drive.google.com/file/d/1-w4_7gbW5tkK4-AE1rmSn7nxY9v-QQUH/view?usp=drive_link

### 🛠️ Architecture
TickMate follows a Provider + MVVM (Model-View-ViewModel) architecture ensuring clean code separation and scalability.

<img width="512" height="512" alt="Architecture" src="https://github.com/user-attachments/assets/5dbab847-77d5-41fe-884f-5367df793b6e" />

### 📹 App Demo
Link : https://drive.google.com/drive/folders/1OXkYMpS-tQq_if0QguRxf4ACIq1ponRz?usp=drive_link

### 🧠 Assumptions
 - Users will have an internet connection to sign in using Google.

 - The app is initially built for Android; iOS support can be added later.

 - Offline support is handled using Hive for task persistence.

 - Since the requirements didn't specify notifications or reminders, those were omitted for MVP scope.

### 🎨 UI and Design
 - Built with Flutter and Material Design

 - Responsive layout for phones and tablets

 - Color palette optimized for accessibility

 - Follows design best practices for spacing, shadows, contrast, and interaction feedback

### 🧰 Packages Used
provider: State management

 - firebase_auth + google_sign_in: Authentication

 - hive + hive_flutter: Local storage

 - flutter_slidable: Swipe actions

 - intl: Date formatting

 - lottie: Animations


### 🏁 Final Notes
 - Code is modular, well-documented, and scalable.

 - UI design was given high importance with animations and smooth transitions.

 - Ready for extension with notifications, priorities, and calendar views.



