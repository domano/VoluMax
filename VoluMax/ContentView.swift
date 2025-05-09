//
//  ContentView.swift
//  VoluMax
//
//  Created by Dino Omanovic on 09.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "house.fill")
                }

            WorkoutsView()
                .tabItem {
                    Label("Workouts", systemImage: "figure.walk")
                }

            ExercisesView()
                .tabItem {
                    Label("Exercises", systemImage: "list.bullet")
                }

            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.xaxis")
                }
        }
    }
}

// Placeholder Views
struct DashboardView: View {
    var body: some View {
        NavigationView {
            Text("Dashboard View")
                .navigationTitle("Dashboard")
        }
    }
}

struct WorkoutsView: View {
    var body: some View {
        NavigationView {
            Text("Workouts View")
                .navigationTitle("Workouts")
        }
    }
}

struct ExercisesView: View {
    var body: some View {
        NavigationView {
            Text("Exercises View")
                .navigationTitle("Exercises")
        }
    }
}

struct StatsView: View {
    var body: some View {
        NavigationView {
            Text("Stats View")
                .navigationTitle("Stats")
        }
    }
}

#Preview {
    ContentView()
}
