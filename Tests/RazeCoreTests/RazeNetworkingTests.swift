//
//  RazeNetworkingTests.swift
//  RazeCoreTests
//
//  Created by Julio Lopez on 1/27/22.
//

import XCTest
@testable import RazeCore

final class RazeNetworkingTests: XCTestCase {
    func testLoadDataCall() {
        let manager = RazeCore.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        guard let url = URL(string: "https://www.reddit.com") else {
            return XCTFail("Could not create url properly")
        }
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
                case .success(let returnedData):
                XCTAssertNotNil(returnedData, "Response data is not nil.")
                case .failure(let error):
                XCTFail(error?.localizedDescription ?? "Error forming result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
