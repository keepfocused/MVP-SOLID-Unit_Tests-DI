//
//  MainPresenterTest.swift
//  MVP+SOLID+Unit_Tests+DITests
//
//  Created by Danil  on 14.06.2022.
//

import XCTest
@testable import MVP_SOLID_Unit_Tests_DI

class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Fuz")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }
    
    func testViewIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
    }
    
    func testPresenterIsNotNil() {
        XCTAssertNotNil(presenter, "presenter is not nil")
    }
    
    func testModelIsNotNil() {
        XCTAssertNotNil(person, "model is not nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, person.firstName + " " + person.lastName )
    }
    
    func testModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Fuz")
    }
}
