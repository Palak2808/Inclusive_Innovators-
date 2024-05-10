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




class AllWeeklyTipsManagerDetail {
    public static var AllWeeklyInstanceDetail: [String] = [
        "rice_water_serum,Rice Water Serum,Incorporate rice water serum into your skincare routine for brightening and hydration.,Rice -water-serum,After cleansing apply a few drops of rice water serum to your face and gently pat it into your skin until fully absorbed.",
        "haldi_detan_pack,Haldi Detan Pack,Use a turmeric-based detan pack to brighten and even out your skin tone.,Turmeric, Besan (gram flour), Yogurt,Mix turmeric, besan, and yogurt to form a paste. Apply the paste to your face, leave it on for 15-20 minutes, then rinse off with lukewarm water."
    ]

    static func getAllWeeklyTipsDetail() -> [String] {
        return AllWeeklyInstanceDetail
    }
}
