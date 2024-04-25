

import Foundation

enum ListSection {
  //  case stories([ListItem])
    case recommended([ListItem])
   // case eventsThisWeek([ListItem])
    
    var items: [ListItem] {
        switch self {
        case  .recommended(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        
        case .recommended:
            return "Recommended"
       
        }
    }
}
