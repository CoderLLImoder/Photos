//
//  ListCell.swift
//  MDHomework
//
//  Created by Илья Капёрский on 19.09.2023.
//

import UIKit

final class ListCell: UICollectionViewCell {
    
    private enum CustomConstraints: CGFloat {
        case padding1 = 1
        case padding10 = 10
        case padding15 = 15
        case padding20 = 20
        case padding50 = 50
    }
    
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
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: CustomConstraints.padding10.rawValue),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: CustomConstraints.padding50.rawValue),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            chevron.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -CustomConstraints.padding15.rawValue),
            chevron.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            count.rightAnchor.constraint(equalTo: chevron.rightAnchor, constant: -CustomConstraints.padding20.rawValue),
            count.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            lockImage.rightAnchor.constraint(equalTo: chevron.rightAnchor, constant: -CustomConstraints.padding20.rawValue),
            lockImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            delimiter.leftAnchor.constraint(equalTo: title.leftAnchor),
            delimiter.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            delimiter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            delimiter.heightAnchor.constraint(equalToConstant: CustomConstraints.padding1.rawValue)
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

