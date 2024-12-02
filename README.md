
# Demo - A Todo List App

Developed with 💙  by [misaelriojas](https://github.com/misaelriojasftf)

 [![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

## Overview

This is a Flutter application for managing a todo list. The app is designed following the Clean Architecture pattern, ensuring a clear separation of concerns and maintainable code structure.

## Folder Structure
```css
lib
├── common
│   └── domain
│       └── utils
│           └── utils.dart
|   └── infrastructure
│       └── storage
│           └── hive_abstract.dart
│           └── hive_repo.dart
│           └── main.dart
├── login
│   ├── presentation
│   │   ├── widgets
│   │   │   └── login_failed_dialog.dart
│       └── login_screen.dart
├── session
│   ├── domain
│   │   ├── session_mock.dart
│   │   ├── session_adapters.dart
│   │   └── session.dart
│   ├── infrastructure
│   │   ├── state
│   │   │   └── session_state.dart
│   │   └── storage
│   │       └── session_storage.dart
├── todo_list
│   ├── domain
│   │   ├── task_adapters.dart
│   │   └── task.dart
│   ├── infrastructure
│   │   ├── state
│   │   │   └── task_state.dart
│   │   └── storage
│   │       └── task_storage.dart
│   └── presentation
│       └── widgets
│           ├── add_task_dialog.dart
│           ├── delete_task_dialog.dart
│           ├── edit_task_dialog.dart
│           ├── task_item.dart
│       └── todo_list_screen.dart
└── main.dart
```


### Explanation of the Layers

- **Common Layer**:
   - Contains utility functions and shared code that can be used across different parts of the app.
  - Deals with the storage mechanisms, such as Hive for local data persistence. Includes abstract classes and repositories for managing data operations.

- **Todo List Feature**:
   - **Domain Layer**:
     - Contains the core business logic and models related to the todo list feature.
   - **Infrastructure Layer**:
     - Manages the state of tasks and specific storage implementation for tasks.
   - **Presentation Layer**:
     - Manages the user interface components related to the todo list, such as dialogs for adding, deleting, and editing tasks, the main screen, and individual task items.

4. **Main Entry Point**:
   - The entry point of the Flutter application, responsible for initializing and running the app.

## Getting Started

### Prerequisites

- [FVM version 3.1.4](https://fvm.app/documentation/getting-started/installation)
- [Android or iOS setup](https://docs.flutter.dev/get-started/install)

## Running the App

1. Clone Repo

```fish
git clone git@github.com:misaelriojasftf/Todo-List-app.git
cd demo
```

2. Install Dependencies

(!) only if you don't have installed 3.22.0 yet

```bash
fvm install 3.22.0  
```

and

```fish

fvm use
fvm flutter pub get 
fvm flutter run 
```

## Tests

Run tests 

```bash
fvm flutter test 
```

# Explanation for Choosing DB: Hive

Hive is a lightweight, fast, and efficient NoSQL database designed for Flutter apps. It's ideal for local storage in Flutter applications, providing excellent performance, ease of use, and offline capabilities.

## Key Reasons for Choosing Hive:
- **High Performance**: Fast read and write operations for optimal app performance.
- **Offline Storage**: Ideal for apps that require local data storage with or without internet access.
- **Simple API**: Easy to integrate and use with Flutter, requiring minimal setup.
- **NoSQL (Key-Value Store)**: Flexible schema that allows for various data structures.
- **Lightweight**: Low memory footprint compared to databases like SQLite or Realm.
- **Flutter Compatibility**: Specifically designed for seamless integration with Flutter apps.

## Hrs invested

- Setup: 30 min
- Login: 30 min 
- Todo: 2 hrs
- Doc & Test: 1 hr

Total: 4 hrs