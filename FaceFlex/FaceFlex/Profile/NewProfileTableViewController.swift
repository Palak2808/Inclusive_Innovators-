////
////  NewProfileTableViewController.swift
////  FaceFlex
////
////  Created by student on 05/05/24.
////
///*

import UIKit

class NewProfileTableViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profileName: UILabel! // Label to display the user's name
    
    @IBOutlet weak var ProfilePicture: UIImageView! // Image view to display the user's profile picture
      var data = "" // Placeholder property for future use
      override func viewDidLoad() {
          super.viewDidLoad()
          
          // Configure profile picture view
          ProfilePicture.layer.masksToBounds = true
          ProfilePicture.layer.cornerRadius = ProfilePicture.frame.height / 2
          
          // Set profile name
          
          profileName.text = (UserManager.shared.returnName())
      }
    
    // Action triggered when the user taps the edit button to change the profile picture.
    @IBAction func editButton(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.allowsEditing = true
                picker.delegate = self
                present(picker, animated: true)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.editedImage] as? UIImage else { return }
            
        // Set the selected image as the profile picture
            ProfilePicture.image = image
            dismiss(animated: true)
        }
     }



