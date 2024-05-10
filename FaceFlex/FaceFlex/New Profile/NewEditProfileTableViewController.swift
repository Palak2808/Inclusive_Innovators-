//
//  NewEditProfileTableViewController.swift
//  FaceFlex
//
//  Created by student on 05/05/24.
//
//
//import UIKit
//
////protocol PassDataToVC: AnyObject {
////    func passData(name: String, skinType: String, targetProblem: String, profilePicture: Data?)
////}
//
//import PassDataToVC
//
//class NewEditProfileTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    
//    
//    
//    
//    @IBOutlet weak var ProfilePicture: UIImageView!
//    @IBOutlet weak var Name: UILabel!
//    @IBOutlet weak var SkinType: UILabel!
//    @IBOutlet weak var TargetProblem: UILabel!
//    
//    var defaultUsername = UserDefaults.standard.string(forKey: "Username") ?? "Name"
//    var defaultSkinType = UserDefaults.standard.string(forKey: "SkinType") ?? "Skin Type"
//    var defaultTargetProblem = UserDefaults.standard.string(forKey: "TargetProblem") ?? "Target Problem"
//    var defaultProfilePicture: Data? = UserDefaults.standard.data(forKey: "ProfilePicture")
//    weak var delegate: PassDataToVC?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let dataManager = PassDataToVC()
//                dataManager.passData(str: String)
//        // Default values initially
//        Name.text = defaultUsername
//        SkinType.text = defaultSkinType
//        TargetProblem.text = defaultTargetProblem
//        if let defaultProfilePictureData = defaultProfilePicture {
//            ProfilePicture.image = UIImage(data: defaultProfilePictureData)
//        } else {
//            ProfilePicture.image = UIImage(named: "image1")
//        }
//        ProfilePicture.layer.cornerRadius = ProfilePicture.bounds.width / 2
//        ProfilePicture.clipsToBounds = true
//    }
//    
//    // Pass data function inside the class
//    func passData(name: String, skinType: String, targetProblem: String, profilePicture: Data?) {
//        // Update default values
//        defaultUsername = name
//        defaultSkinType = skinType
//        defaultTargetProblem = targetProblem
//        defaultProfilePicture = profilePicture
//        
//        // Update UserDefaults
//        UserDefaults.standard.set(name, forKey: "Username")
//        UserDefaults.standard.set(skinType, forKey: "SkinType")
//        UserDefaults.standard.set(targetProblem, forKey: "TargetProblem")
//        UserDefaults.standard.set(profilePicture, forKey: "ProfilePicture")
//        
//        // Update UI elements
//        Name.text = name
//        SkinType.text = skinType
//        TargetProblem.text = targetProblem
//        if let profilePicData = profilePicture {
//            ProfilePicture.image = UIImage(data: profilePicData)
//        } else {
//            ProfilePicture.image = UIImage(named: "face")
//        }
//        ProfilePicture.layer.cornerRadius = ProfilePicture.bounds.width / 2
//        ProfilePicture.clipsToBounds = true
//    }
//    
//    // MARK: - UIImagePickerControllerDelegate
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            ProfilePicture.image = pickedImage
//            // Convert the picked image to Data and pass it to the delegate
//            if let imageData = pickedImage.jpegData(compressionQuality: 1.0) {
//                delegate?.passData(name: defaultUsername, skinType: defaultSkinType, targetProblem: defaultTargetProblem, profilePicture: imageData)
//            }
//        }
//        
//        picker.dismiss(animated: true, completion: nil)
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//}
////
