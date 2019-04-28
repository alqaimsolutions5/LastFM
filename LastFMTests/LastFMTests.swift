//
//  LastFMTests.swift
//  LastFMTests
//
//  Created by Apple on 18/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import XCTest
@testable import LastFM

class LastFMTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testArtistSearch(){
        
        var artistResult: ArtistResult?
        let searchValue = "kim"
        let pageNumber = 1
        let pageLimit = 20
        let searchArtistExpectation = expectation(description: "Search Artist")
        
        _ = ArtistLoader().searchArtist(withLimit: pageLimit, page: pageNumber, searchValue: searchValue, completionHandle: { (result) in
            artistResult = result
            searchArtistExpectation.fulfill()
            
        }, faliureHandler: { (error) in
            XCTAssertFalse(true, error.localizedDescription)
        })
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNotNil(artistResult)
        }
    }
    
    func testTopAlbums(){
        
        var topAlbums: TopAlbums?
        let searchValue = "Kimbra"
        let pageNumber = 1
        let pageLimit = 20
        let topAlbumsExpectation = expectation(description: "Top Albums")
        
        _ = AlbumLoader().loadTopAlbums(fromArtist: searchValue, withLimit: pageLimit, page: pageNumber, completionHandle: { (result) in
            
            topAlbums = result
            topAlbumsExpectation.fulfill()
            
        }, faliureHandler: { (error) in
            XCTAssertFalse(true, error.localizedDescription)
        })
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNotNil(topAlbums)
        }
    }
    
    func testAlbumDetails(){
        
        var albumDetails: AlbumDetails?
        let artistName = "Kimbra"
        let albumName = "Vows"
        
        let albumDetailsExpectation = expectation(description: "Album Details")
        
        _ = AlbumLoader().loadAlbumDetails(albumName, artistName: artistName, completionHandle: { (result) in
            albumDetails = result
            albumDetailsExpectation.fulfill()
            
        }, faliureHandler: { (error) in
            XCTAssertFalse(true, error.localizedDescription)
        })
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNotNil(albumDetails)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
