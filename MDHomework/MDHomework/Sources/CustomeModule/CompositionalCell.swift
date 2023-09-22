//
//  CompositionalCell.swift
//  MDHomework
//
//  Created by Илья Капёрский on 19.09.2023.
//

import UIKit

class CompositionalCell: UICollectionViewCell {
    
    static let identifier = "CompositionalCell"
    
    // MARK: - Outlets
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var count: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(count)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            count.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 3),
            count.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
        ])
    }
    
    // MARK: - Configuration
    
    func configuration(model: Model) {
        self.title.text = model.mainTitle
        self.count.text = model.count
        self.image.image = UIImage(named: model.image)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
