
//
//  CodeView.swift
//  PinView
//
//  Created by Sagaya Abdulhafeez on 17/01/2019.
//  Copyright © 2019 Cosmo. All rights reserved.
//

import UIKit


public enum CodeStyle {
    case rounded, square, line
}

open class CodeView: UIControl, UIKeyInput{
    public var hasText : Bool {
        return nextTag == 1 ? true : false
    }
    open override var canBecomeFirstResponder : Bool {
        return true
    }
    open var inputColor: UIColor = UIColor.black{
        didSet{
            self.borderColor = inputColor
        }
    }
    open var numberOfPin: Int = 4{
        didSet{
            print(numberOfPin)
        }
    }
    open var activeFieldColor:UIColor?
    var codeText = ""
    private var boxSize: CGSize!
    open var borderRadius: CGFloat?
    var stackView:UIStackView!
    public var delegate: PinInputDelegate?
    open var isSecureTextEntry = false
    open var borderColor: UIColor!
    var labels = [UILabel]()
    
    var style:CodeStyle = CodeStyle.square
    private var nextTag = 1
    public init(numberOfPin: Int, inputColor:UIColor = .black ,
         font: UIFont = UIFont.systemFont(ofSize: 15),
         codeStyle: CodeStyle, boxSize:CGSize = .init(width: 40, height: 40) ,
         textColor: UIColor = .white,
         spacing:CGFloat = 15,
         activeFieldColor: UIColor = .clear, backgroundClr: UIColor = .clear){
        super.init(frame: UIScreen.main.bounds)
        self.style = codeStyle
        self.boxSize = boxSize
        self.borderRadius = boxSize.height / 2
        self.activeFieldColor = activeFieldColor
        self.numberOfPin = numberOfPin
        self.inputColor = activeFieldColor
        
        borderColor = inputColor
        for index in 1...numberOfPin{
            let lbl = UILabel()
            lbl.font = .systemFont(ofSize: 42)
            lbl.tag = index
            lbl.backgroundColor = backgroundClr
            lbl.font = font
            lbl.textAlignment = .center
            if style == .line{
                lbl.text = "–"
                lbl.textColor = .black
                lbl.font = .systemFont(ofSize: 42)
            }else{
                lbl.textColor = textColor
                changeStyle(for: lbl, type: 0, style: codeStyle)
            }
            //            lbl.backgroundColor = backgroundClr
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.heightAnchor.constraint(equalToConstant: boxSize.height).isActive = true
            lbl.widthAnchor.constraint(equalToConstant: boxSize.width).isActive = true
            labels.append(lbl)
        }
        stackView = UIStackView(arrangedSubviews: labels)
        addSubview(stackView)
        stackView.spacing = spacing
        
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.anchorTo(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: nil)
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func insertText(_ text: String) {
        print(stackView.subviews[0].frame.size.width)
        if nextTag <= numberOfPin {
            let tagLabel = self.viewWithTag(nextTag) as? UILabel
            changeStyle(for: tagLabel!, type: 1, style: self.style)
            animateLabelChange(for: tagLabel!, to: text)
            
            if (nextTag == 1){
                codeText = tagLabel?.text ?? ""
            } else {
                codeText += tagLabel?.text ?? ""
            }
            if isSecureTextEntry == true {
                animateLabelChange(for: tagLabel!, to: "\u{2022}")
            }
            nextTag += 1
            
            if nextTag == numberOfPin + 1{
                delegate?.didFinishInput(self, didFinishWith: codeText)
            }
        }
    }
    public func deleteBackward() {
        if nextTag > 1 {
            nextTag -= 1
            let tagLabel = self.viewWithTag(nextTag) as? UILabel
            if style == .line{
                animateLabelChange(for: tagLabel!, to: "–")
            }else{
                animateLabelChange(for: tagLabel!, to: "")
            }
            changeStyle(for: tagLabel!, type: 0, style: self.style)
            codeText = String(codeText.dropLast())
        }
    }
    
    private func animateLabelChange(for label: UILabel, to text: String){
        UIView.transition(with: label,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            label.text = text
            }, completion: nil)
    }
    
    private func changeStyle(for label:UILabel, type: Int, style: CodeStyle?){
        switch (type, style) {
        case (0, .some(.square)):
            //Empty and square
            //            label.backgroundColor = .clear
            label.layer.borderColor = inputColor.cgColor
            label.layer.borderWidth = 1.0
            label.layer.cornerRadius = 0.0
            label.clipsToBounds = true
        case (1, .some(.square)):
            //Empty and square
            label.backgroundColor = inputColor
            label.layer.borderColor = inputColor.cgColor
            label.layer.borderWidth = 0.0
            label.layer.cornerRadius = 0.0
            label.clipsToBounds = true
            
        case (1, .some(.rounded)):
            //Bring back
            label.backgroundColor = inputColor
            label.layer.borderWidth = 0.0
            label.layer.borderColor = inputColor.cgColor
            label.layer.cornerRadius = self.borderRadius!
            label.clipsToBounds = true
        case (0, .some(.rounded)):
            //Bring back
            //            label.backgroundColor = .clear
            label.layer.borderWidth = 1.0
            label.layer.borderColor = inputColor.cgColor
            label.layer.cornerRadius =  self.borderRadius!
            label.clipsToBounds = true
        case (0, .some(.line)):
            //Bring back
            label.backgroundColor = .clear
            label.layer.borderWidth = 0.0
            label.layer.borderColor = UIColor.clear.cgColor
            label.layer.cornerRadius =  0
        case (1, .some(.line)):
            //Bring back
            label.backgroundColor = .clear
            label.textColor = .black
            label.layer.borderWidth = 0.0
            label.layer.borderColor = UIColor.clear.cgColor
            label.layer.cornerRadius =  0
        default:
            print(type, style)
        }
    }
    public var keyboardType: UIKeyboardType {
        get{
            return .numberPad
        }
        set{
            
        }
    }
}
public protocol PinInputDelegate {
    func didFinishInput(_ inputView: CodeView, didFinishWith text: String)
}
