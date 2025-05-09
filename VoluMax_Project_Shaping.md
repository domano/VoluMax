# VoluMax: Workout Tracking App

## 1. Project Outline

*   **Concept:** VoluMax is an intelligent workout tracking app designed for individuals serious about optimizing their muscle growth and strength, whether they train at a fully equipped gym or with limited equipment like dumbbells at home. The core philosophy moves beyond traditional, rigid training splits. Instead, VoluMax empowers users to implement science-based training principles by focusing on **optimal training volume and frequency per muscle group**. It helps users apply **progressive overload** systematically by meticulously tracking sets, reps, and weight. The app aims to provide clear insights into which muscles are recovered and ready for stimulus, and which have received adequate volume, allowing for a flexible yet highly effective approach to building muscle and strength based on individual recovery and performance.
*   **Core Functionality:**
    *   Log exercises, sets, reps, and weight.
        *   Track exercise progression over time (e.g., weight increases for the same rep range, or rep increases for the same weight) to visualize progressive overload.
    *   Assign each set to one or more muscle groups (e.g., Bench Press targets Chest (primary), Triceps (secondary), Shoulders (secondary)).
        *   Allow users to specify if a muscle group is a primary or secondary target for an exercise, and potentially assign different volume multipliers (e.g., 1 set for primary, 0.5 set for secondary).
    *   Track effective training volume (number of challenging sets) per muscle group.
        *   Display weekly volume per muscle group against user-defined or evidence-based target ranges (e.g., 10-20 sets/week).
        *   Allow users to define their "effective rep range" (e.g., sets taken close to failure within 6-20 reps for hypertrophy).
    *   Visualize training status per muscle group on a dashboard, indicating:
        *   Muscles recently trained (and when).
        *   Muscles recovered and potentially ready for training (e.g., 48-72 hours post-last session).
        *   Muscles approaching or exceeding recommended weekly volume.
        *   Muscles below target weekly volume.
    *   Exercise Library & Customization:
        *   Pre-populate with a wide range of exercises, including dumbbell-specific and bodyweight options, filterable by equipment and muscle group.
        *   Allow users to tag exercises by equipment type (gym machine, barbell, dumbbell, bodyweight, etc.).
        *   Users can add custom exercises and define their primary/secondary muscle targets.
    *   Workout History & Analysis:
        *   Provide summaries of training volume and frequency per muscle group over different timeframes (weekly, monthly).
*   **Target User:** Individuals who prefer a flexible, muscle-focused, and science-informed approach to weightlifting, training at various locations (gym, home).

*   **Technology Stack (Initial Version):**
    *   Native iOS (Swift)
    *   SwiftUI for the user interface.
    *   Core Data or SwiftData for local data persistence.
    *   No external backend dependencies for V1.

## 2. Design and UX Ideas

*   **Overall Aesthetic & Feel:**
    *   **Theme:** Clean, modern, focused, and motivating. Should feel data-driven but not overwhelming.
    *   **Color Palette:** Consider a primary action color (e.g., a vibrant blue or green) for buttons and highlights. For the heat map, use a spectrum that clearly indicates muscle status.
    *   **Dark Mode/Light Mode:** Support both to respect user system settings.
    *   **Typography:** Clear, legible sans-serif fonts.
    *   **Icons:** Consistent and intuitive iconography (e.g., SF Symbols).

*   **Home Screen (Dashboard):**
    *   **Interactive Muscle Heat Map:**
        *   **Visual:** A custom-drawn 2D body diagram (anterior and posterior views) using SwiftUI Shapes/Paths.
        *   **Heat Map Logic:** Colors will represent muscle status. For example:
            *   **Red/Orange (Hot):** Just trained (e.g., within the last 0-24 hours).
            *   **Yellow (Warm):** Recovering (e.g., 24-48 hours ago).
            *   **Green (Cool/Neutral):** Recovered and ready (e.g., >48 hours ago, or within optimal training window based on user settings).
            *   **Blue/Grey (Cold):** Needs training / Detraining (e.g., >72-96 hours ago, or significantly past optimal window).
            *   The exact colors and timeframes should be configurable or based on common recovery science, perhaps with user overrides.
        *   **Interactivity:**
            *   Tapping a muscle group could show a small pop-over with key info: last trained date, total sets this week, or navigate directly to the detailed "Muscle Group Tracking" screen for that muscle.
            *   A toggle to switch between anterior and posterior views.
    *   **Quick "Start Workout" Button:** Prominently displayed, possibly a floating action button or a large button at the top/bottom.
    *   **Summary Snippets (Optional):** "Last Workout: Bench Press, Squats - Yesterday"; "Weekly Volume: Chest 12 sets (Target: 15)".
    *   **Navigation:** Clear tabs or a sidebar for accessing other sections like Workout History, Exercise Library, Muscle Stats.

