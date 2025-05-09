# VoluMax Version 1 - Step-by-Step Tasks

This document outlines the development tasks to reach Version 1 of the VoluMax iOS app. Each task is designed to be actionable and contribute to the overall project goals.

## Phase 1: Project Foundation & Core Data

1.  **[P1-T1] Project Setup & Basic Navigation:**
    *   Create a new Xcode project for VoluMax (SwiftUI App lifecycle).
    *   Implement basic app navigation using `TabView` for main sections (e.g., Dashboard, Workouts, Exercises, Stats).
    *   Define placeholder views for each tab.

2.  **[P1-T2] COMPLETED - Data Model Definition (SwiftData/Core Data):**
    *   Define the `MuscleGroup` entity (e.g., name, id).
    *   Define the `ExerciseDefinition` entity (e.g., name, default primary/secondary muscle groups, equipment type, custom flag).
    *   Define the `WorkoutSession` entity (e.g., date, duration (optional), notes).
    *   Define the `ExerciseSet` entity (e.g., orderInWorkout, reps, weight, assigned muscle groups with primary/secondary status and volume multiplier, link to `ExerciseDefinition`, link to `WorkoutSession`).
    *   Establish relationships between entities (e.g., `WorkoutSession` has many `ExerciseSet`s, `ExerciseSet` links to one `ExerciseDefinition`).

3.  **[P1-T3] Local Storage Implementation (SwiftData/Core Data):**
    *   Set up the chosen persistence framework (SwiftData or Core Data) in the app.
    *   Create helper functions/services for basic CRUD operations for each entity (Create, Read, Update, Delete).

4.  **[P1-T4] Seed Initial Data - Muscle Groups & Common Exercises:**
    *   Create a predefined list of common muscle groups (e.g., Chest, Back (Lats, Traps, Lower Back), Shoulders (Anterior, Lateral, Posterior), Biceps, Triceps, Quads, Hamstrings, Glutes, Calves, Abs).
    *   Populate the `MuscleGroup` store with this list on first launch.
    *   Create a predefined list of 15-20 common exercises (`ExerciseDefinition`) with their default primary/secondary muscle group mappings (referencing the `MuscleGroup` entities) and common equipment types.
    *   Populate the `ExerciseDefinition` store with this list on first launch.

## Phase 2: Exercise Management

5.  **[P2-T1] Exercise Library UI - View & Filter:**
    *   Create a SwiftUI view to display the list of all `ExerciseDefinition`s.
    *   Implement search functionality to filter exercises by name.
    *   Implement filtering by muscle group and equipment type.
    *   Display exercise name and primary targeted muscle group(s) in the list.

6.  **[P2-T2] Add/Edit Custom Exercise UI & Logic:**
    *   Create a SwiftUI form view for adding a new `ExerciseDefinition`.
        *   Fields: name, primary muscle group(s) selector, secondary muscle group(s) selector, equipment type selector.
    *   Create a similar form view for editing an existing custom `ExerciseDefinition`.
    *   Implement the logic to save new custom exercises and update existing ones in the persistent store.
    *   Ensure users can only edit/delete custom exercises, not predefined ones.

## Phase 3: Workout Logging

7.  **[P3-T1] Start New Workout UI & Session Creation:**
    *   Implement UI on the Dashboard or a dedicated "Workouts" tab to start a new workout.
    *   This should create a new `WorkoutSession` object (initially with just a start date/time) and navigate to the active workout logging screen.

8.  **[P3-T2] Active Workout Logging Screen UI - Exercise & Set Display:**
    *   Create a SwiftUI view for an active workout session.
    *   Display a list of exercises added to the current workout.
    *   Under each exercise, display its logged sets (reps, weight).

9.  **[P3-T3] Add Exercise to Workout Flow:**
    *   Implement a button/flow within the active workout screen to "Add Exercise."
    *   This should present the Exercise Library view (from P2-T1) modally or navigate to it.
    *   Allow selecting an exercise from the library to add it to the current `WorkoutSession`.

