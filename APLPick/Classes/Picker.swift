//
//  Picker.swift
//  APLPick
//
//  Created by Islam on 12/30/18.
//

import UIKit
import Foundation

public protocol PhotoLibraryPickerDelegate: class {
    func pickedDidCancel()
    func picker(didFinishPicking info: [String: Any])
}

public class PhotoLibraryPicker: NSObject {
    public static let shared = PhotoLibraryPicker()
    public weak var delegate: PhotoLibraryPickerDelegate!

    public var imagePicked: (([String: Any]) -> Void)?
    public var pickingCancelled: (() -> Void)?

    private class Config {
        var currentViewController: UIViewController!
    }

    private static let config = Config()

    public override init() {
        guard PhotoLibraryPicker.config.currentViewController != nil else {
            fatalError("Error - you must call setup befoer accessing shared object")
        }
    }

    public class func setup(with viewController: UIViewController) {
        PhotoLibraryPicker.config.currentViewController = viewController
    }
}

extension PhotoLibraryPicker {
    public func setup() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            PhotoLibraryPicker.config.currentViewController.present(myPickerController, animated: true, completion: nil)
        }
    }
}

extension PhotoLibraryPicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        if let delegate = delegate {
            delegate.pickedDidCancel()
        } else {
            self.pickingCancelled?()
        }
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let delegate = delegate {
            delegate.picker(didFinishPicking: info)
        } else {
            self.imagePicked?(info)
        }
    }
}
