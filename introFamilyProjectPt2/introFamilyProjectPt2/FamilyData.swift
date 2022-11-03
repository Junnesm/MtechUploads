//
//  FamilyData.swift
//  introFamilyProjectPt2
//
//  Created by Junne Murdock on 10/31/22.
//

import Foundation
import UIKit
 
struct FamilyInfo {
    var name: String
    var familyPicture: String
    var familyDescription: String
    
    static let familyMembers: [FamilyInfo] = [
        
    FamilyInfo(name: "Koko", familyPicture: "Koko PNG.jpg", familyDescription: "Koko is the baby of the family."),
    FamilyInfo(name: "Eevee", familyPicture: "Evee PNG.jpg", familyDescription: "Eevee is the bouji AF."),
    FamilyInfo(name: "Ken", familyPicture: "ken.jpg", familyDescription: "Ken is the husband of the family."),
    FamilyInfo(name: "Watashi", familyPicture: "me.jpg", familyDescription: "Junne is the BAMF of the family.")
    
    ]
}
