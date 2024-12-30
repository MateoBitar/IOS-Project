# IOS-Project
Travel Agency App

## Project Overview
The *Travel Agency App* is a multiview iOS application designed to help users plan their vacations. The app allows users to select a destination, travel dates, and calculate total costs dynamically. It features a user-friendly tab bar interface with two main views for visitor tracking and trip planning.

---

## Features
1. *Root Content View*:
   - Displays a logo (e.g., airplane icon).
   - Tracks and displays the total number of visitors accessing the app.

2. *Plan Your Trip View*:
   - A destination picker with dependent components (Country and City).
   - A picker for travel season selection (Spring, Summer, Fall, Winter).
   - Date pickers for departure and return dates.
   - Input field for the number of travelers.
   - Dynamic cost calculator based on the selected destination and the number of travelers.
   - A "Submit Plan" button that triggers an alert with trip details and total cost.

3. *Tab Bar Navigation*:
   - Intuitive navigation using tab icons.

---

## Project Structure

### Key Files:
- *AppDelegate.swift*: Configures the app lifecycle.
- *SceneDelegate.swift*: Manages UI scenes.
- *VisitorViewController.swift*: Implements the visitor count feature.
- *CalenderViewController.swift*: Handles trip planning logic.
- *ViewController.swift*: Root controller for managing shared logic.
- *Main.storyboard*: Defines the app's UI layout and connections.
- *Assets.xcassets*: Contains app icons and image assets.

### Additional Files:
- *Info.plist*: Configuration file for app settings.
- *LaunchScreen.storyboard*: Defines the launch screen interface.
- *Test Files*: Include unit and UI tests for the app.

---

## Setup Instructions

### Requirements:
- Xcode 12.0 or later.
- iOS 14.0 or later.

### Steps to Build and Run:
1. Clone or download the project files.
2. Open IOS-Project.xcodeproj in Xcode.
3. Connect a physical device or select a simulator.
4. Build the project using Cmd+B.
5. Run the app using Cmd+R.

---

## Usage
1. *Visitor Tracking*:
   - Open the app to view the total number of users who accessed it.

2. *Plan Your Trip*:
   - Navigate to the "Plan Your Trip" tab.
   - Select a destination (Country and City).
   - Choose the travel season and specify travel dates.
   - Enter the number of travelers.
   - View the dynamically updated cost.
   - Tap "Submit Plan" to see a summary of your trip.

