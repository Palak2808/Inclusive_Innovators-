//
//  FurtherTipViewController.swift
//  FaceFlex
//
//  Created by student on 06/05/24.
//

import UIKit

class FurtherTipViewController: UIViewController {

    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var ingridentsView: UITextView!
    
    @IBOutlet weak var methodView: UITextView!
    @IBOutlet weak var tipDescription: UILabel!
    @IBOutlet weak var tip: UILabel!
    var selectedTipData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard selectedTipData.count >= 5 else {
                   return // Exit if the data is incomplete
               }
               
               // Set image
        if selectedTipData.indices.contains(0) {
            let imageName = selectedTipData[0]
            imageview.image = UIImage(named: imageName)
        }
               // Set tip name
               tip.text = selectedTipData[1]
               
               // Set tip description
               tipDescription.text = selectedTipData[2]
               
               // Set ingredients
        ingridentsView.text = selectedTipData[3]
               
               // Set method
        methodView.text = selectedTipData[4]
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

}
