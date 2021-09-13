//
//  HeaderCollectionReusableView.swift
//  viewCode-CollectionView
//
//  Created by Gabriel on 13/09/21.
//

import UIKit

class HeaderView: UICollectionReusableView {
        
    private var label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .gray
        addSubview(label)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setTitle(title: String) {
        label.text = title
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
