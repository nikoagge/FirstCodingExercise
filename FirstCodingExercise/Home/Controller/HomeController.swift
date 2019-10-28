//
//  HomeController.swift
//  FirstCodingExercise
//
//  Created by Nikolas on 28/10/19.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class HomeController: UIViewController {

    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    
    func createAlert(withErrorMessage errorMessage: String) {
        
        let alert = UIAlertController(title: "Error Code", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func goTapped(_ sender: Any) {
        
        let inputInt = Int(inputTextField.text!)
        createAlert(withErrorMessage: describeErrorMessage(forInput: inputInt!))
    }
}

