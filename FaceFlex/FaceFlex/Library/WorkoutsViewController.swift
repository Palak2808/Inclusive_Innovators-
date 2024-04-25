//
//  WorkoutsViewController.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import UIKit

class WorkoutsViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
  
    
    @IBOutlet weak var libraryCollectionView: UICollectionView!
    
    let images : [String] = ["w11","w12","w13"]
    let labelText : [String] = ["Forehead" ,"Jawline", "Eyes"]
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryCollectionView.delegate = self
        libraryCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        labelText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WorkoutsCollectionViewCell
        cell.workoutImage.image = UIImage(named: images[indexPath.row])
        cell.workoutLabel.text = labelText[indexPath.row]
        cell.layer.cornerRadius  = 10
        cell.layer.borderWidth = 1
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)
        return CGSize(width: size, height: size)
    }
    
}
