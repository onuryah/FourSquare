//
//  File.swift
//  FourSquare
//
//  Created by Ceren Çapar on 14.10.2021.
//

import Foundation
import UIKit

class PlaceModel{
    static let sharedInstance = PlaceModel()
    var placeName = ""
    var placeType = ""
    var placeAthmosphere = ""
    var placeImage = UIImage()
    var placeLongitude = ""
    var placeLatitude = ""
    
    private init(){
        
    }
}
