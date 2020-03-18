//
//  ThirdViewController.swift
//  UserDefaultsObserver
//
//  Created by Hiromu Nakano on 2020/03/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var isLoginLabel: UILabel!

    private var observer: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        observer = UserDefaults.standard.observe(\.isLoginForSettings, options: [.new]) { defaults, change in
            guard let isLogin = change.newValue else {
                return
            }
            if !isLogin {
                UserDefaultsRepositories.shared.set(false)
                self.navigationController?.popViewController(animated: false)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        isLoginLabel.text = UserDefaultsRepositories.shared.get() ? "login" : "logout"
    }

    deinit {
        observer?.invalidate()
    }
}
