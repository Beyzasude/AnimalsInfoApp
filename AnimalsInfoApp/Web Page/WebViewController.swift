//
//  WebViewController.swift
//  AnimalsInfoApp
//
//  Created by Beyza Sude Erol on 6.09.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlString: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: urlString ?? URL(string: "https://tr.wikipedia.org/wiki/Anasayfa")!))
    }

}
