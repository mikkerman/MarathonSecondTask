//
//  ViewController.swift
//  MarathonSecondTask
//  Created by Михаил Герман on 05.03.2023.
//

import UIKit

class MyButton: UIButton {

    override func tintColorDidChange() {
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            configuration?.background.backgroundColor = .systemGray
            layer.backgroundColor = UIColor.systemGray.cgColor
            layer.cornerRadius = 10
        } else {
            configuration?.background.backgroundColor = .systemBlue
            layer.backgroundColor = UIColor.systemBlue.cgColor
        }
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstButton: MyButton!
    @IBOutlet weak var secondButton: MyButton!
    @IBOutlet var thirdButton: MyButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTextSettings()

    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
    }

    @IBAction func buttonReleased(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            sender.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    

    
    private func buttonTextSettings() {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "arrow.right.circle")?.withTintColor(.white)

        let imageString = NSAttributedString(attachment: imageAttachment)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 8.0

        let firstButtonString = NSMutableAttributedString(string: "First Button ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        firstButtonString.append(imageString)
        firstButton.setAttributedTitle(firstButtonString, for: .normal)

        let secondButtonString = NSMutableAttributedString(string: "Second Medium Button ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        secondButtonString.append(imageString)
        secondButton.setAttributedTitle(secondButtonString, for: .normal)

        let thirdButtonString = NSMutableAttributedString(string: "Third ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        thirdButtonString.append(imageString)
        thirdButton.setAttributedTitle(thirdButtonString, for: .normal)


    }
}
