//
//  WeeklyTipsStructure.swift
//  FaceFlex
//
//  Created by student on 03/05/24.
//

import Foundation
struct WeeklyTips{
    var tipImage : String
    var weekNumber : String
    var tipDescription : String
    var ingredientsNeeded : String
    var method: String
}

class WeeklyTipManager{
    public static var WeeklyInstance : [WeeklyTips] =
    [WeeklyTips(tipImage: "weeklytip2",weekNumber: "Week 1",tipDescription : "Rice Water Serum",ingredientsNeeded: "Rice, Clean Water, Rose Water, Aloevera Gel"  ,method: "Soak 1 container of rice in a clean water, drain it twice. Add 1 tablespoon aloevera gel and 2-3 drops of rose water."),
     WeeklyTips(tipImage: "weeklyTip1" ,weekNumber: "Week 2",tipDescription : "Instant Glow",ingredientsNeeded: "Turmeric, Honey, Tomato Juice, Cucumber"  ,method: "Mash 1 or half cucumber, add 1 tsp honey, 1tsp tonato juice and a pinch of turmeric. Make a thick Paste. Rinse off after 15 minutes witrh cold Water."),
     WeeklyTips(tipImage: "weeklyTip3",weekNumber: "Week 3", tipDescription : "Face Health",ingredientsNeeded: "Warm Water with rose water"  ,method: "After doing your day exercises, wash your face with warm water with 2-3 drops of rose water in it twice or thrice a week."),
     WeeklyTips(tipImage: "weeklyTip4",weekNumber: "Week 4", tipDescription : "Brighten Skin",ingredientsNeeded: "Turmeric, Honey, Tomato Juice"  ,method: "Make a thick paste using Turmeric, Honey and apply the paste once a week.")
    ]
    static func getWeeklyTip() -> [WeeklyTips]{return WeeklyInstance}
}

