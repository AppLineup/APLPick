//
//  ViewController.swift
//  APLPick
//
//  Created by islamovic on 12/30/2018.
//  Copyright (c) 2018 islamovic. All rights reserved.
//

import UIKit
import APLPick
import Photos

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        PhotoLibraryPicker.setup(with: self)
    }

    @IBAction func pickButtonTapped(_ sender: UIButton) {

        PhotoLibraryPicker.shared.setup()
        PhotoLibraryPicker.shared.imagePicked = { info in
            print(info)
        }

        PhotoLibraryPicker.shared.pickingCancelled = {
            print("Cancelled")
        }
    }
}
