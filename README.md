# Task Management App

This is a task management app designed to help users efficiently manage their tasks, track daily progress, and stay motivated with reminders and productivity insights. The app is built using the MVVM (Model-View-ViewModel) architectural pattern and is implemented in Flutter.

## Features

- **Add Tasks**: Users can create tasks with a name, description, and due date.
- **Task Classification**: Tasks can be categorized into "Important & Urgent," "Important but Non-Urgent," etc.
- **Time Management**: Users can set timers or durations for tasks, with pause and resume functionality.
- **Progress Tracking**: Daily to-do lists display completed tasks.
- **Motivational Notifications**: The app sends reminders and motivational messages based on task status.
- **Daily Progress Reports**: Track user performance over time with detailed statistics.
- **Task Evaluation**: At the end of the day, users can evaluate their progress and enhance their task management strategies.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-repo/daily_track.git
   lib/
# System Design

This document outlines the system design for the Task Management App, highlighting the core components and feature modules.

## Core Components

- **Routing**
  - Handling navigation and routing within the app to facilitate smooth transitions between different screens.

- **Helpers**
  - Utility functions and helper classes for common tasks to keep the codebase clean and maintainable.

- **Theming**
  - Managing app-wide theming and styles to ensure a consistent user interface.

- **Widgets**
  - Reusable widgets used across different parts of the app to promote consistency and reduce code duplication.

## Features

### Home

This module serves as the main entry point of the application and provides an overview of tasks and progress.

#### Home Module Structure

- **data**
  - **models**
    - Contains data models representing the structure of tasks (e.g., `TaskModel`).
  - **repo**
    - Implements the repository pattern for data access and management, ensuring a separation of concerns.

- **logic**
  - **cubit/states**
    - Business logic layer using Cubit for state management, allowing for 

ther modifications or additions, just let me know!
