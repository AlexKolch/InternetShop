//
//  CollectionVModel.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 19.04.2023.
//

import Foundation

struct Banner {
    let name: String

    static func getBanner() -> [Banner] {
        [Banner(name: "offer30"), Banner(name: "saleBDay")]
    }
}
