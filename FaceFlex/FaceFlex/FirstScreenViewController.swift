////
////  FirstScreenViewController.swift
////  FaceFlex
////
////  Created by student on 06/05/24.
////
//
import UIKit

class FirstScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        navigateToTabBarController()
    }
    
    func navigateToTabBarController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let tabBarController = storyboard.instantiateViewController(withIdentifier: "tab") as? UITabBarController else {
            return
        }
        
        // Customize behavior if needed (e.g., set selected tab index)
        tabBarController.selectedIndex = 0 // For example, select the first tab
        
        // Present or push the tab bar controller onto the screen
        navigationController?.pushViewController(tabBarController, animated: true)
        // OR
        // present(tabBarController, animated: true, completion: nil)
    }
}
