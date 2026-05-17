# Field Force Management App

A Flutter-based Field Force Management application developed as an internship assignment project.

The application helps manage:
- Leads
- Tasks
- Visits
- Team Activities
- Escalations
- AI-based Suggestions

The app supports multiple user roles with permission-based workflows.

---

# Features

## Authentication
- Role-based login
- Demo credentials
- Permission-aware navigation

## Dashboard
- Dynamic dashboard modules
- Professional UI design
- Responsive grid layout

## Lead Management
- Lead listing
- Search functionality
- Pull-to-refresh
- Lead details screen
- Lead status updates
- Lead assignment/reassignment
- Escalation workflow
- Notes & activity timeline
- Priority indicators

## Task Management
- Task viewing module
- Role-based task visibility

## Visit Tracking
- Visit module
- Activity management

## AI Suggestions
- Mock AI recommendations
- Status-based AI insights

---

# Roles & Permissions

| Role | Access |
|------|--------|
| Admin | Full access |
| Manager | Manage leads & escalations |
| Team Lead | Reassign leads |
| Field Agent | View assigned leads only |

---

# Demo Credentials

| Role | Password |
|------|----------|
| Admin | admin123 |
| Manager | manager123 |
| Team Lead | lead123 |
| Field Agent | field123 |

---

# Project Structure

```bash
lib/
│
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── leads/
│   ├── tasks/
│   ├── visits/
│   ├── activity/
│   └── ai/
│
├── main.dart
```

---

# Architecture

The application uses a feature-based folder structure.

Each feature is separated into its own module:
- Authentication
- Dashboard
- Leads
- Tasks
- Visits
- Activity
- AI Suggestions

The application currently uses:
- StatefulWidget
- Navigator routing
- Local mock data

AI suggestions are mocked using conditional business logic instead of external APIs.

---

# Technologies Used

- Flutter
- Dart
- Material UI

---

# How to Run

## Step 1
Clone repository

```bash
git clone <repository-link>
```

## Step 2
Open project

```bash
cd field_force_management_app
```

## Step 3
Install dependencies

```bash
flutter pub get
```

## Step 4
Run application

```bash
flutter run
```

---

# APK Build

To generate release APK:

```bash
flutter build apk --release
```

APK location:

```bash
build/app/outputs/flutter-apk/app-release.apk
```

---

# Screenshots

Add screenshots here before submission:
- Login Screen
- Dashboard
- Lead Management
- Lead Details

---

# Future Improvements

- Firebase Integration
- Provider/Riverpod State Management
- Real AI API Integration
- Backend APIs
- Offline Storage
- Push Notifications

---

# Author

Developed as Flutter Internship Assignment Project.