//
//  HomeView.swift
//  BMI Calculator
//
//  Created by Shivam Kumar on 20/09/24.
//

import Foundation
import UIKit

class HomeView : UIView {
    
    let backgroundImage : UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "homebackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
        
    }()
    let headingLabel : UILabel = {
        let headingLabel = UILabel()
        headingLabel.text = "CALCULATE YOUR BMI"
        headingLabel.font = .systemFont(ofSize: 40, weight: .semibold)
        headingLabel.textColor = .black
        headingLabel.numberOfLines = 0
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        headingLabel.textAlignment = .left
        return headingLabel
    }()
    
    let calculateButton : UIButton = {
        let calculateButton = UIButton(type: .custom)
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.layer.cornerRadius = 20
        calculateButton.clipsToBounds = true
        calculateButton.tintColor = .systemBlue
        calculateButton.configuration = .borderedProminent()
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.setTitleColor(.white, for: .normal)
        return calculateButton
    }()
    
    let verticalStackView : UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 20
        verticalStackView.layer.cornerRadius = 40
        verticalStackView.distribution = .fillEqually
        return verticalStackView
    }()
    
    
    let horizontalStackViewHeight : UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 15
        horizontalStackView.distribution = .fillEqually
        return horizontalStackView
    }()
    
    let horizontalStackViewWeight : UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 15
        horizontalStackView.distribution = .fillEqually
        return horizontalStackView
    }()
    
    
    
    let heightLabel : UILabel = {
        let heightLabel = UILabel()
        heightLabel.text = "Height (cm)"
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.textAlignment = .center
        heightLabel.textColor = .black
        heightLabel.font = .systemFont(ofSize: 15)
        return heightLabel
    }()
    
    let heightValue : UILabel = {
        let heightValue = UILabel()
        heightValue.text = "0.0 cm"
        heightValue.translatesAutoresizingMaskIntoConstraints = false
        heightValue.textAlignment = .center
        heightValue.textColor = .black
        heightValue.font = .systemFont(ofSize: 15)
        return heightValue
    }()
    
    let heightSlider : UISlider = {
        let heightSlider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 243.84
        heightSlider.isContinuous = true
        heightSlider.tintColor = .systemBlue
        return heightSlider
    }()
    
    let weightSlider : UISlider = {
        let weightSlider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        weightSlider.minimumValue = 0
        weightSlider.maximumValue = 200
        weightSlider.isContinuous = true
        weightSlider.tintColor = .systemBlue
        return weightSlider
    }()
    
    
    let weightLabel : UILabel = {
        let weightLabel = UILabel()
        weightLabel.text = "Body weight (kg)"
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.textAlignment = .center
        weightLabel.textColor = .black
        weightLabel.font = .systemFont(ofSize: 15)
        return weightLabel
    }()
    
    let weightValue : UILabel = {
        let weightValue = UILabel()
        weightValue.text = "0.0 kg"
        weightValue.translatesAutoresizingMaskIntoConstraints = false
        weightValue.textAlignment = .center
        weightValue.textColor = .black
        weightValue.font = .systemFont(ofSize: 15)
        return weightValue
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("(NScoder:) not implemented")
    }
    
    func setupViews(){
        addSubview(headingLabel)
        addSubview(backgroundImage)
        addSubview(calculateButton)
        addSubview(verticalStackView)
        sendSubviewToBack(backgroundImage)
        
        horizontalStackViewHeight.addArrangedSubview(heightLabel)
        horizontalStackViewHeight.addArrangedSubview(heightValue)
        
        horizontalStackViewWeight.addArrangedSubview(weightLabel)
        horizontalStackViewWeight.addArrangedSubview(weightValue)
        
        verticalStackView.addArrangedSubview(horizontalStackViewHeight)
        verticalStackView.addArrangedSubview(heightSlider)
        verticalStackView.addArrangedSubview(horizontalStackViewWeight)
        verticalStackView.addArrangedSubview(weightSlider)
        
        
        
        NSLayoutConstraint.activate([
            headingLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -120),
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headingLabel.widthAnchor.constraint(equalToConstant: 300),
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            calculateButton.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 350),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 300),
            
            verticalStackView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor,constant: 100),
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.widthAnchor.constraint(equalToConstant: 300),
            verticalStackView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    
}
