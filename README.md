# FixOnGo – On-Road Vehicle Breakdown Assistant

**Help when you need it most.**

FixOnGo is a cross-platform mobile application built with **Flutter** that provides fast, reliable, and intelligent roadside assistance for vehicle breakdowns. It combines AI-powered troubleshooting, real-time GPS tracking, verified mechanic requests, tool/spare-part delivery, call center support, in-app chat, and secure payments — all designed to reduce stress and waiting time during emergencies.

## ✨ Features

### Core Assistance
- **24/7 AI Assistant** – Rule-based chatbot offering step-by-step guidance for common issues (battery, tire, fuel, overheating, etc.)
- **Real-time GPS & Mapping** – Automatic location detection + interactive map showing nearby mechanics, towing, and fuel services
- **Mechanic & Tool Request** – Request verified professionals or get tools/spare parts delivered with ETA and cost preview
- **Live Tracking** – Track mechanic arrival and delivery on the map in real time
- **In-App Chat** – Direct messaging with mechanics/service providers + image sharing (e.g., photos of issues)
- **Call Center / Emergency Support** – One-tap connection to human experts or emergency numbers

### User Experience & Trust
- Beautiful **Dark & Light** themes
- Secure user registration & profile (with vehicle details)
- Verified service provider database with ratings & reviews
- Transparent pricing & secure digital payments
- Real-time notifications & status updates

## 🛠️ Technology Stack

| Layer          | Technology                          | Purpose                                      |
|----------------|-------------------------------------|----------------------------------------------|
| Frontend       | Flutter (Dart)                      | Cross-platform UI (Android + iOS)            |
| State Management | Provider / Riverpod (recommended) | Efficient & scalable state handling          |
| Backend        | Firebase / Node.js                  | Authentication, real-time database, functions|
| Database       | Firebase Firestore / MySQL          | User data, requests, chats, providers        |
| Maps & Location| Google Maps Flutter + Geocoding API | Real-time mapping & distance calculation     |
| AI Assistant   | Rule-based logic (future ML upgrade)| Instant troubleshooting guidance             |
| Payments       | PayHere (Sri Lanka) / Stripe        | Secure transactions & receipts               |
| Authentication | Firebase Auth                       | Email, OTP, Google/Apple sign-in             |
| Notifications  | Firebase Cloud Messaging (FCM)      | Push notifications                           |

## 📂 Project Structure (Recommended)

```text
FixOnGo/
├── lib/
│   ├── core/               # constants, themes, routes, utils, extensions
│   ├── features/
│   │   ├── auth/           # login, register, profile, vehicle details
│   │   ├── home/           # dashboard with "GET HELP NOW"
│   │   ├── ai_assistant/   # chatbot screen & logic
│   │   ├── map/            # live map & tracking
│   │   ├── request/        # mechanic/tool request flows
│   │   ├── chat/           # real-time messaging
│   │   ├── payment/        # checkout & receipts
│   │   └── emergency/      # call center & emergency contacts
│   ├── models/             # data classes (User, Request, Provider, etc.)
│   ├── services/           # firebase, maps, payment, location services
│   ├── widgets/            # reusable UI components
│   └── main.dart
├── assets/
│   ├── images/             # icons, illustrations, car photos
│   └── fonts/
├── test/                   # unit & widget tests
├── firebase.json           # Firebase config
├── pubspec.yaml
└── README.md
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ≥ 3.24
- Dart ≥ 3.5
- Android Studio / Xcode
- Firebase project configured
- Google Maps API key
- PayHere / Stripe test keys

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/FixOnGo.git
   cd FixOnGo
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Configure Firebase
   - Add `google-services.json` → `android/app/`
   - Add `GoogleService-Info.plist` → `ios/Runner/`

4. Add Google Maps API key
   - Android: `android/app/src/main/AndroidManifest.xml`
   - iOS: `ios/Runner/Info.plist`

5. Run the app
   ```bash
   flutter run
   ```

**Default run targets**:
- Android emulator/device: `flutter run`
- iOS simulator/device: `flutter run`


## 🔐 Security & Best Practices
- Firebase Authentication + OTP/social login
- Secure token handling & HTTPS
- Input validation & rate limiting
- Verified provider onboarding
- Data encryption for chats & payments

## 👥 Team – Group 01

| Name                  | Student ID |
|-----------------------|------------|
| KDH Thabrew           | 32348      |
| DMCDB Dissanayaka     | 32820      |
| DMCD Senarathna       | 32751      |
| PWTA Thilakarathna    | 32223      |
| EMIM Ekanayake        | 32735      |
| WPGAL Galappaththi    | 32649      |
| GGAKG Gurulumulla     | 32243      |
| AMVLB Athauda         | 33076      |

## 📄 License
All rights reserved © 2025/2026 

---

**FixOnGo** – Because breakdowns shouldn't leave you stranded.
