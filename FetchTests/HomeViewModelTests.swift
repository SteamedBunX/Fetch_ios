//
//  HomeViewModelTests.swift
//  FetchTests
//
//  Created by yi.hao on 4/6/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import XCTest
@testable import Fetch

class HomeViewModelTests: XCTestCase {

    func testSetup() {
        let sut = HomeViewModel(networkManager: MockNetworkManager(fileName: "pets"))
        XCTAssertFalse(sut.currentPetIsAvaliable)
        XCTAssertEqual(sut.currentPetName, "")
        sut.loadFirstBatch()
        XCTAssertTrue(sut.currentPetIsAvaliable)
        XCTAssertEqual(sut.currentPetName, "Blossom")
        XCTAssertEqual(sut.currentPetPhotoURLs.count, 1)
    }

    func testStatusString() {
        let sut = HomeViewModel(networkManager: MockNetworkManager(fileName: "pets"))
        sut.loadFirstBatch()
        XCTAssertTrue(sut.currentPetIsAvaliable)
        XCTAssertEqual(sut.currentPetStatus, "Baby • Large • 0.7 Miles")
    }

    func testMovingFoward() {
        let sut = HomeViewModel(networkManager: MockNetworkManager(fileName: "pets"))
        sut.loadFirstBatch()
        XCTAssertTrue(sut.currentPetIsAvaliable)
        XCTAssertEqual(sut.currentPetName, "Blossom")
        XCTAssertEqual(sut.currentPetPhotoURLs.count, 1)
        XCTAssertEqual(sut.currentPetStatus, "Baby • Large • 0.7 Miles")
        sut.likeButtonTapped()
        XCTAssertTrue(sut.currentPetIsAvaliable)
        XCTAssertEqual(sut.currentPetName, "Quan")
        XCTAssertEqual(sut.currentPetPhotoURLs.count, 1)
        XCTAssertEqual(sut.currentPetStatus, "Baby • Medium • 0.7 Miles")
        sut.unlikeButtonTapped()
        XCTAssertTrue(sut.currentPetIsAvaliable)
        XCTAssertEqual(sut.currentPetName, "Quest")
        XCTAssertEqual(sut.currentPetPhotoURLs.count, 1)
        XCTAssertEqual(sut.currentPetStatus, "Baby • Medium • 0.7 Miles")
        sut.likeButtonTapped()
        sut.unlikeButtonTapped()
        XCTAssertTrue(sut.currentPetIsAvaliable)
        XCTAssertEqual(sut.currentPetName, "Willow")
        XCTAssertEqual(sut.currentPetPhotoURLs.count, 2)
        XCTAssertEqual(sut.currentPetStatus, "Young • Medium • 0.7 Miles")
    }
}
