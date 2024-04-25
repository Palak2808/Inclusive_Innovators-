
//




import Foundation

struct MockData {
    static let shared = MockData()



    private let recommended: ListSection = {
        .recommended([
            ListItem(image: "image2",label1: "5 Exercises", label2: "Wrinkle Free"),
          //  ListItem(title: "JZakir Khan Live", image: "ZakirKhanLiive"),
            ListItem( image: "image1",label1: "4 Exercises", label2: "Fine Lines"),
           
            
           // ListItem(title: "JZakir Khan Live", image: "ZakirKhanLiive"),
            
])
    }()

//    private let eventsThisWeek: ListSection = {
//        .eventsThisWeek([
//            ListItem(title: "JustDance", image: "JustDance"),
//            ListItem(title: "Dog tooth Sneakers", image: "DogtoothSneakers"),
//            ListItem(title: "JustDance", image: "JustDance"),
//            ListItem(title: "Dog tooth Sneakers", image: "DogtoothSneakers"),
//            ListItem(title: "JustDance", image: "JustDance"),
//            ListItem(title: "Dog tooth Sneakers", image: "DogtoothSneakers"),
//            
//
//        ])
//    }()

    var pageData: [ListSection] {
        return [ recommended]
    }
}
