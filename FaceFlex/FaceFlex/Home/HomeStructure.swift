//
//  listItem.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

//import Foundation
import Foundation

// MARK: - COURSE STRUCT
struct Progress{
    var id: UUID
    var weekNumber : String
    var includeBreak: Bool
    var breakStartTime: String
    var breakEndTime: String
    var meditation: Bool
    var resources: String
    var isCompleted: Bool
    init(id: UUID, weekNumber:String, includeBreak: Bool, breakStartTime: String, breakEndTime: String, meditation: Bool, resources: String, isCompleted: Bool) {
            self.id = id
           self.weekNumber = weekNumber
            self.includeBreak = includeBreak
            self.breakStartTime = breakStartTime
            self.breakEndTime = breakEndTime
            self.meditation = meditation
            self.resources = resources
            self.isCompleted = isCompleted
        }
}

class ProgressManager{
    var ProgressInstance : [Progress] = []
    init() {
            ProgressInstance.append( Progress(id: UUID(), weekNumber: "Week 1", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "", isCompleted: true ) )
            
            ProgressInstance.append(Progress(id: UUID(), weekNumber: "Week 2", includeBreak: true, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: false))
            
            ProgressInstance.append(Progress(id: UUID(),weekNumber: "Week 3" , includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: true, resources: "7:11 PM", isCompleted: false))
            
            ProgressInstance.append(Progress(id: UUID(), weekNumber: "Week 4", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "", isCompleted: true))
            
            ProgressInstance.append(Progress(id: UUID(),weekNumber: "Week 5" , includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "", isCompleted: false))
            
            ProgressInstance.append(Progress(id: UUID(), weekNumber: "Week 6", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: true))
            
            ProgressInstance.append(Progress(id: UUID(),weekNumber: "Week 7" , includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: false))
            
            
        }
    func getAllTasks() -> [Progress] { return self.ProgressInstance }
        
        func addTask(task: Progress) {
            self.ProgressInstance.append(task)
        }
        
        func getTaskById(id: UUID) -> Progress { self.ProgressInstance.filter({ $0.id.uuidString == id.uuidString })[0] }

    }

    var taskDataModel = ProgressManager()


struct Course{
    var image: String
    var name : String
    var exerciseNumber : String
}

class PlannedCourseManger{
    public static var PlannedCourses : [Course] =
    [Course(image: "image1", name: "Wrinkle Free", exerciseNumber: "5 Exercises"),
     Course(image: "image2", name: "Fine Lines", exerciseNumber: "4 Exercises")]
    
    static func getPlannedCourseDetails() ->  [Course] {return PlannedCourses}
}
// MARK: - ARTICLE STRUCT
struct Article{
    var articleImage : String
    var headingText : String
    var descriptionText : String
}

class ArticleManager{
    public static var ArticleInfo : [Article] =
    [Article(articleImage: "image4", headingText: "Facial Exercise Impacts", descriptionText: "Checkout"),
     Article(articleImage: "w4", headingText: "Do's and Dont's", descriptionText: "Read Now")]
    
    static func getArticle() -> [Article] {return ArticleInfo}
}

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

