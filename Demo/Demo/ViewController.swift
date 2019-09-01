//
//  ViewController.swift
//  Demo
//
//  Created by HarryTran on 8/29/19.
//  Copyright © 2019 HarryTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let translation = Translation(googleAPIKey: "AIzaSyCgyhS-Rz4QT9wH5gr0KlNej1Umldoq2D4")
        translation.translate(text: "Bonjour") { (error, translated, sourceLanguage) in
            print(error.debugDescription as Any)
            print(translated as Any)
            print(sourceLanguage as Any)
        }
        
        let detectLanguage = Translation(googleAPIKey: "AIzaSyCgyhS-Rz4QT9wH5gr0KlNej1Umldoq2D4")
        detectLanguage.detectLanguage(text: "問題") { (error, detectLanguage, val) in
            print(error.debugDescription as Any)
            print(detectLanguage as Any)
            print(val as Any)
        }
        
        let langs = Translation(googleAPIKey: "AIzaSyCgyhS-Rz4QT9wH5gr0KlNej1Umldoq2D4")
        langs.supportedLanguages { (error, langs) in
            print(langs as Any)
        }
        
        NSStringFromClass(String.self)
    }
}

