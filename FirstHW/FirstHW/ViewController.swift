//
//  ViewController.swift
//  FirstHW
//
//  Created by Bedirhan Köse on 22.12.22.
//

import UIKit

class ViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Name and Surname"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            view.backgroundColor = .lightGray
            view.addSubview(label)
            label.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: 100)
                
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
            view.addSubview(button)
            button.center = view.center
            button.setTitle("Please Add Information", for: .normal)
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)


    }
    
    @objc private func didTapButton() {
        let textEntry = TextEntryViewController()
        textEntry.completion = { [weak self] text in
            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
        let vc = UINavigationController(rootViewController: textEntry)
        present(vc, animated: true)
    }

}

