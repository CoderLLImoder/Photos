//
//  ViewController.swift
//  MDHomework
//
//  Created by Илья Капёрский on 17.09.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CompositionalCell.self, forCellWithReuseIdentifier: CompositionalCell.identifier)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
        collectionView.register(CellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier)
        return collectionView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in
            

            if section == 0 || section == 1 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                       heightDimension: .fractionalWidth(1 / 1.8 * 2))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            }
            else
            {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(44))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            }
        }
    }
}
    

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Model.modelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Model.modelsArray[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 || indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompositionalCell.identifier, for: indexPath) as! CompositionalCell
            cell.configuration(model: Model.modelsArray[indexPath.section][indexPath.row])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as! ListCell
            cell.configuration(model: Model.modelsArray[indexPath.section][indexPath.row])
            if indexPath.row < Model.modelsArray[indexPath.section].count - 1 {
                cell.setDelimiter()
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.title.text = "My album"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.title.text = "Shared album"
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.title.text = "Media Types"
            return header
        case 3:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.title.text = "Utilities"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ListCell.identifier, for: indexPath)
            return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = Model.modelsArray[indexPath.section][indexPath.row]
        print(cell.mainTitle)
    }
}


