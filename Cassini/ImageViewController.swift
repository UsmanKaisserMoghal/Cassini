//
//  ImageViewController.swift
//  Cassini
//
//  Created by iMAC2 on 05/12/2018.
//  Copyright © 2018 FAST. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private var image: UIImage? {
        get{
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.addSubview(imageView)
        }
    }
    
    var imageView = UIImageView()
    
    private func fetchImage() {
        if let url = imageURL {
            let urlConents = try? Data(contentsOf: url)
            if let imageData = urlConents {
                image = UIImage(data:imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }

}
