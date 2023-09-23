//
//  CellHeader.swift
//  MDHomework
//
//  Created by Илья Капёрский on 19.09.2023.
//

import UIKit

final class CellHeader: UICollectionReusableView {
    
    static let identifier = "CellHeader"
    
    private enum CustomConstraints: CGFloat {
        case padding1 = 1
        case padding25 = 25
    }
    
    // MARK: - Outlets
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CustomConstraints.padding25.rawValue, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var delimiter: UIView = {
        let delimiter = UIView()
        delimiter.backgroundColor = .systemFill
        delimiter.translatesAutoresizingMaskIntoConstraints = false
        return delimiter
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        self.addSubview(title)
        self.addSubview(delimiter)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: self.leftAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            delimiter.leftAnchor.constraint(equalTo: self.leftAnchor),
            delimiter.rightAnchor.constraint(equalTo: self.rightAnchor),
            delimiter.topAnchor.constraint(equalTo: self.topAnchor),
            delimiter.heightAnchor.constraint(equalToConstant: CustomConstraints.padding1.rawValue)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}

