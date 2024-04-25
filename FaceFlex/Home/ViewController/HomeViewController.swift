//
//  HomeViewController.swift
//  Club_Connect
//
//  Created by student on 11-04-2024.
//
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var scannerButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let sections = MockData.shared.pageData
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sections.count)
        
        
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 120, y: 26, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = getCurrentDate()
            firstLabel.textColor = .gray
            firstLabel.font = UIFont.boldSystemFont(ofSize: 17)
           
            navigationBar.addSubview(firstLabel)
        }
        
     
        setUpTopNavbar()
        
        collectionView.collectionViewLayout = createLayout()

    }
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .recommended:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .eventsThisWeek:
                // Adjust layout for the eventsThisWeek section if needed
                return nil
            }
        }
    }

    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return supplementaryItem
    }

    
    func setUpTopNavbar(){
       
    }
    
    @objc func scannerButtonTapped() {
        
    }
    
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: Date())
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        
        case .eventsThisWeek(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortaitModeCollectionViewCell", for: indexPath) as! PortaitModeCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
            
        case .recommended(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LandscapeCollectionViewCell", for: indexPath) as! LandscapeCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewReusableView", for: indexPath) as! CollectionViewReusableView
            header.setup(sections[indexPath.section].title)
            return header
        default:
            fatalError("Unexpected supplementary view kind: \(kind)")
        }
    }

}
