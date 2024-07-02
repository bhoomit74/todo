# Todo

A simple and efficient ToDo app for managing daily tasks and staying organized.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)

## Firebase Setup

Follow these steps to set up Firebase for your project:

### 1. Create a Firebase Project

1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Click on **Add project** and follow the setup flow.
3. Once your project is created, you will be redirected to the project overview page.

### 2. Register Your App with Firebase

#### For Android:

1. In the Firebase console, click on the Android icon to add an Android app to your project.
2. Enter your Android package name (you can find this in your `android/app/src/main/AndroidManifest.xml` file).
3. Download the `google-services.json` file.
4. Place the `google-services.json` file in the `android/app` directory of your Flutter project.

#### For iOS:

1. In the Firebase console, click on the iOS icon to add an iOS app to your project.
2. Enter your iOS bundle ID (you can find this in your `ios/Runner.xcodeproj` file).
3. Download the `GoogleService-Info.plist` file.
4. Place the `GoogleService-Info.plist` file in the `ios/Runner` directory of your Flutter project.

#### iOS:

1. Open `ios/Podfile` and add:
    ```ruby
    platform :ios, '13.0'
    ```


## Screenshots
![Dashboard](https://github.com/bhoomit74/todo/blob/main/assets/screenshots/dashboard.png)
![Dashboard](https://github.com/bhoomit74/todo/blob/main/assets/screenshots/addTask.png)
![Dashboard](https://github.com/bhoomit74/todo/blob/main/assets/screenshots/EditTask.png)
