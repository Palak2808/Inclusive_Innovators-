//
//  JourWriViewController.swift
//  FaceFlex
//
//  Created by student on 01/05/24.
//

import UIKit

class JournalWriteViewController: UIViewController {
    
    @IBOutlet weak var nextWeek: UIView!
    @IBOutlet weak var previousWeek: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  
      /// Action triggered by segmented control value change.
     
      /// - Parameter sender: The segmented control.
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        // Show next week view if first segment is selected, otherwise show previous week view
        if sender.selectedSegmentIndex == 0{
            nextWeek.alpha = 1
            previousWeek.alpha = 0
            print(nextWeek)
            
            
        }
        else{
            nextWeek.alpha = 0
            previousWeek.alpha = 1
        }

   }
        
}


