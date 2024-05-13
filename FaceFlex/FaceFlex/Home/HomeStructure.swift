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
    var completed :Int? = 0
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

class UserManager {
    static let shared = UserManager()
    public var users: [UserDetails] = []
    public var presentUser: UserDetails? = nil
    
    func returnName() -> String? {
        return presentUser?.name
    }
    
    func makePresentUser(name: String, age: String, gender: String) {
        presentUser = UserDetails(name: name, age: age, gender: gender)
    }
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
    static let shared = ExerciseManager()
    public  var ExercisesInfo : [Exercises] = [Exercises(exerciseNumber : "Exercise 1",exerciseImage: "exercise1", exerciseHeadingText: "Cheek Sculptor", exerciseDescriptionText: "30 Strokes", completed: false),Exercises(exerciseNumber : "Exercise 2",exerciseImage: "exercise1", exerciseHeadingText: "Air Puff Exercise", exerciseDescriptionText: "40 Strokes",completed: false),Exercises(exerciseNumber : "Exercise 3",exerciseImage: "exercise1", exerciseHeadingText: "Tap Your Face", exerciseDescriptionText: "50 Strokes",completed: false),Exercises(exerciseNumber : "Exercise 4",exerciseImage: "exercise1", exerciseHeadingText: "Cheek Lifter", exerciseDescriptionText: "30 Strokes",completed: false)]
    
     func getExercise() -> [Exercises] {return ExercisesInfo}
     func isExerciseCompleted(name: String)  {
        // Find the exercise with the given name
        if let index = ExercisesInfo.firstIndex(where: { $0.exerciseHeadingText == name }) {
            // Update the completion status of the exercise
            ExercisesInfo[index].completed = true
            RingManager.shared.incrementExerciseCompleted()
            print("it has been pillu completed")
            return  // Return true to indicate that the exercise was found and its completion status was updated
        } else {
            // Exercise not found
            print("it hasbilllu completed")
            return
          
        }
    }
    func isExerciseDone(name :String)->Bool
    {
        if let index = ExercisesInfo.firstIndex(where: { $0.exerciseHeadingText == name }) {
            // Update the completion status of the exercise
             if ExercisesInfo[index].completed == true
            {
                 
                 print("it has been completed")
                 return true
             }
            else
            {
                print("it has been not completed")
                return false
            }// Return true to indicate that the exercise was found and its completion status was updated
        } else {
            // Exercise not found
            return false
        }
    }
}

struct Ring{
    var title : String
    var description : String
}
class RingManager{
    static let shared = RingManager()
    public var exerciseCompleted :Int = 0
    func incrementExerciseCompleted()
    {
        exerciseCompleted+=1
    }
    public  var ringInstance : [Ring] =
    [Ring(title: "Week Number", description: "1"),
     Ring(title: "Course Name", description: "Wrinkle Free"),
     Ring(title: "Performance", description: "Excellent")]
    
     func getRingManager() -> [Ring]{return ringInstance}
}

