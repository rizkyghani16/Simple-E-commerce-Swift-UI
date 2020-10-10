//
//  DataModel.swift
//  LoginApp
//
//  Created by Willi Ismail Munggaran on 10/10/20.
//

import Foundation
struct DataModel: Identifiable {
    let id : Int
    let productName : String
    let productPhoto : String
    let productPrice : Int
    let productLocation : String
    let ratingCount : Int
    let ratingSum : Int
    
    init(id: Int, productName: String, productPhoto: String, productPrice: Int, productLocation: String, ratingCount: Int, ratingSum: Int) {
        
        self .id = id
        self .productName = productName
        self .productPhoto = productPhoto
        self .productPrice = productPrice
        self .productLocation = productLocation
        self .ratingCount = ratingCount
        self .ratingSum = ratingSum
        
    }
    
}
