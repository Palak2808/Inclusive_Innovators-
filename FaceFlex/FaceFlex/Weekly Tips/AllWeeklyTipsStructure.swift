//
//  AllWeeklyTipsStructure.swift
//  FaceFlex
//
//  Created by student on 03/05/24.
//

import Foundation
struct AllWeeklyTips{
    let allWeeklyImage : String   // Image name representing the weekly tip
    let weekNumber : String   // Week number corresponding to the tip
}



/// Manager class responsible for handling all weekly tips.
class AllWeeklyTipsManager{
    /// Array to store all weekly tips.
    public static var AllWeeklyInstance : [AllWeeklyTips] =
    [AllWeeklyTips(allWeeklyImage: "weeklyTip1", weekNumber: "Week 1"),
     AllWeeklyTips(allWeeklyImage: "weeklytip2", weekNumber: "Week 2"),
     AllWeeklyTips(allWeeklyImage: "weeklyTip3", weekNumber: "Week 3"),
     AllWeeklyTips(allWeeklyImage: "weeklyTip4", weekNumber: "Week 4")]
    /// Retrieves all weekly tips.
    static func getAllWeeklyTips() -> [AllWeeklyTips]{return AllWeeklyInstance}
}


/// Manager class responsible for handling detailed information of all weekly tips.

class AllWeeklyTipsManagerDetail {
    // Array to store detailed information of all weekly tips.
    public static var AllWeeklyInstanceDetail: [String] = [
        "rice_water_serum,Rice Water Serum,Incorporate rice water serum into your skincare routine for brightening and hydration.,Rice -water-serum,After cleansing apply a few drops of rice water serum to your face and gently pat it into your skin until fully absorbed.",
        "haldi_detan_pack,Haldi Detan Pack,Use a turmeric-based detan pack to brighten and even out your skin tone.,Turmeric, Besan (gram flour), Yogurt,Mix turmeric, besan, and yogurt to form a paste. Apply the paste to your face, leave it on for 15-20 minutes, then rinse off with lukewarm water."
    ]
    /// Retrieves detailed information of all weekly tips
    static func getAllWeeklyTipsDetail() -> [String] {
        return AllWeeklyInstanceDetail
    }
}

// Structure to represent individual weekly tips with detailed information.

struct WeeklyTips{
    var tipImage : String    // Image name representing the weekly tip
    var weekNumber : String    // Week number corresponding to the tip
    var tipDescription : String  // Description of the weekly tip
    var ingredientsNeeded : String  // Ingredients needed for the tip
    var method: String          // Method or instructions for the tip
}





// Manager class responsible for handling weekly tips with detailed information.
class WeeklyTipManager{
    /// Array to store all weekly tips with detailed information.
    public static var WeeklyInstance : [WeeklyTips] =
    [WeeklyTips(tipImage: "weeklytip2",weekNumber: "Week 1",tipDescription : "Rice Water Serum",ingredientsNeeded: "Rice, Clean Water, Rose Water, Aloevera Gel"  ,method: "Soak 1 container of rice in a clean water, drain it twice. Add 1 tablespoon aloevera gel and 2-3 drops of rose water. Store in cool place for 15 days. Apply once a day."),
     WeeklyTips(tipImage: "weeklyTip1" ,weekNumber: "Week 2",tipDescription : "Instant Glow",ingredientsNeeded: "Turmeric, Honey, Tomato Juice, Cucumber"  ,method: "Mash 1 or half cucumber, add 1 tsp honey, 1tsp tonato juice and a pinch of turmeric. Make a thick Paste. Rinse off after 15 minutes witrh cold Water."),
     WeeklyTips(tipImage: "weeklyTip3",weekNumber: "Week 3", tipDescription : "Face Health",ingredientsNeeded: "Warm Water with rose water"  ,method: "After doing your day exercises, wash your face with warm water with 2-3 drops of rose water in it twice or thrice a week."),
     WeeklyTips(tipImage: "weeklyTip4",weekNumber: "Week 4", tipDescription : "Brighten Skin",ingredientsNeeded: "Turmeric, Honey, Tomato Juice"  ,method: "Make a thick paste using Turmeric, Honey and apply the paste once a week.")
    ]
    /// Retrieves all weekly tips with detailed information.
    static func getWeeklyTip() -> [WeeklyTips]{return WeeklyInstance}
}

