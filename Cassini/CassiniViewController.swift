//
//  CassiniViewController.swift
//  Cassini
//
//  Created by iMAC2 on 06/12/2018.
//  Copyright © 2018 FAST. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                let destination = segue.destination.contents
                if let imageVC = destination as? ImageViewController {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }
}

extension UIViewController {
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
