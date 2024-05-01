//
//  WorkoutsViewController.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import UIKit

class WorkoutsViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let skincareImages : [String] = ["skincare1","skincare2","washcare"]
    let label : [String] = ["Skin Care" ,"Basic Diet", "Wash Care"]

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == additionalCollectionView{
            label.count
        } else {
            labelText.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == additionalCollectionView{
            let Cell = additionalCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CAdditionalSkincareollectionViewCell
            Cell.additionalImage.image = UIImage(named: skincareImages[indexPath.row])
            Cell.skincareName.text = label[indexPath.row]
            
            Cell.layer.cornerRadius  = 10
            Cell.additionalImage.contentMode = .scaleAspectFit
            Cell.additionalImage.clipsToBounds = true
            //        cell.layer.borderWidth = 1
            return Cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", for: indexPath) as! WorkoutsCollectionViewCell
            cell.workoutImage.image = UIImage(named: images[indexPath.row])
            cell.workoutLabel.text = labelText[indexPath.row]
            cell.numberOfExerciseLabel.text = labelText[indexPath.row]
            cell.layer.cornerRadius = 10
            
            return cell
        }
    }
    
 
    @IBOutlet weak var additionalCollectionView: UICollectionView!
    
    @IBOutlet weak var libraryCollectionView: UICollectionView!
    

    let images : [String] = ["w11","w12","w13"]
    let labelText : [String] = ["Forehead" ,"Jawline", "Eyes"]
    let exerciseLabelText : [String] = ["5 Exercises","4 Exercises","5 Exercises"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      libraryCollectionView.delegate = self
      libraryCollectionView.dataSource = self
      additionalCollectionView.delegate = self
      additionalCollectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        
       // libraryCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
          //additionalCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    
    
    
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        labelText.count
//    }
//    
//    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", for: indexPath) as! WorkoutsCollectionViewCell
//        cell.workoutImage.image = UIImage(named: images[indexPath.row])
//        cell.workoutLabel.text = labelText[indexPath.row]
//        cell.numberOfExerciseLabel.text = labelText[indexPath.row]
//        cell.layer.cornerRadius = 10
//        
//        return cell
//        
//    }
//    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)
        return CGSize(width: size, height: size)
    }
    
    //-----------------
//    
//    let skincareImages : [String] = ["skincare1","skincare2","skincare3"]
//    let label : [String] = ["Skin Care" ,"Basic Diet", "Wash Care"]
//    
   
//    
//    func additionalCollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        label.count
//    }
//    
//    func additionalCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let Cell = additionalCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CAdditionalSkincareollectionViewCell
//        Cell.additionalImage.image = UIImage(named: skincareImages[indexPath.row])
//        Cell.skincareName.text = label[indexPath.row]
//        
//        Cell.layer.cornerRadius  = 10
//        Cell.additionalImage.contentMode = .scaleAspectFit
//        Cell.additionalImage.clipsToBounds = true
////        cell.layer.borderWidth = 1
//        return Cell
//        
//    }
    func additionalCollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)
        return CGSize(width: size, height: size)
    }
    
}
