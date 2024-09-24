//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Shivam Kumar on 21/09/24.
//

import Foundation
import UIKit

class ResultViewController : UIViewController {
    
    let resultView = ResultView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        updateUI()
    }
    
    func createViews(){
        resultView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultView)
        
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func updateUI(){
        resultView.recalculateButton.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
    }
    
    @objc func backToHome(_ sender : UIButton){
        dismiss(animated: true)
    }
}
