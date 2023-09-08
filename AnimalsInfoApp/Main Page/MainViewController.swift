//
//  ViewController.swift
//  AnimalsInfoApp
//
//  Created by Beyza Sude Erol on 6.09.2023.
//

import UIKit
import AVKit
import AVFoundation

class MainViewController: UIViewController {
    
    private let animals: [AnimalInfo] = [
        AnimalInfo(name: "elephant", imageName: "elephant", link: URL(string: "https://en.wikipedia.org/wiki/Elephant")!),
        AnimalInfo(name: "lion", imageName: "lion", link:URL(string: "https://en.wikipedia.org/wiki/Lion")!),
        AnimalInfo(name: "giraffe", imageName: "giraffe",link: URL(string:"https://en.wikipedia.org/wiki/Giraffe")!),
        AnimalInfo(name: "hippo", imageName: "hippo",link: URL(string:"https://en.wikipedia.org/wiki/Hippopotamus")!),
        AnimalInfo(name: "cheetah", imageName: "cheetah", link: URL(string: "https://en.wikipedia.org/wiki/Cheetah")!),
        AnimalInfo(name: "gorilla", imageName: "gorilla",link: URL(string:"https://en.wikipedia.org/wiki/Gorilla")!),
        AnimalInfo(name: "ostrich", imageName: "ostrich", link: URL(string:"https://en.wikipedia.org/wiki/Common_ostrich.")!),
        AnimalInfo(name: "zebra", imageName: "zebra", link: URL(string:"https://en.wikipedia.org/wiki/Zebra.")!),
    ]
    

    @IBOutlet  var animalViews: [AnimalView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animals"
        setupBoxViews()
    }
    
    private func setupBoxViews() {
        let _ = animalViews.map { $0.videoActionTapped =  routeVideoVC() }
        let _ = animalViews.map { $0.webActionTapped =  routeToWebView() }
        
        for (index, animal) in animals.enumerated() {
            animalViews[index].infoLink = animal.link!
            animalViews[index].animalTitleLabel.text = animal.name!.capitalized
            animalViews[index].videoName = animal.imageName!
            animalViews[index].animalImageView.image = UIImage(named: animal.imageName!)
        }
    }
    
    private func routeVideoVC() -> (_ videoName: String) -> () {
        return { videoName in
            if let path = Bundle.main.path(forResource: videoName, ofType: "mp4") {
                let player = AVPlayer(url: URL(filePath: path))
                let playerControl = AVPlayerViewController()
                
                playerControl.player = player
                
                self.present(playerControl, animated: true) {
                    player.play()
                }
            }
        }
    }
    
    private func routeToWebView() -> (_ infoLink: URL) -> () {
        return { infoLink in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                vc.urlString = infoLink
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