*   **Workout Logging:**
    *   **Flow:** Start Workout -> Add Exercise (from list/custom) -> Log Sets (Reps, Weight, Muscle Targets, Optional Rest Timer) -> End Workout.
    *   **Exercise Selection Screen:** Search bar, filters (muscle group, equipment), tabs for "All," "Recent," "Favorites." Clear indication of primary muscle(s).
    *   **Set Logging:** Input fields for `Weight` & `Reps` with steppers (+/-). "Add Set" button. Swipe to delete. Optional rest timer (manual/auto).
    *   **Muscle Group Assignment:** Defaults based on exercise, easy modification of primary/secondary status and fractional volume (e.g., 0.5 set).
    *   **In-Workout Notes:** Ability to add quick notes per set or exercise.

*   **Muscle Group Tracking (Dedicated Screen per Muscle Group):**
    *   **Header:** Muscle group name, icon/image. Current status (last trained, weekly volume vs. target), heat map color.
    *   **Volume Progression Chart:** Bar chart of weekly sets (past 4-8 weeks).
    *   **Strength Progression Chart:** Line graph for 1-2 key lifts for that muscle (weight for reps or e1RM).
    *   **Exercise History:** List of exercises logged for this muscle, sortable.
    *   **Historical Data Access:** Longer-term trends.

*   **Exercise Management (Exercise Library Screen):**
    *   **View:** A-Z list, filterable by muscle group & equipment.
    *   **Actions:** Add New (name, default muscles, equipment), Edit, Delete custom (hide pre-defined).
    *   **Details per Exercise:** Tap to see default targets, performance history.

*   **Visuals (General - covered by Overall Aesthetic & Feel, and Heat Map):**
    *   Clean, modern, intuitive UI.
    *   Heat map style representation for muscle fatigue/recency is a core visual.

*   **User Experience & Onboarding:**
    *   **First Launch/Onboarding:** Brief on app philosophy, optional goal/equipment input for defaults.
    *   **Minimize Taps:** Streamlined logging process.
    *   **Clear Feedback:** Haptics, subtle animations, positive reinforcement for PRs/targets met.
    *   **Smart Suggestions (Future):** "Your chest hasn't been trained in 5 days and is below weekly volume target."
    *   **Empty States:** Friendly messages and CTAs.
    *   **Error Handling:** Clear, non-alarming error messages.

## 3. Tickets for Version 1

*   **Backend/Data Model:**
    *   [VM-1] Define data models for User, Workout, Exercise, Set, MuscleGroup (compatible with chosen local storage).
    *   [VM-2] Implement local data storage using Apple frameworks (e.g., Core Data or SwiftData).
*   **UI - Core Screens:**
    *   [VM-3] Design and implement Home Screen (Dashboard), including the interactive 2D muscle map visualization (anterior/posterior) using SwiftUI custom drawing. Initial version to show color-coding for training recency.
    *   [VM-4] Design and implement Workout Logging screen.
    *   [VM-5] Design and implement Exercise Selection/Management screen.
    *   [VM-6] Design and implement Muscle Group Tracking/Stats screen.
*   **Functionality:**
    *   [VM-7] Implement logic for adding/editing exercises.
    *   [VM-8] Implement workout session creation and saving.
    *   [VM-9] Implement set logging (reps, weight, muscle group assignment).
    *   [VM-10] Implement calculation of volume per muscle group.
    *   [VM-11] Implement display of muscle recency on the dashboard.
*   **App Structure & Navigation:**
    *   [VM-12] Set up basic app navigation (e.g., TabView).
*   **Polish & UX:**
    *   [VM-13] Create an initial list of common exercises with default muscle group mappings.
    *   [VM-14] Basic app icon and launch screen. 