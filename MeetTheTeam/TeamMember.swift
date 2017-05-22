//
//  TeamMember.swift
//  MeetTheTeam
//
//  Created by Wade Sellers on 5/21/17.
//  Copyright © 2017 WadeSellers. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class TeamMember: NSObject {
    var avatar: UIImage?
    var firstName: String?
    var lastName: String?
    var title: String?
    var bio: String?

    init(json:JSON) {
        super.init()

        firstName = String(json["avatar"].stringValue)
        lastName = String(json["lastName"].stringValue)
        title = String(json["title"].stringValue)
        bio = String(json["bio"].stringValue)

        let url = URL(string: json["avatar"].stringValue)
        let data = try? Data(contentsOf: url!)
        avatar = UIImage(data: data!)
    }

}



