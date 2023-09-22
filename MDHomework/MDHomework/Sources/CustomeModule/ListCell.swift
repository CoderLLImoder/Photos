//
//  ListCell.swift
//  MDHomework
//
//  Created by Илья Капёрский on 19.09.2023.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    static let identifier = "ListCell"
    // MARK: - Outlets
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var delimiter: UIView = {
        let delimiter = UIView()
        delimiter.backgroundColor = .systemBackground
        delimiter.translatesAutoresizingMaskIntoConstraints = false
        return delimiter
    }()
        
    private lazy var count: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let lockImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor.gray
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let chevron: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = UIColor.gray
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        contentView.addSubview(lockImage)
        contentView.addSubview(chevron)
        contentView.addSubview(delimiter)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 50),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            chevron.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            chevron.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            count.rightAnchor.constraint(equalTo: chevron.rightAnchor, constant: -20),
            count.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            lockImage.rightAnchor.constraint(equalTo: chevron.rightAnchor, constant: -20),
            lockImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            delimiter.leftAnchor.constraint(equalTo: title.leftAnchor),
            delimiter.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            delimiter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            delimiter.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configuration(model: Model) {
        self.title.text = model.mainTitle
        if model.count != nil
        {
            self.count.text = model.count
        }
        else
        {
            self.lockImage.image = UIImage(systemName: "lock.fill")
        }
        self.image.image = UIImage(systemName: model.image)
    }
    
    func setDelimiter()
    {
        self.delimiter.backgroundColor = .systemFill
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.lockImage.image = nil
        self.count.text = ""
    }
}

