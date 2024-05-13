//
//  WorkoutsViewController.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import UIKit

class WorkoutsViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var workoutInstance: [Workouts] = WorkoutDataManager.getAllWorkoutDetails()
    var SkincareInstance : [AdditionalSkincare] = AdditionalSkincareManager.getAdditionalWorkoutDetails()

 
    @IBOutlet weak var additionalCollectionView: UICollectionView!
    
 
    @IBOutlet weak var libraryCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
      libraryCollectionView.delegate = self
      libraryCollectionView.dataSource = self
      additionalCollectionView.delegate = self
      additionalCollectionView.dataSource = self
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == additionalCollectionView{
            SkincareInstance.count
        } else {
            workoutInstance.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == additionalCollectionView{
            let data = SkincareInstance[indexPath.row]
            let Cell = additionalCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CAdditionalSkincareollectionViewCell
            Cell.additionalImage.image = UIImage(named: data.skincareImage)
            Cell.skincareName.text = data.skincareType
            
            Cell.additionalImage.layer.cornerRadius  = 10
            Cell.additionalImage.contentMode = .scaleAspectFit
            Cell.additionalImage.clipsToBounds = true
            //        cell.layer.borderWidth = 1
            return Cell
        } else {
            let data = workoutInstance[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", for: indexPath) as! WorkoutsCollectionViewCell
            cell.workoutImage.image = UIImage(named: String(data.workoutImage))
            cell.workoutLabel.text = data.workoutName
            cell.numberOfExerciseLabel.text = data.wrokoutDescription
            cell.workoutImage.layer.cornerRadius = 10
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10)
        return CGSize(width: size, height: size)
    }
    func additionalCollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10)
        return CGSize(width: size, height: size)
    }
    @IBAction func unwindToWorkoutViewController(_ unwindSegue: UIStoryboardSegue) {
           // This method will be called when the unwind segue is performed.
           // You can perform any necessary actions here.
       }
 
    
}
