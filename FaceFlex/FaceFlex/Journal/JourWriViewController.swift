//
//  JourWriViewController.swift
//  FaceFlex
//
//  Created by student on 01/05/24.
//

import UIKit

class JourWriViewController: UIViewController {
    
    @IBOutlet weak var nextWeek: UIView!
    @IBOutlet weak var previousWeek: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {

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


