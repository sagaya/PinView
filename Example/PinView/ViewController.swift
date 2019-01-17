//
//  ViewController.swift
//  PinView
//
//  Created by sagaya on 01/17/2019.
//  Copyright (c) 2019 sagaya. All rights reserved.
//

import UIKit
import PinView

class ViewController: UIViewController, PinInputDelegate {
    func didFinishInput(_ inputView: CodeView, didFinishWith text: String) {
        switch inputView {
        case inputV:
            inputV.resignFirstResponder()
            inputV2.becomeFirstResponder()
        case inputV2:
            inputV2.resignFirstResponder()
            inputV3.becomeFirstResponder()
        default:
            debugPrint("")
        }
        showAlert(for: text)
    }
    
    lazy var inputV: CodeView = {
        let f = UIFont.boldSystemFont(ofSize: 10)
        let c = CodeView(numberOfPin: 6, font: f, codeStyle: CodeStyle.rounded, boxSize: CGSize(width: 40, height: 40), activeFieldColor: UIColor(red:0.08, green:0.58, blue:0.86, alpha:1.0))
        c.delegate = self
        return c
    }()
    lazy var inputV2: CodeView = {
        let f = UIFont.boldSystemFont(ofSize: 15)
        let c = CodeView(numberOfPin: 4, font: f, codeStyle: CodeStyle.square, boxSize: CGSize(width: 40, height: 40), activeFieldColor: UIColor.lightGray, backgroundClr: UIColor.lightGray)
        c.delegate = self
        return c
    }()
    lazy var inputV3: CodeView = {
        let f = UIFont.boldSystemFont(ofSize: 10)
        let c = CodeView(numberOfPin: 5, font: f, codeStyle: CodeStyle.line, boxSize: CGSize(width: 40, height: 40), activeFieldColor: UIColor.clear, backgroundClr: UIColor.clear)
        c.isSecureTextEntry = true
        c.delegate = self
        return c
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(inputV)
        
        view.addSubview(inputV2)
        view.addSubview(inputV3)
        inputV.anchorTo(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 140, left: 80, bottom: 0, right: 80), size: .init(width: view.frame.width, height: 50))
        inputV2.anchorTo(top: inputV.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 80, bottom: 0, right: 80), size: .init(width: view.frame.width, height: 50))
        inputV3.anchorTo(top: inputV2.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 80, bottom: 0, right: 80), size: .init(width: view.frame.width, height: 50))
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inputV.becomeFirstResponder()
    }
    func showAlert(for title: String){
        let alert = UIAlertController(title: "", message: "You inputed \(title)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

