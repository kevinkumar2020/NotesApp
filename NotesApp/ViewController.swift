//
//  ViewController.swift
//  NotesApp
//
//  Created by Kevin on 11/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let mylabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .systemFill
        label.textAlignment = .center
        label.backgroundColor = .systemFill
        return label
    }()
    
    private let mybutton:UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mylabel)
        view.addSubview(mybutton)
        checkAuth()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkAuth()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let vw=view.frame.width
        mylabel.frame = CGRect(x: 20, y: 200, width: vw-40, height: 40)
        mybutton.frame = CGRect(x: 20, y: 600, width: vw - 40, height: 40)
    }
    
    private func checkAuth()
    {
        if let token = UserDefaults.standard.string(forKey: "sessionToken"),
           let name = UserDefaults.standard.string(forKey: "username"){
            print("Token: \(token)")
            mylabel.text = "Welcome, \(name)"
        }else{
            let vc = LoginVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    
    @objc private func logoutTapped()
    {
        
        UserDefaults.standard.setValue(nil,forKey: "sessionToken")
        UserDefaults.standard.setValue(nil,forKey: "username")
        
        checkAuth()

    }


}
