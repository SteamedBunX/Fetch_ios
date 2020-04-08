//
//  JsonDecodeTest.swift
//  FetchTests
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import XCTest
@testable import Fetch

class JsonDecodeTests: XCTestCase {

    let dataFile = "pets"

    func testSecondPet() {
        let sut = Pets.load(fileName: dataFile)[1]
        XCTAssertEqual(sut.id, "f21216ec-b0ab-4beb-8d38-1cded5b24a82")
        XCTAssertEqual(sut.card.name, "Quan")
        XCTAssertEqual(sut.card.photoURLs.count, 1)
        XCTAssertEqual(sut.card.age, "Baby")
        XCTAssertEqual(sut.card.photoURLs[0], "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47712798/1/?bust=1585351975&width=300")
    }

    func testPetWithMultiplePhoto() {
        let sut = Pets.load(fileName: dataFile)[4]
        XCTAssertEqual(sut.card.photoURLs.count, 2)
    }
}
