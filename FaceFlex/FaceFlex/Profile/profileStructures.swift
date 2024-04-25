//
//  profileStructures.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import Foundation
import UIKit

struct Profile {
    var image: UIImage!
    var name: String
    var personalDetails: PersonsDetails
}

struct PersonsDetails {
    var name: String
    var skinType = ["Oily", "Combination", "Dry", "Normal"]
    var targetAreas = ["Forehead", "Eyes", "Nose", "Lips", "Cheeks", "Jawline", "Neck"]
    var course: String
}

struct NotificationDetails {
    var time: TimeDetails
    var preferredTime: Int
    var reminder: UISwitch

    init() {
        self.time = TimeDetails()
        self.preferredTime = self.time.preferredTime
        self.reminder = UISwitch()
    }
}

struct TimeDetails {
    var preferredTime: Int // Declare preferredTime variable of type Int
    
    init() {
        // Get the current time
        let currentDate = Date()
        // Extract the hour component
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        
        // Initialize preferredTime with the extracted hour component
        preferredTime = hour
    }
}


