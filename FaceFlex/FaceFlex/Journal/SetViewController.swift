//
//  SetViewController.swift
//  FaceFlex
//
//  Created by student on 05/05/24.
//

import UIKit

class SetViewController: UIViewController ,UITextFieldDelegate{

    var CurrentMomentsInstance : [CurrentMoments] = CurrentMomentsManager.getAllCurrentMoments()
    // Outlets for UI elements
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var capturedImageView: UIImageView!
    // Variables to store captured image and user description
    var capturedImage: UIImage?
    
    // Variable to track active text field
    var activeTextField: UITextField?
    var userDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Check if captured image is available
        if let capturedImage {
            print(capturedImage)
        }
        // Assign text field delegate and handle keyboard notifications
        userDescription = descriptionTextField.text
        guard let img = capturedImage else {
            // Handle error, such as logging or presenting an alert
            print("Error: No captured image available")
            return
        }
     
               
               // Register for keyboard notifications
               NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
               NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
               
               // Add tap gesture recognizer to dismiss keyboard when tapping outside of text fields
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
               view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
        
     //  writingTextField.becomeFirstResponder()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        capturedImageView.image = capturedImage
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
            userDescription = descriptionTextField.text
            CurrentMomentsInstance[0].description = userDescription!
        }
        
        // UITextFieldDelegate method to set active text field
        func textFieldDidBeginEditing(_ textField: UITextField) {
            // Set active text field when editing begins
            activeTextField = textField
        }
        
       
        func textFieldDidEndEditing(_ textField: UITextField) {
            // Clear active text field when editing ends
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
    @IBAction func doneButtonTapped(_ sender: UIBarItem) {
         // Get the instance of JournalCollectionViewController
         if let journalVC = presentingViewController as? CurrentWeekJournalViewController {
             // Pass the captured image and user description to JournalCollectionViewController
             //journalVC.capturedImage = capturedImage
             journalVC.userDescription = userDescription
         }
         // Dismiss the current view controller
         dismiss(animated: true, completion: nil)
     }

        // Do any additional setup after loading the view.
    }
    


