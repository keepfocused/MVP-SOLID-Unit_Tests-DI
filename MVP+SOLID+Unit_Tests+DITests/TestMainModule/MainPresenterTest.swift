//
//  MainPresenterTest.swift
//  MVP+SOLID+Unit_Tests+DITests
//
//  Created by Danil  on 14.06.2022.
//

import XCTest
@testable import MVP_SOLID_Unit_Tests_DI

class MockView: MainViewProtocol {
    func succes() {
        
    }
    
    func failure(error: Error) {
        
    }
}


class MockNetworkService: NetworkServiceProtocol {
    var comments: [Comment]!
    
    init() {}
    
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0)
            completion(.failure(error))
        }
    }
}
                       
                       

class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func setUpWithError() throws {
        let navController = UINavigationController()
        let assembly = AssemblyModuleBuilder()
        router = Router(navigationController: navController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        networkService = nil
    }
    
    func testGetSuccesComents() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService(comments: comments)
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchComment: [Comment]?
        
        networkService.getComments { result in
            switch result {
            case.success(let comments):
                catchComment = comments
            case.failure(let error):
                print(error)
            }
        }
        XCTAssertNotEqual(catchComment?.count, 0)
        XCTAssertEqual(catchComment?.count, comments.count)
    }
    
    func testGetFailureComents() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService()
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.getComments { result in
            switch result {
            case.success(let comments):
                break
            case.failure(let error):
                catchError = error
            }
        }
        XCTAssertNotNil(catchError)
    }
}
    

