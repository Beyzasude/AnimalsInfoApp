//
//  AnimalInfo.swift
//  AnimalsInfoApp
//
//  Created by Beyza Sude Erol on 6.09.2023.
//

import Foundation

class AnimalInfo {
    var name: String?
    var imageName: String?
    var link: URL?
    
    init(name: String?, imageName: String?, link: URL?) {
        self.name = name
        self.imageName = imageName
        self.link = link
    }
}
