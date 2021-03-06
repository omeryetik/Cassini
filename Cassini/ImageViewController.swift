//
//  ViewController.swift
//  Cassini
//
//  Created by Ömer Yetik on 27/11/2017.
//  Copyright © 2017 Ömer Yetik. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    // MARK: Model
    
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }

    // MARK: Private implementation
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    private func fetchImage() {
        if let url = imageURL {
            spinner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                if let imageData = urlContents, url == self?.imageURL {
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: imageData)
                    }
                }
            }

        }
    }
    
    
    // MARK: View Controller Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    // MARK: User interface
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)
        }
    }
    
    fileprivate var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            // During prepare scrollView is nil. To overcome a crash due to this fact, make the call an optional one
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
}

// MAR: UIScrollViewDelegate

extension ImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

