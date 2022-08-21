//
//  ViewController.swift
//  Protocol Delegate
//
//  Created by kishore-pt5557 on 19/08/22.
//

import UIKit

protocol SendMessageDelegate {
    func send(_ message: String)
}

class ViewController: UIViewController, SendMessageDelegate {

    func send(_ message: String) {
        label.text = message
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .magenta
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("Move", for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true

    }
    
    @objc func btnTapped() {
        let vc = ViewController2()
        vc.delegate = self
        present(vc, animated: true)
    }
}

class ViewController2: UIViewController {
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("Go back", for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    
    var delegate: SendMessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        view.addSubview(textField)
        
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
    }
    
    @objc func btnTapped() {
        delegate?.send(textField.text!)
        dismiss(animated: true)
    }
    
}
