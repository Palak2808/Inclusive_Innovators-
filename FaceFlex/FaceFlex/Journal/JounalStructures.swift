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
    [Moments(image: "image1", weekDay: "Monday", description: "Feeling very fresh"),
     Moments(image: "image1", weekDay: "Tuesday", description: "Feeling very fresh"),
     Moments(image: "image1", weekDay: "Wedday", description: "Feeling very fresh"),
     Moments(image: "image1", weekDay: "Thursday", description: "Feeling very fresh"),
     Moments(image: "image1", weekDay: "Friday", description: "Feeling very fresh"),
     Moments(image: "image1", weekDay: "Saturday", description: "Feeling very fresh"),]
}
