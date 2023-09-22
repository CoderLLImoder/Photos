//
//  Model.swift
//  MDHomework
//
//  Created by Илья Капёрский on 20.09.2023.
//

import Foundation

struct Model: Hashable {
    var mainTitle: String
    var count: String?
    var image: String
}

extension Model {
    static let modelsArray = [
        [Model(mainTitle: "Recent", count: "6051", image: "Image"),
         Model(mainTitle: "Instagram", count: "48", image: "Image 1"),
         Model(mainTitle: "WhatsApp", count: "37", image: "Image 3"),
         Model(mainTitle: "Favorites", count: "445", image: "Image 4"),
         Model(mainTitle: "Lightroom", count: "213", image: "Image 5"),
         Model(mainTitle: "Delimobil", count: "13", image: "Image 6")
        ],
        [Model(mainTitle: "Family", count: "14", image: "Image 2"),
         Model(mainTitle: "Friends", count: "90", image: "Image 7"),
         Model(mainTitle: "Partners", count: "114", image: "Image 8")
        ],
        [Model(mainTitle: "Videos", count: "961", image: "video"),
         Model(mainTitle: "Selfies", count: "216", image: "person.crop.square"),
         Model(mainTitle: "Live Photos", count: "602", image: "livephoto"),
         Model(mainTitle: "Portrait", count: "24", image: "cube"),
         Model(mainTitle: "Panoramas", count: "1", image: "pano"),
         Model(mainTitle: "Time-lapse", count: "2", image: "timelapse"),
         Model(mainTitle: "Slo-mo", count: "1", image: "slowmo"),
         Model(mainTitle: "Cinematic", count: "4", image: "video.square"),
         Model(mainTitle: "Bursts", count: "1", image: "square.stack.3d.down.right"),
         Model(mainTitle: "Screenshots", count: "400", image: "camera.viewfinder"),
         Model(mainTitle: "Screen Recordings", count: "13", image: "record.circle"),
         Model(mainTitle: "RAW", count: "3", image: "r.square.on.square"),
        ],
        [Model(mainTitle: "Imports", count: "869", image: "square.and.arrow.down"),
         Model(mainTitle: "Duplicate", count: "21", image: "square.on.square"),
         Model(mainTitle: "Hidden", count: nil, image: "eye.slash"),
         Model(mainTitle: "Recently Deleted", count: nil, image: "trash")
        ]
    ]
}
