//
//  JounalStructures.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import Foundation
import FSCalendar

struct WeekData{
    var image: String

    var weekDay : String
}


class WeekDataManager{
    public static var WeekDataInstance : [WeekData] =
    [WeekData(image: "image1", weekDay: "Mon"),
     WeekData(image: "image1", weekDay: "Tues"),
     WeekData(image: "image1", weekDay: "Wed"),
     WeekData(image: "image1", weekDay: "Thurs"),
     WeekData(image: "image1", weekDay: "Fri"),
     WeekData(image: "image1", weekDay: "Sat"),
     WeekData(image: "image1", weekDay: "Sun")]
    
    static func getWeekData() -> [WeekData]{return WeekDataInstance}
}

struct Moments{
    var image: String
    var weekDay : String
    var description : String
}

class MomentsManager{
    public static var MomentsInstance : [Moments] =
    [Moments(image: "moment1", weekDay: "Monday", description: "Feeling very fresh."),
     Moments(image: "moment3", weekDay: "Tuesday", description: "Loved the Workout Today."),
     Moments(image: "moment2", weekDay: "Wednesday", description: "Skin feels very Fresh."),
     Moments(image: "moment4", weekDay: "Thursday", description: "Feeling very fresh"),
     Moments(image: "moment5", weekDay: "Friday", description: "Feeling very fresh"),
     Moments(image: "moment6", weekDay: "Saturday", description: "Feeling very fresh"),]
    
    static func getAllMoments() -> [Moments] {return MomentsInstance}
}

struct CurrentMoments {
    var image: UIImage
    var weekDate:Date
    var description: String
}

class CurrentMomentsManager {
    public static var CurrentMomentsInstance: [CurrentMoments] = [
//        CurrentMoments(image: UIImage(named: mo), weekDate: <#T##Date#>, description: <#T##String#>)// Example date, you should replace this with your actual date
        // Add other Moments instances here as needed
    ]
    
    static func getAllCurrentMoments() -> [CurrentMoments] {
        return CurrentMomentsInstance
    }
}
