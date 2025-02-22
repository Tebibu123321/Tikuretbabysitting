# Tikuret Babysitting App

Welcome to the **Tikuret Babysitting App** – a platform designed to connect parents with trusted babysitters. Our app provides a seamless experience for parents to find reliable childcare and for babysitters to offer their services to families in need.

## Overview

Tikuret Babysitting is a Flutter-based mobile application that leverages Firebase for authentication and data management. The app allows parents to create profiles, search for babysitters, and manage their favorite sitters. Babysitters can showcase their skills and availability, making it easier for parents to find the perfect match for their childcare needs.

## Features

- **User Authentication**: Secure login and signup using Firebase Authentication.
- **Profile Management**: Parents can create and update their profiles, including personal information and preferences.
- **Babysitter Search**: Browse through a list of available babysitters, complete with ratings and reviews.
- **Favorites**: Save preferred babysitters for quick access in the future.
- **Responsive Design**: A user-friendly interface that adapts to various screen sizes.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase Account: [Create a Firebase project](https://firebase.google.com/)

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Tebibu123321/tikuret-babysitting.git
   cd tikuret-babysitting
   ```

2. **Install Dependencies**

   Run the following command to install the necessary packages:

   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   - Add your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) to the respective directories.
   - Ensure Firebase Authentication and Firestore are enabled in your Firebase console.

4. **Run the App**

   Use the following command to run the app on your connected device or emulator:

   ```bash
   flutter run
   ```

## Project Structure

- **lib/**: Contains the main application code.
  - **main.dart**: Entry point of the application.
  - **signup.dart**: Handles user registration.
  - **login.dart**: Manages user login.
  - **home.dart**: Displays the main interface for parents.
  - **parent_profile_page.dart**: Allows parents to manage their profiles.
  - **favorite.dart**: Manages the list of favorite babysitters.

## Team

This project was developed by a dedicated team of developers:

- **Birkity Yishak**
- **Blen Seleshi**
- **Bethelehem Tefera**
- **Wongel Yalewlaiker**
- **Tebebu Solomon**

## Contributing

We welcome contributions to enhance the Tikuret Babysitting App. Please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/YourFeature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/YourFeature`
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Flutter and Firebase communities for their invaluable resources and support.
- Special thanks to our team for their hard work and dedication.

---

We hope you enjoy using the Tikuret Babysitting App as much as we enjoyed building it. If you have any questions or feedback, please feel free to reach out to us.
