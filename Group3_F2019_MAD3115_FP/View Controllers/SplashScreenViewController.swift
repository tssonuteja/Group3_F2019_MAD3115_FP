//
//  SplashScreenViewController.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()
    perform(#selector(self.gotoLoginscreen), with: nil, afterDelay: 2)

    // Do any additional setup after loading the view.
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

@objc func gotoLoginscreen()  {
    performSegue(withIdentifier: "splashToLogin", sender: self)
}

}
//Created UI
