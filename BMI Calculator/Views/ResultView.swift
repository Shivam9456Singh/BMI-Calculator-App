//
//  ResultView.swift
//  BMI Calculator
//
//  Created by Shivam Kumar on 21/09/24.
//

import Foundation
import UIKit

class ResultView : UIView {
    
    let backgroundImage : UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "resultbackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
        
    }()
    
    let resultLabel : UILabel = {
        let resultLabel = UILabel()
        resultLabel.text = "Total BMI = "
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.textAlignment = .center
        resultLabel.textColor = .black
        resultLabel.numberOfLines = 0
        resultLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        return resultLabel
    }()
    
    let feedbackLabel : UILabel = {
        let feedbackLabel = UILabel()
        feedbackLabel.font = .systemFont(ofSize: 16)
        feedbackLabel.textAlignment = .justified
        feedbackLabel.numberOfLines = 0
        feedbackLabel.textColor = .black
        feedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        return feedbackLabel
    }()
    
    let verticalStackView : UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        return verticalStackView
    }()
    
    let action1Label : UILabel = {
        let action1Label = UILabel()
        action1Label.numberOfLines = 0
        action1Label.textAlignment = .natural
        action1Label.textColor = .black
        action1Label.font = .systemFont(ofSize: 16)
        action1Label.clipsToBounds = true
        return action1Label
    }()
    
    let action2Label : UILabel = {
        let action2Label = UILabel()
        action2Label.numberOfLines = 0
        action2Label.textAlignment = .natural
        action2Label.textColor = .black
        action2Label.font = .systemFont(ofSize: 16)
        action2Label.clipsToBounds = true
        return action2Label
    }()
    
    let action3Label : UILabel = {
        let action3Label = UILabel()
        action3Label.numberOfLines = 0
        action3Label.textAlignment = .natural
        action3Label.textColor = .black
        action3Label.font = .systemFont(ofSize: 16)
        action3Label.clipsToBounds = true
        return action3Label
    }()
    
    
    
    let recalculateButton : UIButton = {
        let recalculateButton = UIButton(type: .custom)
        recalculateButton.setTitle("Recalculate", for: .normal)
        recalculateButton.titleLabel?.font = .systemFont(ofSize: 25)
        recalculateButton.layer.cornerRadius = 20
        recalculateButton.configuration = .borderedProminent()
        recalculateButton.clipsToBounds = true
        recalculateButton.tintColor = .systemBlue
        recalculateButton.isUserInteractionEnabled = true
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        recalculateButton.setTitleColor(.white, for: .normal)
        return recalculateButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("(NScoder:) not implemented")
    }
    
    func setUpViews(){
        addSubview(resultLabel)
        addSubview(feedbackLabel)
        addSubview(recalculateButton)
        addSubview(backgroundImage)
        addSubview(verticalStackView)
        sendSubviewToBack(backgroundImage)
        
        verticalStackView.addArrangedSubview(action1Label)
        verticalStackView.addArrangedSubview(action2Label)
        verticalStackView.addArrangedSubview(action3Label)
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -200),
            resultLabel.widthAnchor.constraint(equalToConstant: 300),
            
            feedbackLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            feedbackLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            feedbackLabel.widthAnchor.constraint(equalToConstant: 300),
            
            verticalStackView.topAnchor.constraint(equalTo: feedbackLabel.bottomAnchor,constant: 20),
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.widthAnchor.constraint(equalToConstant: 300),
            verticalStackView.heightAnchor.constraint(equalToConstant: 300),
            
            recalculateButton.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 320),
            recalculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recalculateButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    
}
