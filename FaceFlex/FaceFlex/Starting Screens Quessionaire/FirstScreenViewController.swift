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
    
    /// Action method invoked when a button is clicked to navigate to the tab bar controller.
    /// - Parameter sender: The button that triggers the action.
    @IBAction func buttonClicked(_ sender: UIButton) {
        navigateToTabBarController()
    }
    /// Navigates to the tab bar controller.
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
