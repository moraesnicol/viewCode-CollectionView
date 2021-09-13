//
//  ViewController.swift
//  viewCode-CollectionView
//
//  Created by Gabriel on 12/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private var sections: [String] = []
    private var colors: [[Color]] = []
    
    
    private let colorCellReuseIdentifier  = "colorCellReuseIdentifier"
    private let headerReuseIdentifier = "headerReuseIdentifier"
    private let cellPadding: CGFloat  = 8
    private let sectionPadding: CGFloat  = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        sections = ["Neutrals", "Warm Colors", "Cool Colors" ]
        colors = [[
            Color(color: UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1), hex: "#5e5e5e"),
            Color(color: UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1), hex: "#a3a3a3"),
        ], [
            Color(color: UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1), hex: "#ff9500"),
            Color(color: UIColor(red: 255/255, green: 191/255, blue: 0/255, alpha: 1), hex: "#ffbf00"),
            Color(color: UIColor(red: 255/255, green: 89/255, blue: 0/255, alpha: 1), hex: "#ff5900"),
            Color(color: UIColor(red: 244/255, green: 34/255, blue: 0/255, alpha: 1), hex: "#e022ee"),
        ], [
        Color(color: UIColor(red: 68/255, green: 126/255, blue: 201/255, alpha: 1), hex: "#447ec9"),
        Color(color: UIColor(red: 122/255, green: 158/255, blue: 204/255, alpha: 1), hex: "#7a9ecc"),
        Color(color: UIColor(red: 21/255, green: 39/255, blue: 87/255, alpha: 1), hex: "#152757"),
        Color(color: UIColor(red: 23/255, green: 164/255, blue: 207/255, alpha: 1), hex: "#17a4cf"),
        Color(color: UIColor(red: 113/255, green: 28/255, blue: 217/255, alpha: 1), hex: "#711cd9"),
        Color(color: UIColor(red: 50/255, green: 8/255, blue: 158/255, alpha: 1), hex: "#32089e"),
        ]]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = cellPadding
        layout.minimumLineSpacing = cellPadding
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: colorCellReuseIdentifier)
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        setupConstraints()
    }
    
    func setupConstraints() {
        let collectionViewPadding: CGFloat = 12
        
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding),
                
            ])
        }
    

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colorCellReuseIdentifier, for: indexPath) as! ColorCollectionViewCell
        
        cell.configure(for: colors[indexPath.section][indexPath.item])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! HeaderView
        header.setTitle(title: sections[indexPath.section])
        return header

    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - cellPadding) / 2.0
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 48.0)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        colors[indexPath.section][indexPath.item].selected = !colors[indexPath.section][indexPath.item].selected
        collectionView.reloadData()
        return
    }
}


