//
//  calendarViewController.swift
//  FaceFlex
//
//  Created by student on 03/05/24.
//

import UIKit
import FSCalendar
class calendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    fileprivate weak var calendar: FSCalendar!

        override func loadView() {
            let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 50, height: 80))
            calendar.dataSource = self
            calendar.delegate = self
            view = calendar
            self.calendar = calendar
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            // Additional setup after loading the view.
        }

        // FSCalendarDataSource

        func minimumDate(for calendar: FSCalendar) -> Date {
            return Date()
        }

        func maximumDate(for calendar: FSCalendar) -> Date {
            return calendar.gregorian.date(byAdding: .year, value: 8, to: Date())!
        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
