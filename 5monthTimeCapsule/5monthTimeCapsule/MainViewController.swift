//
//  ViewController.swift
//  5monthTimeCapsule
//
//  Created by 윤주형 on 3/5/25.
//

import Foundation
import UIKit

struct tableViewItem {
    let storageImage: UIImage
    let storageName: String
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var userList: [String] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: StorageTableViewCell.identifier, for: indexPath) as! StorageTableViewCell
        
//        let item = userList[indexPath.row]
//            cell.title.text = item
        
        // 다시 봐야할 부분 defaultContentConfiguration()
//        var content = cell.defaultContentConfiguration()
//        content.text = userList[indexPath.row]
//        cell.contentConfiguration = content
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexpath: IndexPath) {
        let ff = userList[indexpath.row]
            print("네비게이션 푸시하기전 \(ff)")
        let detailCardVC = DetailCardVC()
        detailCardVC.rowString = ff
        
        navigationController?.pushViewController(detailCardVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Header"
    }
    
    // titleForHeaderInSection 중복되면 색만 나오는 이슈 있음 왜인지는 아직
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let vw = UIView()
//        vw.backgroundColor = UIColor.systemPink
//        
//
//        return vw
//    }
    
    
    var tableview = UITableView(frame: .zero , style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        addTableView()
        register()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigationRightButtonItemTapped))
        navigationItem.rightBarButtonItem?.accessibilityRespondsToUserInteraction = true
        navigationItem.rightBarButtonItem?.tintColor = .black
//        view.backgroundColor = UIColor(red: 0.09, green: 0.63, blue: 0.52, alpha: 1)
        
    }
    
    @objc func navigationRightButtonItemTapped() {
        
        let newItem = ""
        userList.append(newItem)  // data 배열에 새 항목 추가
        print(#fileID, #function, #line, "추가확인 \(userList)")
        
        let newIndexPath = IndexPath(row: userList.count - 1, section: 0)

        tableview.insertRows(at: [newIndexPath], with: .automatic)
    }
    private func register() {
        tableview.register(StorageTableViewCell.self, forCellReuseIdentifier: StorageTableViewCell.identifier)
    }
    
    
    
    func getNewItem() {
        let detailCardVC = DetailCardVC()
        
        detailCardVC.newTitleItem = { [weak self] newTitle in
            self?.userList.append(newTitle)
            print("새로운 제목: \(newTitle)")
        }
    }
    
    private func addTableView() {
        view.addSubview(tableview)
//        tableview.rowHeight = 40
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}



