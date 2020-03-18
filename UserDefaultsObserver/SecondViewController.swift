//
//  SecondViewController.swift
//  UserDefaultsObserver
//
//  Created by Hiromu Nakano on 2020/03/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var isLoginLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        isLoginLabel.text = UserDefaultsRepositories.shared.get() ? "login" : "logout"
    }

    @IBAction func tapButton(_ sender: Any) {
        UserDefaultsRepositories.shared.set(true)
    }
}
