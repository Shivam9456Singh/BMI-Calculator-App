//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Shivam Kumar on 20/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    var homeView = HomeView()
    var resultView = ResultView()
    var calculateBrain = CalculatorBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        updateUI()
    }
    
    func createView(){
        homeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeView)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func updateUI(){
        homeView.heightSlider.addTarget(self, action: #selector(changeHeightValue), for: .valueChanged)
        homeView.weightSlider.addTarget(self, action: #selector(changeWeightValue), for: .valueChanged)
        
        homeView.calculateButton.addTarget(self, action: #selector(calculateBMI), for: .touchUpInside)
        
        
    }
    
    @objc func changeHeightValue(_ sender : UISlider){
        let roundedHeight = String(format: "%.2f", sender.value)
        homeView.heightValue.text = "\(roundedHeight) cm"
        homeView.heightLabel.text = "Height (cm)"
    }
    
    @objc func changeWeightValue(_ sender : UISlider){
        let roundedWeight = String(format: "%.2f", sender.value)
        homeView.weightValue.text = "\(roundedWeight) kg"
        homeView.weightLabel.text = "Body weight (kg)"
    }
    
    @objc func calculateBMI(_ sender : UIButton){
        let height = homeView.heightSlider.value
        let weight = homeView.weightSlider.value
        
        let bmi = (weight / pow(height,2))*10000
        
        let finalBmi = String(format: "%.1f", bmi)
        
        
        
        if height == 0.0 && weight == 0.0 {
            homeView.heightLabel.text = "Height can't be 0."
            homeView.weightLabel.text = "Weight can't be 0."
        }else if height == 0.0 || weight == 0.0 {
            if height == 0.0 {
                homeView.heightLabel.text = "Height can't be 0."
            }
            else{
                homeView.weightLabel.text = "Weight can't be 0."
            }
        }
        else{
            let resultVC = ResultViewController()
            resultVC.resultView.resultLabel.text = "BMI = \(finalBmi) Kg/m^2"
            
            if bmi >= 35.0 {
                let feedbackSevere = calculateBrain.feedbackArray[4]
                resultVC.resultView.feedbackLabel.text = feedbackSevere
                resultVC.resultView.feedbackLabel.textColor = .systemRed
                resultVC.resultView.action1Label.text = "● \(calculateBrain.ActionArray[4][0])"
                resultVC.resultView.action2Label.text = "● \(calculateBrain.ActionArray[4][1])"
                resultVC.resultView.action3Label.text = "● \(calculateBrain.ActionArray[4][2])"
            }
            else if bmi >= 30 && bmi < 35{
                let feedbackObese = calculateBrain.feedbackArray[3]
                resultVC.resultView.feedbackLabel.text = feedbackObese
                resultVC.resultView.feedbackLabel.textColor = .systemYellow
                resultVC.resultView.action1Label.text = "● \(calculateBrain.ActionArray[3][0])"
                resultVC.resultView.action2Label.text = "● \(calculateBrain.ActionArray[3][1])"
                resultVC.resultView.action3Label.text = "● \(calculateBrain.ActionArray[3][2])"
            }
            else if bmi >= 25 && bmi <= 29.9{
                let feedbackOverweight = calculateBrain.feedbackArray[2]
                resultVC.resultView.feedbackLabel.text = feedbackOverweight
                resultVC.resultView.feedbackLabel.textColor = .systemBlue
                resultVC.resultView.action1Label.text = "● \(calculateBrain.ActionArray[2][0])"
                resultVC.resultView.action2Label.text = "● \(calculateBrain.ActionArray[2][1])"
                resultVC.resultView.action3Label.text = "● \(calculateBrain.ActionArray[2][2])"
            }
            else if bmi >= 18.5 && bmi <= 24.9 {
                let feedbackNormal = calculateBrain.feedbackArray[1]
                resultVC.resultView.feedbackLabel.text = feedbackNormal
                resultVC.resultView.feedbackLabel.textColor = .systemGreen
                resultVC.resultView.action1Label.text = "●  \(calculateBrain.ActionArray[1][0])"
                resultVC.resultView.action2Label.text = "● \(calculateBrain.ActionArray[1][1])"
                resultVC.resultView.action3Label.text = "● \(calculateBrain.ActionArray[1][2])"
            }
            else if bmi < 18.5 {
                let feedbackUnderweight = calculateBrain.feedbackArray[0]
                resultVC.resultView.feedbackLabel.text = feedbackUnderweight
                resultVC.resultView.feedbackLabel.textColor = .systemCyan
                resultVC.resultView.action1Label.text = "● \(calculateBrain.ActionArray[0][0])"
                resultVC.resultView.action2Label.text = "● \(calculateBrain.ActionArray[0][1])"
                resultVC.resultView.action3Label.text = "● \(calculateBrain.ActionArray[0][2])"
            }
            
            present(resultVC, animated: true,completion: nil)
        }
        
        
        
    }
    
    
    
}

