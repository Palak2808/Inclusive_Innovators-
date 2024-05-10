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
    var isCompleted: Bool
    init(id: UUID, isCompleted: Bool) {
            self.id = id
            self.isCompleted = isCompleted
        }
}

class ProgressManager{
    var ProgressInstance : [Progress] = []
    init() {
        ProgressInstance.append(Progress(id: UUID(),isCompleted : false))
        ProgressInstance.append(Progress(id: UUID(),isCompleted : false))
        ProgressInstance.append(Progress(id: UUID(),isCompleted : false))
        ProgressInstance.append(Progress(id: UUID(),isCompleted : false))
        ProgressInstance.append(Progress(id: UUID(),isCompleted : false))
        ProgressInstance.append(Progress(id: UUID(),isCompleted : false))
        ProgressInstance.append(Progress(id: UUID(),isCompleted : false))
        ProgressInstance.append(Progress(id: UUID(),isCompleted : false))
        }
    func getAllTasks() -> [Progress] { return self.ProgressInstance }
        
        func addTask(task: Progress) {
            self.ProgressInstance.append(task)
        }
        
        func getTaskById(id: UUID) -> Progress { self.ProgressInstance.filter({ $0.id.uuidString == id.uuidString })[0] }

    }

    var taskDataModel = ProgressManager()


struct UserDetails{
    var name : String
    var age : String
    var gender: String // Use Gender enum
    
//    enum Gender: String {
//        case male
//        case female
//        case other
//    }
}

class UserManager{
    static let shared = UserManager()
    public static var users : [UserDetails] = []
    public static var presentUser : UserDetails? = nil
    
   // static func getPresentUser() -> UserDetails {return self.presentUser}
}


struct Course{
    var image: String
    var name : String
    var exerciseNumber : String
}

class PlannedCourseManger{
    public static var PlannedCourses : [Course] =
    [Course(image: "image1", name: "Wrinkle Free", exerciseNumber: "4 Exercises"),
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
     Article(articleImage: "w4", headingText: "Do's and Dont's", descriptionText: "Read Now"),
     Article(articleImage: "w4", headingText: "Maintaing Face Health", descriptionText: "Click to know more"),
     Article(articleImage: "w4", headingText: "Face Care", descriptionText: "Read Now")]
    
    static func getArticle() -> [Article] {return ArticleInfo}
}

struct Exercises{
    var exerciseNumber : String
    var exerciseImage : String
    var exerciseHeadingText : String
    var exerciseDescriptionText : String
    var completed : Bool
}

class ExerciseManager{
    public static var ExercisesInfo : [Exercises] = [Exercises(exerciseNumber : "Exercise 1",exerciseImage: "exercise1", exerciseHeadingText: "Cheek Sculptor", exerciseDescriptionText: "30 Strokes", completed: false),Exercises(exerciseNumber : "Exercise 2",exerciseImage: "exercise1", exerciseHeadingText: "Air Puff Exercise", exerciseDescriptionText: "40 Strokes",completed: false),Exercises(exerciseNumber : "Exercise 3",exerciseImage: "exercise1", exerciseHeadingText: "Tap Your Face", exerciseDescriptionText: "50 Strokes",completed: false),Exercises(exerciseNumber : "Exercise 4",exerciseImage: "exercise1", exerciseHeadingText: "Cheek Lifter", exerciseDescriptionText: "30 Strokes",completed: false)]
    
    static func getExercise() -> [Exercises] {return ExercisesInfo}
    static func markExerciseCompleted(name: String) {
        print(name)
           guard let index = ExercisesInfo.firstIndex(where: { $0.exerciseHeadingText == name }) else {
               // Exercise not found
               return
           }
           ExercisesInfo[index].completed = true
       }
}

struct Ring{
    var title : String
    var description : String
}
class RingManager{
    public static var ringInstance : [Ring] =
    [Ring(title: "Week Number", description: "1"),
     Ring(title: "Course Name", description: "Wrinkle Free"),
     Ring(title: "Performance", description: "Excellent")]
    
    static func getRingManager() -> [Ring]{return ringInstance}
}

//            ProgressInstance.append( Progress(id: UUID(), weekNumber: "Week 1", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "", isCompleted: true ) )
//
//            ProgressInstance.append(Progress(id: UUID(), weekNumber: "Week 2", includeBreak: true, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: true))
//
//            ProgressInstance.append(Progress(id: UUID(),weekNumber: "Week 3" , includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: true, resources: "7:11 PM", isCompleted: true))
//
//            ProgressInstance.append(Progress(id: UUID(), weekNumber: "Week 4", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: true, resources: "", isCompleted: true))
//
//            ProgressInstance.append(Progress(id: UUID(),weekNumber: "Week 5" , includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "", isCompleted: false))
//
//            ProgressInstance.append(Progress(id: UUID(), weekNumber: "Week 6", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: true))
//
//            ProgressInstance.append(Progress(id: UUID(),weekNumber: "Week 7" , includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: true, resources: "7:11 PM", isCompleted: false))
//
//        ProgressInstance.append(Progress(id: UUID(),weekNumber: "Week 7" , includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: true, resources: "7:11 PM", isCompleted: false))
//
//        ProgressInstance.append(Progress(id: UUID(),weekNumber: "Week 7" , includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: true, resources: "7:11 PM", isCompleted: false))
