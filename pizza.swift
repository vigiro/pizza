//
//  pizza.swift
//  pizza
//
//  Created by vidal romero  on 13/07/16.
//  Copyright © 2016 vidal romero . All rights reserved.
//

import Foundation

class Pizza: NSObject {
    var tamaño: String?
    var masa: String?
    var queso: String?
    var ingredientes = [String: String]()
    
    override init() {
        super.init()
    }
    
    init(tamaño: String, masa: String, queso: String) {
        self.tamaño = tamaño
        self.masa = masa
        self.queso = queso
    }
}
