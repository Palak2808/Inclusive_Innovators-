//
//  LibraryStructures.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import Foundation
struct Workouts{
    var workoutImage : String
    var workoutName : String
    var wrokoutDescription : String
}

class WorkoutDataManager{
    public static var workoutInstance : [Workouts] =
    [Workouts(workoutImage: "w11", workoutName: "Forehead", wrokoutDescription: "5 Exercises"),
     Workouts(workoutImage: "w12", workoutName: "Lips", wrokoutDescription: "4 Exercises"),
     Workouts(workoutImage: "w13", workoutName: "Cheeks", wrokoutDescription: "5 Exercises")]
    
    
    static func getAllWorkoutDetails() -> [Workouts]{return workoutInstance}
}
// func getAllWorkoutDetails(){

//}

struct AdditionalSkincare{
    var skincareImage : String
    var skincareType : String
}

class AdditionalSkincareManager{
    public static var SkincareInstance : [AdditionalSkincare] =
    [AdditionalSkincare(skincareImage: "skincare1", skincareType: "Skin Care"),
     AdditionalSkincare(skincareImage: "skincare2", skincareType: "Basic Diet"),
     AdditionalSkincare(skincareImage: "washcare", skincareType: "Wash Care")]
    
    static func getAdditionalWorkoutDetails() -> [AdditionalSkincare]{return SkincareInstance}
}

struct QuickWorkouts{
    var QuickImage : String
    var QuickExercise : String
    var QuickDescription : String
}

class QuickWorkoutsManager{
    public static var quickInstance : [ QuickWorkouts] =
    [QuickWorkouts(QuickImage: "exercise1", QuickExercise: "Sharp Jawline", QuickDescription: "30 Strokes"),
     QuickWorkouts(QuickImage: "tip2", QuickExercise: "Cheekbones", QuickDescription: "20 Strokes"),
     QuickWorkouts(QuickImage: "eyes", QuickExercise: "Eyes", QuickDescription: "40 Strokes"),
     QuickWorkouts(QuickImage: "tip4", QuickExercise: "Smile Lines", QuickDescription: "30 Strokes"),
     QuickWorkouts(QuickImage: "finelines", QuickExercise: "Fine Lines", QuickDescription: "30 Strokes")]
    
    static func getQuickWorkouts() -> [QuickWorkouts] {return quickInstance}
}

