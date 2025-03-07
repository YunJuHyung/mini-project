//
//  detailCardVC.swift
//  5monthTimeCapsule
//
//  Created by 윤주형 on 3/6/25.
//

import Foundation
import UIKit
import Photos
import PhotosUI

class DetailCardVC: UIViewController {
    
    var rowString: String?
    private var photoThumnail: [NSObject] = []
    var newTitleItem: ((String)->Void)?
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        //        setupStackView()
        setupImageViewGesture()
        
        setupUI()
        saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        if let rowString = rowString {
            titleTextField.text = rowString
            print("1")
        } else {
            print("2")
            titleTextField.text = "기본 텍스트"
        }
        
        
    }
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "다짐을 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = .black
        return textField
    }()
    
    private let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "이름을 입력해주세요"
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("저장하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupUI() {
        // 스택뷰 생성 및 설정
        let stackView = UIStackView(arrangedSubviews: [titleTextField, pictureImageView, nameTextField, saveButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            pictureImageView.heightAnchor.constraint(equalToConstant: 150),
            pictureImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    
    //reason: '+[_monthTimeCapsule.DetailCardVC imageViewTapped]: unrecognized selector sent to class 0x104d7a0a0'
    private func setupImageViewGesture() {
        let settingTap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        pictureImageView.isUserInteractionEnabled = true
        pictureImageView.addGestureRecognizer(settingTap)
    }
    
    @objc private func imageViewTapped() {
        print(#fileID, #function, #line, "check imageViewTapped")
        var config = PHPickerConfiguration()
        
        config.filter = .images
        
        config.selectionLimit = 1
        
        let imagePicker = PHPickerViewController(configuration: config)
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    @objc private func buttonTapped() {
        guard let savingTitle = titleTextField.text else { return }
        
        newTitleItem?(savingTitle)
        navigationController?.popViewController(animated: true)
    }
}

extension DetailCardVC: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let pictureResult = results.first else {
            return
        }
        
        //An item provider for conveying data or a file between processes during drag-and-drop or copy-and-paste activities, or from a host app to an app extension.
        // class NSItemProvider : NSObject
        if pictureResult.itemProvider.canLoadObject(ofClass: UIImage.self) {
            pictureResult.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                
                // self가 더 이상 유효하지 않으면 리턴
                guard let self = self,
                      let selectedPicture = image as? UIImage else { return }
                
                DispatchQueue.main.async(qos: .userInteractive) {
                    self.pictureImageView.image = selectedPicture
                }
            }
        }
    }
    
}
