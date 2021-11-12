//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by Matteo Valerio on 11/11/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    private let signInButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .green
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(
            x: 20,
            y: view.height-50-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: 50)
    }
    
    @objc func didTapSignIn() {
        let vc = AuthViewController()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    private func handleSignIn(success: Bool) {
        // Log in user or says it failed
        guard success else {
            let alert = UIAlertController(title: "OOPS", message: "Something went wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            return
        }
        let mainAppTabBarVC = TabViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
        
    }
    
    

}
