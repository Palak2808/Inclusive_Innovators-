
//  JounalStructures.swift
//  FaceFlex

//  Created by student on 25/04/24.
//

import Foundation
import FSCalendar

/// Structure representing data for each week.
struct WeekData {
    var image: String
    var weekDay: String
}

/// Manager class responsible for managing week data.
class WeekDataManager {
    /// Array holding instances of WeekData.
    public static var WeekDataInstance: [WeekData] = [
        WeekData(image: "image1", weekDay: "Mon"),
        WeekData(image: "image1", weekDay: "Tues"),
        WeekData(image: "image1", weekDay: "Wed"),
        WeekData(image: "image1", weekDay: "Thurs"),
        WeekData(image: "image1", weekDay: "Fri"),
        WeekData(image: "image1", weekDay: "Sat"),
        WeekData(image: "image1", weekDay: "Sun")
    ]
    
    /// Method to get all week data instances.
    static func getWeekData() -> [WeekData] {
        return WeekDataInstance
    }
}

/// Structure representing moments data.
struct Moments {
    var image: String
    var weekDay: String
    var description: String
}

/// Manager class responsible for managing moments data.
class MomentsManager {
    /// Array holding instances of Moments.
    public static var MomentsInstance: [Moments] = [
        Moments(image: "moment1", weekDay: "Monday", description: "Feeling very fresh."),
        Moments(image: "moment3", weekDay: "Tuesday", description: "Loved the Workout Today."),
        Moments(image: "moment2", weekDay: "Wednesday", description: "Skin feels very Fresh."),
        Moments(image: "moment4", weekDay: "Thursday", description: "Feeling very fresh"),
        Moments(image: "moment5", weekDay: "Friday", description: "Feeling very fresh"),
        Moments(image: "moment6", weekDay: "Saturday", description: "Feeling very fresh")
    ]
    
    /// Method to get all moment instances.
    static func getAllMoments() -> [Moments] {
        return MomentsInstance
    }
}

/// Structure representing current moments data.
struct CurrentMoments {
    var image: UIImage
    var weekDate: Date
    var description: String
}

/// Manager class responsible for managing current moments data.
class CurrentMomentsManager {
    /// Array holding instances of CurrentMoments.
    public static var CurrentMomentsInstance: [CurrentMoments] = [
        // Add other Moments instances here as needed
    ]
    
    /// Method to get all current moment instances.
    static func getAllCurrentMoments() -> [CurrentMoments] {
        return CurrentMomentsInstance
    }
}

