//
//  JournalCollectionViewController.swift
//  FaceFlex
//
//  Created by student on 30/04/24.
//
import UIKit

class CurrentWeekJournalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var journalTableView: UITableView!
    
 
    @IBOutlet weak var imagePresentHomeJournal: UIImageView!
    
    @IBOutlet var viewr1: [UIView]!
   var CurrentMomentsInstance : [CurrentMoments] = CurrentMomentsManager.getAllCurrentMoments()

    var tappedBoxView: UIView?
   var captured: UIImage?
    var selectedIndex: Int?
    var selectedDate: Date?
    var userDescription: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("hello")
        for boxView in viewr1 {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(boxTapped(_:)))
            boxView.addGestureRecognizer(tapGesture)
        }
        journalTableView.reloadData()
        
    }

    
    @objc func boxTapped(_ sender: UITapGestureRecognizer) {
        // Check if camera is available
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("Camera is not available")
            return
        }

        // Get the tapped view
        guard let tappedBoxView = sender.view else { return }
        //storing the tapped box view
        self.tappedBoxView = tappedBoxView

        // Present camera interface
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true)
        
        print("Segue will be performed after capturing image")
        // Capture the current date
               selectedDate = Date()
    }


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Handle image captured by camera here
        if let image = info[.originalImage] as? UIImage {
            // Store the captured image
   
           imagePresentHomeJournal.image = image
            captured = image
            CurrentMomentsInstance.insert(CurrentMoments(image: captured!, weekDate: selectedDate!, description: "Feeling very fresh"), at: 0)
            print(CurrentMomentsInstance)
            journalTableView.reloadData()

            // Dismiss the image picker
            picker.dismiss(animated: true) { [weak self] in
                print("Image picker dismissed, performing segue...")
                // Perform segue to transition to SetImageViewContoller
                self?.performSegue(withIdentifier: "showSetImageViewContoller", sender: nil)
            }
        } 
        else {
            picker.dismiss(animated: true, completion: nil)
        }
       

    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSetImageViewContoller" {
            if let destinationVC = segue.destination as? UINavigationController {
                if let svc = destinationVC.viewControllers[0] as? SetViewController {
                    // Pass the captured image to SetImageViewContoller
                    svc.capturedImage = captured
                    print("Image to setViewControllere has been passed")
                }
            }
            
        }
        
        print("Segue")
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(CurrentMomentsInstance.count)
        if(CurrentMomentsInstance.count == 0)
        {
            return 1
        }
        else{
            return CurrentMomentsInstance.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell = journalTableView.dequeueReusableCell(withIdentifier: "currentCell", for: indexPath) as! JournalCurrentTableViewCell
        if(CurrentMomentsInstance.count == 0)
        {
            return cell
        }
        // Retrieve data for the current row
        let data = CurrentMomentsInstance[indexPath.row]
       
        var date = data.weekDate
        // Convert date to string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
         
        // Assign data to cell
        cell.DayLabel.text = dateString
//        cell.DescriptionLabel.text = userDescription
        cell.DescriptionLabel.text = data.description
        print(cell.DescriptionLabel.text!)
        
        
        cell.ImageView.image = data.image
       
        return cell
    }
    @IBAction func unwindToJournalViewController(segue: UIStoryboardSegue) {
        // Add any necessary code to handle the unwind action
       // exerciseTableView.reloadData()
    }
    

}
