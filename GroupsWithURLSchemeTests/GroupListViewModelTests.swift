//
//  GroupListViewModelTests.swift
//  GroupsWithURLSchemeTests
//
//  Created by Gabriela Bezerra on 27/09/23.
//

import XCTest
@testable import GroupsWithURLScheme

final class GroupListViewModelTests: XCTestCase {

    var sut: GroupListViewModel!
    
    override func setUp() {
        super.setUp()
        self.sut = GroupListViewModel()
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func testHandler_validURL_startAddMemberFlow() {
        // given
        let url = URL(string: "groupsapp://enter?id=1234")!
        
        // when
        sut.handle(url: url)
        
        // then
        XCTAssertEqual(sut.groupIDToAddMember, "1234")
        XCTAssert(sut.showAddMemberToGroup)
    }
    
    func testHandler_wrongURL_doNotStartAddMemberFlow() {
        // given
        let url = URL(string: "groupsapp://ener?id=1234")!
        
        // when
        sut.handle(url: url)
        
        // then
        XCTAssertNil(sut.groupIDToAddMember)
        XCTAssertFalse(sut.showAddMemberToGroup)
    }
    
    func testHandler_wrongParam_doNotStartAddMemberFlow() {
        // given
        let url = URL(string: "groupsapp://enter?identifier=1234")!
        
        // when
        sut.handle(url: url)
        
        // then
        XCTAssertNil(sut.groupIDToAddMember)
        XCTAssertFalse(sut.showAddMemberToGroup)
    }
    
    func testHandler_invalidURL_doNotStartAddMemberFlow() {
        // given
        let url = URL(string: "groups://enter?id=1234")!
        
        // when
        sut.handle(url: url)
        
        // then
        XCTAssertNil(sut.groupIDToAddMember)
        XCTAssertFalse(sut.showAddMemberToGroup)
    }
}
