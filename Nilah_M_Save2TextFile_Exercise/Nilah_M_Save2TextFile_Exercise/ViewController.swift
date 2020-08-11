//
//  ViewController.swift
//  Nilah_M_Save2TextFile_Exercise
//
//  Created by Nilah Marshall on 8/10/20.
//  Copyright © 2020 Nilah Marshall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func writeMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try typeTextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error Writing File")
        }
    }
    
    
    @IBAction func readMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
        } catch {
            print("Error Reading File")
        }
    }
    
    
    @IBOutlet weak var typeTextHere: UITextView!
    
    
    @IBOutlet weak var displayTextHere: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        typeTextHere.text = "Type your new text right here"
        displayTextHere.text = ""
        
    }


}

