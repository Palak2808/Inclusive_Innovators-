//
//  PlannedCourseCollectionViewController.swift
//  FaceFlex
//
//  Created by student on 25/04/24.
//

import UIKit

class PlannedCourseCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title2.count
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var articleTableView: UITableView!
    
    
    
    
    let images : [String] = ["image1","image2"]
    let labelText : [String] = ["5 Exercises" ,"4 Exercises"]
    let labelTextForExercise : [String] = ["Wrinkle Free", "Fine Lines"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,repeatingSubitem: item,count:2)
        let spacing = CGFloat(20)
        group.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: 0, bottom: 0, trailing: 0)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        labelText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PlannedCourseCollectionViewCell
        
        cell.wrinkleImage.image = UIImage(named: images[indexPath.row])
        //        cell.wrinkleImage.contentMode = .scaleAspectFill
        cell.courseName.text = labelText[indexPath.row]
        cell.exerciseLabel.text = labelTextForExercise[indexPath.row]
        cell.wrinkleImage.contentMode = .scaleAspectFit
        cell.wrinkleImage.clipsToBounds = true
        return cell
    }
    
    let articleImageArray = ["image4","w4"]
    let title2 : [String] = ["Facial Exercise Impacts","Do's and Dont's"]
    let description2 : [String] = ["Checkout","Read Now"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let pic = articleImageArray[indexPath.row]
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        cell.articleName.text = title2[indexPath.row]
        cell.articleDescription.text = description2[indexPath.row]
        cell.articleImage.image = UIImage(named: articleImageArray[indexPath.row])
        cell.articleName.layer.cornerRadius = 10
        cell.articleName.contentMode = .scaleAspectFit
        
        
        
        return cell
        //    }
        
    }
}
