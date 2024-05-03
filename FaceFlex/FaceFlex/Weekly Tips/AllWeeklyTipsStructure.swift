//
//  AllWeeklyTipsStructure.swift
//  FaceFlex
//
//  Created by student on 03/05/24.
//

import Foundation
struct AllWeeklyTips{
    let allWeeklyImage : String
    let weekNumber : String
}
class AllWeeklyTipsManager{
    public static var AllWeeklyInstance : [AllWeeklyTips] =
    [AllWeeklyTips(allWeeklyImage: "weeklyTip1", weekNumber: "Week 1"),
     AllWeeklyTips(allWeeklyImage: "weeklytip2", weekNumber: "Week 2"),
     AllWeeklyTips(allWeeklyImage: "weeklyTip3", weekNumber: "Week 3"),
     AllWeeklyTips(allWeeklyImage: "weeklyTip4", weekNumber: "Week 4")]
    
    static func getAllWeeklyTips() -> [AllWeeklyTips]{return AllWeeklyInstance}
}
