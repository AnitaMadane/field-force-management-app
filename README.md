# Field Force Management App

A Flutter-based **Field Force Management System** developed as an internship assignment project.

This application helps organizations manage:
- Leads
- Tasks
- Visits
- Team Activities
- Escalations
- AI-based Suggestions

The app supports multiple user roles with permission-based workflows and a clean Flutter architecture.

---

# Project Overview

The Field Force Management App is designed for field teams and managers to efficiently track leads, assign tasks, monitor activities, and manage visit updates.

The project focuses on:
- Role-based access control
- Clean Flutter UI
- Feature-based architecture
- Mock AI integration
- Mobile-friendly workflow management

---

# Features

## Authentication
- Role-based login
- Demo credentials
- Permission-aware navigation

## Dashboard
- Dynamic dashboard modules
- Professional responsive UI
- Grid-based layout

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
- Task status tracking

## Visit Tracking
- Visit module
- Visit notes management
- Activity tracking

## Activity Timeline
- Lead activity history
- Status update logs
- Escalation history
- Notes timeline

## AI Suggestions
- Mock AI recommendations
- Status-based AI insights
- Suggested next actions
- Lead priority indication

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

# Folder Structure

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
├── models/
├── services/
├── widgets/
│
├── main.dart
```

---

# Architecture Explanation

The application follows a **feature-based architecture** where every feature is separated into its own module.

## Feature-Based Structure
Each module contains its own:
- Screens
- Widgets
- Models
- Logic

This improves:
- Scalability
- Code readability
- Maintainability

## StatefulWidget Usage
The application uses `StatefulWidget` for:
- Dynamic UI updates
- Form handling
- Search & filters
- Activity refresh

## Mock AI Logic
The AI module is implemented using mocked business logic instead of external AI APIs.

The AI suggestions are generated using:
- Lead status
- Escalation conditions
- Activity updates
- Priority conditions

This structure allows easy replacement with real AI services in future.

## Navigation Flow
The app uses Flutter Navigator routing.

Navigation Flow:
- Login → Dashboard
- Dashboard → Leads/Tasks/Visits
- Leads → Lead Details
- Lead Details → Activity & AI Suggestions

## Role-Based Rendering
UI modules and actions are shown based on:
- User role
- Permission level
- Assigned access

---

# Technologies Used

- Flutter
- Dart
- Material Design UI

---

# How to Run the App

## Step 1 — Clone Repository

```bash
git clone <repository-link>
```

## Step 2 — Open Project

```bash
cd field_force_management_app
```

## Step 3 — Install Dependencies

```bash
flutter pub get
```

## Step 4 — Run Application

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

## Login Screen
![Login](screenshots/login.png)

## Dashboard
![Dashboard](screenshots/dashboard.png)

## Lead List
![Lead List](screenshots/lead_list.png)

## Lead Details
![Lead Details](screenshots/lead_details.png)

## AI Summary
![AI Summary](screenshots/ai_summary.png)

## Timeline
![Timeline](screenshots/timeline.png)

---

# Mock AI Explanation

The project includes a mocked AI module designed to simulate AI-based recommendations without using external APIs.

The AI logic currently provides:
- Lead priority suggestions
- Follow-up recommendations
- Status-based insights
- Escalation alerts

The mocked AI is separated into its own module/service layer so it can later be replaced with real AI APIs.

---

# Final Testing Checklist

Completed testing for:
- Login flow
- Role-based navigation
- Lead management
- Task management
- Activity timeline
- AI suggestions
- Navigation flow
- UI responsiveness
- No crash flow

---

# Future Improvements

- Firebase Integration
- Riverpod/Bloc State Management
- Real AI API Integration
- Backend APIs
- Offline Storage
- Push Notifications
- Notification System

---

# Author

Developed as a Flutter Internship Assignment Project.