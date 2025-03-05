//
//  Untitled.swift
//  MyFirstProject
//
//  Created by 윤주형 on 3/5/25.
//


import Foundation
import UIKit

class FruitsVC: UIViewController {
    
    var fruitsName: String?
    private let label = UILabel()
    
    override func viewDidLoad() {
        
        checkFruitsName(loadedFruitName: fruitsName ?? "")
        addLabel()
        print(#fileID, #function, #line, "figure fruitsName = \(fruitsName ?? "")")
        
    }
    
    private func checkFruitsName(loadedFruitName: String){
        
        switch  loadedFruitName {
        case "Apple":
            view.backgroundColor = .red
        case "Grape":
            view.backgroundColor = .purple
        case "Orange":
            view.backgroundColor = .orange
        case "Banana":
            view.backgroundColor = .yellow
        case "Melon":
            view.backgroundColor = .green
        default:
            view.backgroundColor = UIColor(
                red: CGFloat.random(in: 0...1),
                green: CGFloat.random(in: 0...1),
                blue: CGFloat.random(in: 0...1),
                alpha: 1.0
            )
            print(#fileID, #function, #line, LocalizedError.self)
        }
    }
    
    private func addLabel() {
        label.text = fruitsName!
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}
