//
//  WebViewController.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/10/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet private var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        setupWebView()
    }

}

private extension WebViewController {
    func setupWebView() {
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url))
    }
    
    func setupActivityIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.layer.cornerRadius = 4
        activityIndicator.startAnimating()
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}
