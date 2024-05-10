////
////  NewProfileTableViewController.swift
////  FaceFlex
////
////  Created by student on 05/05/24.
////
///*
///
///
///
///
//










import UIKit

//protocol PassDataToVC {
//    func passData(str: String)
//}

//protocol PassDataToVC: AnyObject {
//    func passData(name: String, skinType: String, targetProblem: String, profilePicture: Data?)
//}

class NewProfileTableViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var ProfilePicture: UIImageView!
    var data = ""
      var delegate: PassDataToVC!
   
      override func viewDidLoad() {
          super.viewDidLoad()
          ProfilePicture.layer.masksToBounds = true
          ProfilePicture.layer.cornerRadius = ProfilePicture.frame.height / 2
      }
    
    @IBAction func editButton(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.allowsEditing = true
                picker.delegate = self
                present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.editedImage] as? UIImage else { return }
            
            ProfilePicture.image = image
            dismiss(animated: true)
        }
     }



