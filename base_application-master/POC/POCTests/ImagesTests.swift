//
//  ImagesTests.swift
//  POCTests
//
//  Created by Bruno Vieira on 29/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import XCTest
@testable import POC

class ImagesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testImageList() {
        var tempImage: UIImage? = nil
        for image in Images.allCases {
            tempImage = UIImage.get(image)
            XCTAssertNotNil(tempImage, "Image \"\(image.rawValue)\" doesn't exist as a resource in the project")
        }
    }
}

extension UIImage {
    
    static func get(_ image: Images) -> UIImage? {
        return UIImage(named: image.rawValue)
    }
    
}
