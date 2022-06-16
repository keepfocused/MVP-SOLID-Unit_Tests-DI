//
//  DetailView.swift
//  MVP+SOLID+Unit_Tests+DI
//
//  Created by Danil  on 15.06.2022.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var commentLabel: UILabel!
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        self.presenter.setComment()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        self.commentLabel.text = comment?.body
    }
}
