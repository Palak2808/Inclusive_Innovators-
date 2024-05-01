//
//  listItem.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

//import Foundation
import Foundation

//struct ListItem {
//    
//    var image: [String] = ["image1","image2"]
//    var label1:  [String] = ["5 Exercises" ,"4 Exercises"]
//    var label2: 




// MARK: - COURSE STRUCT

struct Course{
    var image: String
    var name : String
    var exerciseNumber : String
}

var PlannedCourses : [Course] = 
[Course(image: "image1", name: "Wrinkle Free", exerciseNumber: "5"),
 Course(image: "image2", name: "Fine Lines", exerciseNumber: "4")]

// MARK: - ARTICLE STRUCT
struct Article{
    var articleImage : String
    var headingText : String
    var descriptionText : String
}

var ArticleInfo : [Article] =
[Article(articleImage: "image4", headingText: "Facial Exercise Impacts", descriptionText: "Checkout"),
Article(articleImage: "w4", headingText: "Do's and Dont's", descriptionText: "Read Now")]

struct Exercises{
    var exerciseImage : String
    var exerciseHeadingText : String
    var exerciseDescriptionText : String
}

var ExercisesInfo : [Exercises] = [Exercises(exerciseImage: "exercise1", exerciseHeadingText: "Pucker Up", exerciseDescriptionText: "5 Strokes"),Exercises(exerciseImage: "exercise1", exerciseHeadingText: "Air Puff Exercise", exerciseDescriptionText: "4")]

//struct Articles{
//    var articleImage : [String] = ["image4","w4"]
//    var headingText : [String] = ["Facial Exercise Impacts","Do's and Dont's"]
//    var descriptionText : [String] = ["Checkout","Read Now"]
//}


//struct Week{
//    var weekNumber : [String] = ["Week 1", "Week 2", "Week 3", "Week 4","Week 5","Week 6","Week 7","Week 8"]
//    var weekImage :  [String] = ["exercise1","exercise1","exercise1","exercise1","exercise1"]
//    var courseName : [String] = ["Wrinkle Free", "Fine Lines"]
//    var streak : [String] = ["4/6", "6/6","5/5"]
//    var accuracy : [String] = ["90%", "85%","96%"]
//}

