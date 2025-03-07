//
//  TableView.swift
//  MyFirstProject
//
//  Created by 윤주형 on 3/4/25.
//

import UIKit
import SwiftUI

class TableViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var navRightBarButton: UIBarButtonItem!
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        var savedResolutions = UserDefaults.standard.array(forKey: "resolveMessage") as? [String] ?? []
        savedResolutions.append(text)
        UserDefaults.standard.set(savedResolutions, forKey: "resolveMessage")
        print(#fileID, #function, #line, "savedResolutions = \(savedResolutions)")
        
    }
    
    @IBAction func navButtonClicked(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func chageView(_ sender: UIButton) {
        if let cardVC = storyboard?.instantiateViewController(withIdentifier: "CardVC") as? CardVC {
            print(#fileID, #function, #line, "check line")
            navigationController?.pushViewController(cardVC, animated: true)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

