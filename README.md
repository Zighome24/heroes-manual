# heroes_manual

A mobile application designed to update the Heroes Manual Application. Designed by Georgia Tech students for their junior design class.

## Release Notes
- Heroes Manual V1.0
  - **New Features**
    - Training and Quizzes
      - Added New Content to Training and Quizzes
      - Revamped Training courses to resemble slide decks
      - Added Multiple Choice Question support to Quizzes
      - Added Fill in the Blank Question support to Quizzes
      - Added cross-navigation between Training And Quizzes
    - Main Menu
      - Added Navigation Bar to bottom of screen throughout the app
      - Revamped Main Menu to reduce click-through quantity
    - Resources
      - Added Red Flags information to resources menu
      - Added Law information to the resources menu
    - Screening Tool
      - Added a screening tool with situation specific responses
      - Added a page to provide tips in separating the victim and the perpetrator
    - Matrix / Stakeholder information
      - Added information regarding various stakeholders in domestic violence cases
  - **Bug Fixes**
    - Removed unnecessary icon buttons throughout the app
    - Reduced number of user interactions to reach content
    - Removed inconsistencies between the Android and iOS versions of the application
  - **Known Bugs**
    - Application will not support screens smaller than 4 inches, at which point various UI elements will spontaneously combust into digital flames

## Install Information
### Customer
(Pending Changes)
The customer has requested the application be available for download on the iOS and Google Play stores. If you are looking to view the application search those stores for "Heroes Manual" and download the application with the purple "HM" icon.

### Developers
#### Pre-requisites
The Heroes Manual application is written in Dart using the Flutter library to build the application onto Android and iOS platforms. The application supports developement on all operating systems that support Flutter and Android Studio, Visual Studio Code, or xCode by Apple. 

To build the application onto a local device, I would recommend you have some form of mobile application development and are familiar with Android Studio, Visual Code, or xCode IDEs. In addition, you need to have Flutter (and Dart) installed in your development environment (on your computer). For more information about Flutter and developing with it checkout [here](https://flutter.dev/ "Flutter Homepage")

#### Dependent Libraries
Any libraries needed within the application itself are handled by the package manager, YAML, within your development environment automatically. To get started though, you'll need to install some things:
- [Flutter](https://flutter.dev/)
  - If you are new to Flutter, check out the Getting Start section on the Flutter website to get you're development environment set up.
  - Our application was developed using Flutter 1.12.13 during the Spring of 2020
- Development Environments
  - [Android Studio](https://developer.android.com/studio)
    - Supported on Windows, Linux, MacOS
    - Includes the Android SDK (which you need on Windows and Linux developer environments)
    - Follow the installation instructions for your relevant operating system, and then reference the Flutter "Getting Started" guide linked previously for necessary plug-ins
  - [Visual Studio Code](https://code.visualstudio.com/)
    - Supported on Windows, Linux, and MacOS
    - Lightweight Text Editor / IDE with plug-in support and expansion
    - Follow the installation instructions for your relevant operating system, and then reference the Flutter "Getting Started" guide linked previously for necessary plug-ins
  - [xCode](https://developer.apple.com/xcode/)
    - Supported on MacOS and supports iOS Simulator development and iOS App Store builds
    - Apple's secret sauce editor for iOS and MacOS devices
    - Install using the App Store on your device and follow the installation instructions on Apple's website linked previously to get set up. Then follow the Developer Environment Guide on Flutter's website to get started with Flutter development on xCode.
- SDKs
  - Android SDK
    - Required on Windows and Linux (and on MacOS for Android based builds)
    - Recommend installing with Android Studio if you plan to use that IDE, otherwise install separately by following a guide online.
  - iOS Developer Tools
    - Installed through the App Store when installing xCode
    - Follow the associated guide with the xCode installation on Apple's website.

> USE `flutter doctor` command to get development environments set up

**NOTE:** Not readily shared, but the order of application and developer tools installation as shared on the Flutter "Getting Started" guide is very important. Installing applications/tools out of order will require the developer, you, to manually find SDKs and fix project properties.

#### Build Instructions
Following the Flutter "Getting Started" guide will share how to build a Flutter-based mobile application in your respective development environment.

The project can be built by command-line using the `flutter build` command, see the official Flutter reference manual for how to build a project from command line.

The application can be built onto an emulated device or connected (and Developer Options enabled) device.

#### Troubleshooting

1. USE `flutter doctor` to check for installation and tool issues. The 'doctor' command is very useful in making sure your environment has the necessary tools. Also if you have your emulator running or device connected, it will share whether that connected device is recognized and compatible.
2. Accept the Android-SDK licenses. With Android-based builds you have to accept the license agreements before you can build the app. You should know if this is your issue through `flutter doctor` or the console output from an IDE.
3.  Make sure your SDKs are recognized.
    1.  Check your IDE settings to make sure the Flutter SDK directory is recognized.
    2.  Check your IDE settings to make sure the Dart SDK directory is recognized.
    3.  Check your IDE settings to make sure the Android SDK directory is recognized.
4.  If Android Studio is being wacky, go to "File -> Invalidate Caches / Restart". This helps remove IDE gremlins that build up over time.