//
//  CardVC.swift
//  MyFirstProject
//
//  Created by 윤주형 on 3/7/25.
//

import UIKit
import Foundation

class CardVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var resolutions: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        resolutions = UserDefaults.standard.array(forKey: "resolveMessage") as? [String] ?? []
        print(resolutions)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resolutions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResolutionCell", for: indexPath)
        cell.textLabel?.text = resolutions[indexPath.row]
        return cell
    }
}
