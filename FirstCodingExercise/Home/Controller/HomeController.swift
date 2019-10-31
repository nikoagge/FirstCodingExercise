//
//  HomeController.swift
//  FirstCodingExercise
//
//  Created by Nikolas on 28/10/19.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class HomeController: UIViewController {

    
    let inputTextField: UITextField = {
        
       let itf = UITextField()
        
        itf.borderStyle = .roundedRect
        itf.placeholder = "Input"
        itf.textAlignment = .center
        itf.font = UIFont.systemFont(ofSize: 22)
        itf.keyboardType = .numberPad
        itf.translatesAutoresizingMaskIntoConstraints = false
        
        return itf
    }()
    
    let goButton: UIButton = {
       
        let gb = UIButton()
        gb.setTitle("Go", for: .normal)
        gb.setTitleColor(.blue, for: .normal)
        gb.translatesAutoresizingMaskIntoConstraints = false
        
        gb.addTarget(self, action: #selector(checkInputTextField), for: .touchUpInside)
        
        return gb
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    
    func describeErrorMessage(forInput input: Int) -> String {
        
        switch input {
            
        case _ where input <= 3:
            
            return "2 Low temp"
            
        case _ where input <= 7:
            
            return "2 Low temp\n 4 High temp"
            
        case _ where input <= 15:
            
            return "2 Low temp\n 4 High temp\n 8 Low battery"
            
        default:
            
            return "2 Low temp\n 4 High temp\n 8 Low battery\n 16 General error"
        }
    }
    
    
    func createAlert(withTitle title: String,withErrorMessage errorMessage: String) {
        
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    func setupViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(inputTextField)
        view.addSubview(goButton)
        
        inputTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        inputTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        inputTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        goButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 80).isActive = true
        goButton.leftAnchor.constraint(equalTo: inputTextField.leftAnchor).isActive = true
        goButton.rightAnchor.constraint(equalTo: inputTextField.rightAnchor).isActive = true
        goButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    @objc func checkInputTextField() {
        
        if !inputTextField.text!.isEmpty {
            
            guard let inputText = inputTextField.text else { return }
            let inputInt = Int(inputText)
            
            guard let safelyUnwrappedInputInt = inputInt else { return }
            createAlert(withTitle: "Error Code Description", withErrorMessage: describeErrorMessage(forInput: safelyUnwrappedInputInt))
        } else {
            
            createAlert(withTitle: "Empty TextField", withErrorMessage: "Please give a valid input")
        }
    }
}

