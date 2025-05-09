import Foundation
import SwiftData

@Model
final class MuscleGroup {
    @Attribute(.unique) var id: UUID
    var name: String

    init(id: UUID = UUID(), name: String = "") {
        self.id = id
        self.name = name
    }
}

@Model
final class ExerciseDefinition {
    @Attribute(.unique) var id: UUID
    var name: String
    var primaryMuscleGroups: [MuscleGroup]?
    var secondaryMuscleGroups: [MuscleGroup]?
    var equipmentType: String
    var isCustom: Bool

    init(id: UUID = UUID(), name: String = "", primaryMuscleGroups: [MuscleGroup]? = nil, secondaryMuscleGroups: [MuscleGroup]? = nil, equipmentType: String = "", isCustom: Bool = false) {
        self.id = id
        self.name = name
        self.primaryMuscleGroups = primaryMuscleGroups
        self.secondaryMuscleGroups = secondaryMuscleGroups
        self.equipmentType = equipmentType
        self.isCustom = isCustom
    }
}

@Model
final class WorkoutSession {
    @Attribute(.unique) var id: UUID
    var date: Date
    var duration: Double?
    var notes: String?
    
    @Relationship(deleteRule: .cascade, inverse: \ExerciseSet.session)
    var exerciseSets: [ExerciseSet]?

    init(id: UUID = UUID(), date: Date = Date(), duration: Double? = nil, notes: String? = nil, exerciseSets: [ExerciseSet]? = nil) {
        self.id = id
        self.date = date
        self.duration = duration
        self.notes = notes
        self.exerciseSets = exerciseSets
    }
}

@Model
final class ExerciseSet {
    @Attribute(.unique) var id: UUID
    var orderInWorkout: Int
    var reps: Int
    var weight: Double
    
    var definition: ExerciseDefinition?
    var session: WorkoutSession?
    
    @Relationship(deleteRule: .cascade, inverse: \AssignedMuscleInSet.exerciseSet)
    var assignedMuscleTargets: [AssignedMuscleInSet]?

    init(id: UUID = UUID(), orderInWorkout: Int = 0, reps: Int = 0, weight: Double = 0.0, definition: ExerciseDefinition? = nil, session: WorkoutSession? = nil, assignedMuscleTargets: [AssignedMuscleInSet]? = nil) {
        self.id = id
        self.orderInWorkout = orderInWorkout
        self.reps = reps
        self.weight = weight
        self.definition = definition
        self.session = session
        self.assignedMuscleTargets = assignedMuscleTargets
    }
}

@Model
final class AssignedMuscleInSet {
    @Attribute(.unique) var id: UUID
    var isPrimary: Bool
    var volumeMultiplier: Double
    
    var exerciseSet: ExerciseSet?
    var muscleGroup: MuscleGroup?
    
    init(id: UUID = UUID(), isPrimary: Bool, volumeMultiplier: Double, exerciseSet: ExerciseSet? = nil, muscleGroup: MuscleGroup? = nil) {
        self.id = id
        self.isPrimary = isPrimary
        self.volumeMultiplier = volumeMultiplier
        self.exerciseSet = exerciseSet
        self.muscleGroup = muscleGroup
    }
} 