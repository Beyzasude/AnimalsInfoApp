//
//  AnimalView.swift
//  AnimalsInfoApp
//
//  Created by Beyza Sude Erol on 6.09.2023.
//

import UIKit

class AnimalView: UIView {
    
    
    @IBOutlet weak var animalTitleLabel: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!
    
    var videoName: String
    var infoLink: URL
    
    var videoActionTapped: ((_ videoName: String) -> ())?
    var webActionTapped: ((_ infoLink: URL) -> ())?
    
    
    init(frame: CGRect, videoName: String, infoLink: URL) {
        self.videoName = videoName
        self.infoLink = infoLink
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        self.videoName = "Gorilla"
        self.infoLink = URL(string: "Gorilla")!
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        if let viewForXib = Bundle.main.loadNibNamed("AnimalView", owner: self)?[0] as? UIView {
            viewForXib.frame = self.bounds
            viewForXib.layer.cornerRadius = 12
            addSubview(viewForXib)
        }
    }
    
    
    @IBAction func watchVideoAct(_ sender: Any) {
        videoActionTapped?(videoName)
    }
    
    
    @IBAction func gotoLinkAct(_ sender: Any) {
        webActionTapped?(infoLink)

    }
    
}
