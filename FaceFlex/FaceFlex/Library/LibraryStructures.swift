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
     Workouts(workoutImage: "w13", workoutName: "cheeks", wrokoutDescription: "5 Exercises")]
    
    
    static func getAllWorkoutDetails() -> [Workouts]{return workoutInstance}
}


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


//struct WeeklyTips{
//    var tipImage : String
//    var tipName : String
//    var tipDescription : String
//}
//
//class WeeklyTipManager{
//    public static var WeeklyInstance : [WeeklyTips] =
//    [WeeklyTips(tipImage: "tip1", tipName: "Instant Glow", tipDescription: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
//     WeeklyTips(tipImage: "tip1", tipName: "Remove Pigmentation", tipDescription: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
//    ]
//    static func getWeeklyTip() -> [WeeklyTips]{return WeeklyInstance}
//}
