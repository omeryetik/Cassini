//
//  URL.swift
//
//  Created by CS193p Instructor.
//  Copyright (c) 2017 Stanford University. All rights reserved.
//

import Foundation

struct DemoURL
{
//    static let stanford = URL(string: "http://stanford.edu/about/images/intro_about.jpg")
//    static let stanford = URL(string: "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2013/07/26/100917787-Stanford_Oval_May_2011_panorama_r.jpg?v=1374868882")
    static let stanford = URL(string: "https://qph.ec.quoracdn.net/main-qimg-cd1f9263d3c4c2b30ed3941e6bd2b6ff")

    static var NASA: Dictionary<String,URL> = {
         let NASAURLStrings = [
            "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
