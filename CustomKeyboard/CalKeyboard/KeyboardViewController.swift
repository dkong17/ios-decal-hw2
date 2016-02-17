//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var carlinButton: UIButton!
    @IBOutlet var spaceButton: UIButton!
    @IBOutlet var retButton: UIButton!
    @IBOutlet var questionButton: UIButton!
    @IBOutlet var delButton: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func delAction() {
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }
    
    func retAction() {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }
    
    func questionAction() {
        (textDocumentProxy as UIKeyInput).insertText("Google")
    }
    
    func space() {
        (textDocumentProxy as UIKeyInput).insertText(" ")
    }
    
    func seven() {
        (textDocumentProxy as UIKeyInput).insertText("Shit Piss Fuck Cunt Cocksucker Motherfucker Tits")
    }
    
    func loadButtons() {
        retButton.addTarget(self, action: "retAction", forControlEvents: .TouchUpInside)
        delButton.addTarget(self, action: "delAction", forControlEvents: .TouchUpInside)
        questionButton.addTarget(self, action: "questionAction", forControlEvents: .TouchUpInside)
        carlinButton.addTarget(self, action: "seven", forControlEvents: .TouchUpInside)
        spaceButton.addTarget(self, action: "space", forControlEvents: .TouchUpInside)
    }
    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        loadButtons()
    }


}
