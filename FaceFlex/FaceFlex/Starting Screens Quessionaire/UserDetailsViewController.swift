//
//  UserDetailsViewController.swift
//  FaceFlex
//
//  Created by student on 03/05/24.
//

import UIKit

class UserDetailsViewController: UIViewController,UITextFieldDelegate {
    /// Text field for entering the user's age.
    @IBOutlet weak var ageTextField: UITextField!
    /// Text field for entering the user's gender.
    @IBOutlet weak var genderTextField: UITextField!
    /// Text field for entering the user's name.
    @IBOutlet weak var nameTextField: UITextField!
    
    
    /// The currently active text field.
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set text field delegates
        nameTextField.delegate = self
        ageTextField.delegate = self
        genderTextField.delegate = self
               
               // Register for keyboard notifications
               NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
               NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
               
               // Add tap gesture recognizer to dismiss keyboard when tapping outside of text fields
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
               view.addGestureRecognizer(tapGesture)
   
        // Set focus on the name text field
        nameTextField.becomeFirstResponder()
        
    }
    
    // Function to handle keyboard will show event
        @objc func keyboardWillShow(notification: Notification) {
            
            print("Keyboard will show i sappearing")
            guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
            }
            
            let keyboardHeight = keyboardFrame.height
            
            // Get the bottom position of the active text field
            guard let activeTextField = activeTextField else { return }
            let textFieldBottom = activeTextField.convert(activeTextField.bounds, to: view).maxY
            
            // Calculate the difference between the bottom of the text field and the top of the keyboard
            let offset = textFieldBottom - (view.frame.height - keyboardHeight)
            
            // Adjust the view's frame if needed to bring the text field above the keyboard
            if offset > 0 {
                view.frame.origin.y -= offset
            }
        }
        
        // Function to handle keyboard will hide event
        @objc func keyboardWillHide(notification: Notification) {
            view.frame.origin.y = 0
        }
        
        // Function to dismiss keyboard when tapping outside of text fields
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
        
        // UITextFieldDelegate method to set active text field
        func textFieldDidBeginEditing(_ textField: UITextField) {
            activeTextField = textField
        }
        
        // UITextFieldDelegate method to clear active text field
        func textFieldDidEndEditing(_ textField: UITextField) {
            activeTextField = nil
        }
        
        // UITextFieldDelegate method to dismiss keyboard when return key is pressed
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // Dismiss keyboard when return key is pressed on either text field
            textField.resignFirstResponder()
            return true
        }
        
        // Don't forget to remove observers
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
    
    func showAlert(message: String) {
           let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(okAction)
           present(alertController, animated: true, completion: nil)
       }

    @IBAction func doneButtonUserDetails(_ sender: UIBarButtonItem) {
   
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Validate name field
        guard let nameText = nameTextField.text, !nameText.isEmpty else {
            showAlert(message: "Please fill out the name field.")
            return
        }
        
        // Validate age field
        guard let ageText = ageTextField.text, !ageText.isEmpty else {
            showAlert(message: "Please fill out the age field.")
            return
        }
        
        // Validate gender field
        guard let genderText = genderTextField.text, !genderText.isEmpty else {
            showAlert(message: "Please fill out the gender field.")
            return
        }
        
        // Create UserDetails instance with entered information
//        let user = makePresentUser(name: nameText, age: ageText, gender: genderText)
//       // print(user)
        UserManager.shared.makePresentUser(name: nameText, age: ageText, gender: genderText)
      
    }
    @IBAction func unwindToUserDetails(segue: UIStoryboardSegue) {
        
     

        
    }

}

//    @IBAction func doneButtonUserDetails(_ sender: UIBarButtonItem) {
//        guard let nameText = nameTextField.text, !nameText.isEmpty else {
//              showAlert(message: "Please fill out the name field.")
//              return
//          }
//
//          // Validate age field
//          guard let ageText = ageTextField.text, !ageText.isEmpty else {
//              showAlert(message: "Please fill out the age field.")
//              return
//          }
//
//          // Validate gender field
//          guard let genderText = genderTextField.text, !genderText.isEmpty else {
//              showAlert(message: "Please fill out the gender field.")
//              return
//          }
//
//    }
