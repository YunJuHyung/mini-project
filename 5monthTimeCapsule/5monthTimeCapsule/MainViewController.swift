//
//  ViewController.swift
//  5monthTimeCapsule
//
//  Created by 윤주형 on 3/5/25.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    var tableview = UITableView(frame: .zero , style: .insetGrouped)
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(red: 0.09, green: 0.63, blue: 0.52, alpha: 1)
        
    }
    
    
    private func addTableView() {
        view.addSubview(tableview)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableview.delegate = self
        tableview.dataSource = self
        
        
        
    }


}