10. **[P3-T4] Log Set UI & Logic:**
    *   For each exercise in the active workout, provide UI to "Add Set."
    *   Input fields for `reps` and `weight` (with steppers or easy input).
    *   Mechanism to assign/confirm primary and secondary muscle groups for this specific set (defaulting from `ExerciseDefinition` but overridable for this instance). Allow setting volume multiplier (e.g., 1.0 for primary, 0.5 for secondary).
    *   Save each `ExerciseSet` linked to the current `WorkoutSession` and its parent `ExerciseDefinition`.

11. **[P3-T5] Finish Workout & Save Session:**
    *   Implement a "Finish Workout" button.
    *   This should finalize the `WorkoutSession` (e.g., set end time/duration) and ensure all data is persisted.
    *   Navigate away from the active workout screen.

## Phase 4: Dashboard & Muscle Status Visualization

12. **[P4-T1] Muscle Volume & Recency Calculation Logic:**
    *   Implement logic to query `ExerciseSet` data.
    *   Calculate total effective volume (sum of set multipliers) for each `MuscleGroup` within a given period (e.g., last 7 days).
    *   Determine the last trained date for each `MuscleGroup`.

13. **[P4-T2] Dashboard Home Screen UI - Basic Layout:**
    *   Design the basic layout for the Home Screen/Dashboard tab.
    *   Include placeholders for the muscle map and any summary snippets.

14. **[P4-T3] Interactive 2D Muscle Map - Shape Definitions (Anterior & Posterior):**
    *   Research or design simplified 2D vector shapes for major muscle groups (anterior view: Chest, Shoulders (Ant/Lat), Biceps, Abs, Quads).
    *   Research or design simplified 2D vector shapes for major muscle groups (posterior view: Traps, Shoulders (Post), Lats, Lower Back, Triceps, Glutes, Hamstrings, Calves).
    *   Implement these as SwiftUI `Path` or `Shape` objects. Each muscle shape should be identifiable.

15. **[P4-T4] Interactive 2D Muscle Map - Rendering & Heat Map Logic:**
    *   Arrange the defined muscle shapes into anterior and posterior views on the Dashboard.
    *   Implement a toggle to switch between anterior and posterior views.
    *   Fetch muscle recency data (from P4-T1).
    *   Apply color-coding (heat map) to each muscle shape based on its last trained date (e.g., Red/Orange for 0-24hrs, Yellow for 24-48hrs, Green for >48hrs, Blue/Grey for >72-96hrs).
    *   Implement tap gestures on muscle shapes to (initially) print the muscle name or show a basic alert with last trained date.

16. **[P4-T5] Display Weekly Volume Snippets (Optional):**
    *   On the dashboard, display summary text for a few key muscle groups showing "Current Weekly Volume / Target Weekly Volume." (Target can be a static placeholder for V1).

## Phase 5: Detailed Muscle Group Stats

17. **[P5-T1] Muscle Group Stats Screen UI:**
    *   Create a new SwiftUI view that can be navigated to (e.g., by tapping a muscle on the map or from a dedicated "Stats" tab).
    *   This view should be able to display data for a specific `MuscleGroup`.
    *   Display header: Muscle group name, current heat map color, last trained date, current weekly volume.

18. **[P5-T2] Volume Progression Chart Implementation:**
    *   Using Swift Charts, implement a bar chart on the Muscle Group Stats screen showing weekly volume for that muscle over the past 4-8 weeks.

19. **[P5-T3] Exercise History List for Muscle Group:**
    *   Display a list of all `ExerciseSet`s that targeted this muscle group, showing exercise name, date, reps, weight. Sortable by date.

## Phase 6: Polish

20. **[P6-T1] App Icon & Launch Screen:**
    *   Design a basic app icon for VoluMax.
    *   Set up the app icon in Xcode.
    *   Design and implement a simple launch screen.

21. **[P6-T2] Refine UI & UX:**
    *   Review all screens for consistency, clarity, and ease of use.
    *   Implement empty states with helpful messages.
    *   Add basic haptic feedback for common interactions.
    *   Ensure Dark Mode/Light Mode compatibility is working well. 