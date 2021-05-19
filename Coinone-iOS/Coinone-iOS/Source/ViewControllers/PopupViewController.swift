//
//  PopupViewController.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/19.
//

import UIKit

class PopupViewController: UIViewController {
  
  
  @IBAction func donotseebuttonclicked(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func closebuttonclicked(_ sender: Any) {
    
    self.dismiss(animated: true, completion: nil)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  
}
