//
//  LoginViewController.swift
//  LoginUIDesing
//
//  Created by Samet Korkmaz on 12.09.2024.
//

import UIKit

class LoginViewController: UIViewController {

    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "appBG")
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let pageTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "📱Hello World"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 25, weight: .bold)
        return lbl
    }()
    private let pageSubTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sign in to your Account"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        lbl.font = .systemFont(ofSize: 35, weight: .semibold)
        return lbl
    }()
    private let pageSmallTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter your email and password to log in"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    private let pageUIView: UIView = {
        let uView = UIView()
        uView.backgroundColor = .white
        uView.layer.cornerRadius = 20
        uView.clipsToBounds = true
        //tıklanabilir hale getirdik
        uView.isUserInteractionEnabled = true
        return uView
    }()
    private let withGoogleButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "googleLogo"), for: .normal)
        btn.setTitle("Contiune with Google", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 13, weight: .heavy)
        btn.setTitleColor(UIColor(named: "darkTextColor"), for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 0.2
        
        btn.contentHorizontalAlignment = .fill
        // Görsel ve yazının boşluk ayarları
        
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 200) // Logonun sol boşluğu
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 60) // Yazı ile logo arasındaki boşluk
            
        btn.layer.cornerRadius = 10

        return btn
    }()
    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    private let lineView2: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    private let orLoginWith: UILabel = {
        let lbl = UILabel()
        lbl.text = "Or login with"
        lbl.textColor = .lightGray
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 15, weight: .bold)
        return lbl
    }()
    private let emailTF : UITextField = {
        let tf = UITextField()
        tf.layer.borderWidth = 0.2
        tf.layer.cornerRadius = 10
        tf.placeholder = "E-mail"
        tf.font = .systemFont(ofSize: 15, weight: .regular)
        // Sol tarafta boşluk eklemek için leftView kullanıyoruz
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always // Her zaman sol boşluk olsun
        return tf
    }()
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.layer.borderWidth = 0.2
        tf.layer.cornerRadius = 10
        tf.placeholder = "Password"
        tf.font = .systemFont(ofSize: 15, weight: .regular)
        
        // Sol tarafta boşluk eklemek için leftView kullanıyoruz
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        
        // Parola alanı olarak ayarla (yazılanlar yıldız şeklinde görünsün)
        tf.isSecureTextEntry = true
        
        return tf
    }()
    private let checkButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "square"), for: .normal)
        btn.tintColor = .black
        return btn
    }()    
    private let rememberMeButton: UILabel = {
        let lbl = UILabel()
        lbl.text = "Remember me"
        lbl.textColor = .gray
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    private let forgotButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Forgot Password ?", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        return btn
    }()
    private let loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(named: "blueColor")
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        return btn
    }()
    private let dontHave: UILabel = {
        let lbl = UILabel()
        lbl.text = "Don't have an account?"
        lbl.textColor = .gray
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.font = .systemFont(ofSize: 13, weight: .regular)
        return lbl
    }()
    private let signUpButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        btn.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return btn
    }()
    private let bottomPadingView: UIView = {
        let padingView = UIView()
        padingView.backgroundColor = UIColor(named: "whiteBG")
        return padingView
    }()
    
    private var isPasswordVisible = false
    private var checkButtonTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLoginScreen()
    }
    
    @objc func checkButtonFunc(){
        checkButtonTapped.toggle()
        if checkButtonTapped {
            checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            checkButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }

    @objc func viewTapped(){
        print("deneme")
    }
    
    @objc func signUpButtonTapped(){
        let singUpVC = SingUpViewController()
        singUpVC.modalPresentationStyle = .fullScreen
        present(singUpVC, animated: true, completion: nil)
    }
    @objc func togglePasswordVisibility() {
        isPasswordVisible.toggle() // Durumu tersine çevir (görünür/gizli)
        passwordTF.isSecureTextEntry = !isPasswordVisible
        
        // Simgeyi değiştir
        let imageName = isPasswordVisible ? "eye" : "eye.slash"
        if let button = passwordTF.rightView as? UIButton {
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    func configureLoginScreen(){
        [backgroundImage, pageTitle, pageSubTitle,pageSmallTitle,  pageUIView, withGoogleButton,orLoginWith, lineView, lineView2, emailTF, passwordTF, checkButton, rememberMeButton, forgotButton, loginButton, dontHave, signUpButton, bottomPadingView].forEach{
            view.addSubview($0)
        }
        [backgroundImage, pageTitle, pageSubTitle,pageSmallTitle,  pageUIView, withGoogleButton,orLoginWith, lineView, lineView2, emailTF, passwordTF, checkButton, rememberMeButton, forgotButton, loginButton, dontHave, signUpButton,bottomPadingView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //Button targets
        checkButton.addTarget(self, action: #selector(checkButtonFunc), for: .touchUpInside)
        // Tap gesture ekleyin
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        pageUIView.addGestureRecognizer(tapGesture)
        
        configurePasswordTextField()
        configureLayouts()
    }
    
    func configureLayouts(){
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageTitle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            pageSubTitle.topAnchor.constraint(equalTo: pageTitle.bottomAnchor,constant: 10),
            pageSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            pageSmallTitle.topAnchor.constraint(equalTo: pageSubTitle.bottomAnchor,constant: 10),
            pageSmallTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            pageSmallTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            pageUIView.topAnchor.constraint(equalTo: pageSmallTitle.bottomAnchor,constant: 20),
            pageUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pageUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pageUIView.bottomAnchor.constraint(equalTo: dontHave.bottomAnchor, constant: 20),
            
            withGoogleButton.topAnchor.constraint(equalTo: pageUIView.topAnchor, constant: 25),
            withGoogleButton.leadingAnchor.constraint(equalTo: pageUIView.leadingAnchor, constant: 25),
            withGoogleButton.trailingAnchor.constraint(equalTo: pageUIView.trailingAnchor, constant: -25),
            withGoogleButton.heightAnchor.constraint(equalToConstant: 45),
            
            lineView.topAnchor.constraint(equalTo: withGoogleButton.bottomAnchor, constant: 35),
            lineView.leadingAnchor.constraint(equalTo: withGoogleButton.leadingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.9),
            lineView.widthAnchor.constraint(equalTo: withGoogleButton.widthAnchor, multiplier: 0.3),
            
            lineView2.trailingAnchor.constraint(equalTo: withGoogleButton.trailingAnchor),
            lineView2.topAnchor.constraint(equalTo: lineView.topAnchor),
            lineView2.widthAnchor.constraint(equalTo: lineView.widthAnchor),
            lineView2.heightAnchor.constraint(equalTo: lineView.heightAnchor),
    
            
            orLoginWith.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
            orLoginWith.leadingAnchor.constraint(equalTo: lineView.trailingAnchor),
            orLoginWith.trailingAnchor.constraint(equalTo: lineView2.leadingAnchor),
            
            emailTF.leadingAnchor.constraint(equalTo: withGoogleButton.leadingAnchor),
            emailTF.trailingAnchor.constraint(equalTo: withGoogleButton.trailingAnchor),
            emailTF.topAnchor.constraint(equalTo: orLoginWith.bottomAnchor, constant: 35),
            emailTF.heightAnchor.constraint(equalTo: withGoogleButton.heightAnchor),
            
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 20),
            passwordTF.leadingAnchor.constraint(equalTo: emailTF.leadingAnchor),
            passwordTF.trailingAnchor.constraint(equalTo: emailTF.trailingAnchor),
            passwordTF.heightAnchor.constraint(equalTo: emailTF.heightAnchor),
            
            checkButton.leadingAnchor.constraint(equalTo: withGoogleButton.leadingAnchor, constant: 2),
            checkButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
            
            rememberMeButton.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 10),
            rememberMeButton.centerYAnchor.constraint(equalTo: checkButton.centerYAnchor),
            
            forgotButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),
            forgotButton.centerYAnchor.constraint(equalTo: rememberMeButton.centerYAnchor),
            
            loginButton.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 25),
            loginButton.heightAnchor.constraint(equalTo: passwordTF.heightAnchor),
            
            dontHave.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 40),
            dontHave.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            
            signUpButton.leadingAnchor.constraint(equalTo: dontHave.trailingAnchor, constant: 5),
            signUpButton.centerYAnchor.constraint(equalTo: dontHave.centerYAnchor),
            
            bottomPadingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomPadingView.topAnchor.constraint(equalTo: pageUIView.bottomAnchor),
            bottomPadingView.widthAnchor.constraint(equalToConstant: 10),
            bottomPadingView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
        ])
    }
    func configurePasswordTextField() {
        // Göz simgesi olan buton ekle
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        // Sağ tarafta biraz boşluk bırakmak için UIView ekle
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 30)) // 15 px boşluk
        rightPaddingView.addSubview(eyeButton)
        // Butona basıldığında göz simgesini ve parola görünürlüğünü değiştir
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        // Sağ tarafa göz simgesi olan butonu ekle
        passwordTF.rightView = rightPaddingView
        passwordTF.rightViewMode = .always
    }

}
#Preview(){
    LoginViewController()
}
