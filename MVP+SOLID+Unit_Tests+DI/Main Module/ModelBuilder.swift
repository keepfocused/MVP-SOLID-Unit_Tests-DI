//
//  ModuleBuilder.swift
//  MVP+SOLID+Unit_Tests+DI
//
//  Created by Danil  on 14.06.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "Pablo", lastName: "Escobar")
        let view  = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
