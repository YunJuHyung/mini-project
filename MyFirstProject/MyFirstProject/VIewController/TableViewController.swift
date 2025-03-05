//
//  TableView.swift
//  MyFirstProject
//
//  Created by 윤주형 on 3/4/25.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var navigationRightButton: UIButton!
    
    var fruitNames = ["Apple", "Grape", "Orange", "Banana", "Melon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    
    @IBAction func navigatioRightButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "추가할 과일을 입력해주세요", message: "추가할 과일을 입력해주세요", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "바나나가 너한테 바나나?"
        }
        
    
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            if let text = alert.textFields?.first?.text {
                print("입력된 값: \(text)")
                self.fruitNames.append(text)
                self.myTableView.reloadData()
            }
        }
        
    
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myFirstCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = fruitNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ cellSelected: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFruits = fruitNames[indexPath.row]
        let fruitsVC = FruitsVC()
        fruitsVC.fruitsName = selectedFruits
        
        navigationController?.pushViewController(fruitsVC, animated: true)
        print(#fileID, #function, #line, "check pushVC")
        
    }
}
