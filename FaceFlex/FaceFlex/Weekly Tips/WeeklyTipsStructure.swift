//
//  WeeklyTipsStructure.swift
//  FaceFlex
//
//  Created by student on 03/05/24.
//

import Foundation
struct WeeklyTips{
    var tipImage : String
    var tipName : String
    var tipDescription : String
    var ingredientsNeeded : String
    var method: String
}

class WeeklyTipManager{
    public static var WeeklyInstance : [WeeklyTips] =
    [WeeklyTips(tipImage: "weeklyTip1", tipName: "Instant Glow",tipDescription : "some description",ingredientsNeeded: "Turmeric, Honey, Tomato Juice"  ,method: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
     WeeklyTips(tipImage: "weeklytip2", tipName: "Remove Pigmentation", tipDescription : "some description",ingredientsNeeded: "Turmeric, Honey, Tomato Juice"  ,method: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
     WeeklyTips(tipImage: "weeklyTip3", tipName: "Remove Pigmentation", tipDescription : "some description",ingredientsNeeded: "Turmeric, Honey, Tomato Juice"  ,method: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
     WeeklyTips(tipImage: "weeklyTip4", tipName: "Remove Pigmentation", tipDescription : "some description",ingredientsNeeded: "Turmeric, Honey, Tomato Juice"  ,method: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
    ]
    static func getWeeklyTip() -> [WeeklyTips]{return WeeklyInstance}
}

