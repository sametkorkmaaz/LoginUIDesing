//
//  SingUpViewController.swift
//  LoginUIDesing
//
//  Created by Samet Korkmaz on 13.09.2024.
//

import UIKit

class SingUpViewController: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "appBG")
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let backButton: UIButton = {
        let btn = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        let largeImage = UIImage(systemName: "arrow.backward", withConfiguration: largeConfig)
        btn.setImage(largeImage, for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    private let singUpTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sign Up"
        lbl.font = .systemFont(ofSize: 30, weight: .bold)
        lbl.textColor = .white
        return lbl
    }()
    private let haveAccountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Already have an account?"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    private let logInButton: UIButton = {
        let btn = UIButton()
        // Altı çizili metin oluşturmak için NSAttributedString kullanıyoruz
        let title = NSAttributedString(string: "Log In", attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue, // Alt çizgi
            .foregroundColor: UIColor.white, // Yazı rengi
            .font: UIFont.systemFont(ofSize: 15, weight: .regular) // Yazı tipi ve boyutu
        ])
        // Attributed title'ı butona ayarla
        btn.setAttributedTitle(title, for: .normal)
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    private let pageUIView: UIView = {
        let uView = UIView()
        uView.backgroundColor = .white
        uView.layer.cornerRadius = 10
        return uView
    }()
    private let nameTF: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 10
        tf.placeholder = "Name"
        tf.layer.borderWidth = 0.2
        tf.font = .systemFont(ofSize: 15, weight: .medium)
        tf.textColor = UIColor(named: "darkTextColor")
        tf.leftView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        tf.leftViewMode = .always
        return tf
    }()
    private let surnameTF: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 10
        tf.placeholder = "Surname"
        tf.layer.borderWidth = 0.2
        tf.font = .systemFont(ofSize: 15, weight: .medium)
        tf.textColor = UIColor(named: "darkTextColor")
        tf.leftView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        tf.leftViewMode = .always
        return tf
    }()
    private let emailTF: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 10
        tf.placeholder = "E-mail"
        tf.layer.borderWidth = 0.2
        tf.font = .systemFont(ofSize: 15, weight: .medium)
        tf.textColor = UIColor(named: "darkTextColor")
        tf.leftView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        tf.leftViewMode = .always
        return tf
    }()
    private let dateTF: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 10
        tf.placeholder = "DD/MM/YYYY"
        tf.layer.borderWidth = 0.2
        tf.font = .systemFont(ofSize: 15, weight: .medium)
        tf.textColor = UIColor(named: "darkTextColor")
        tf.leftView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        tf.leftViewMode = .always
        tf.keyboardType = .numberPad
        return tf
    }()
    private let phoneNumberTF: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 10
        tf.placeholder = "(000) 000-0000"
        tf.layer.borderWidth = 0.2
        tf.font = .systemFont(ofSize: 15, weight: .medium)
        tf.textColor = UIColor(named: "darkTextColor")
        tf.leftView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        tf.leftViewMode = .always
        tf.keyboardType = .numberPad
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
    private let registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(named: "blueColor")
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
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
    private let orLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Or"
        lbl.textColor = .lightGray
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 15, weight: .bold)
        return lbl
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
    private let bottomPadingView: UIView = {
        let padingView = UIView()
        padingView.backgroundColor = UIColor(named: "whiteBG")
        return padingView
    }()
    
    private var isPasswordVisible = false
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSingUpView()
        emailTF.delegate = self
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
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
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy" // İstediğiniz format
        dateTF.text = dateFormatter.string(from: sender.date)
    }

    @objc func donePressed() {
        self.view.endEditing(true) // Klavyeyi kapat
    }

    func configureSingUpView(){
        [backgroundImage, backButton, singUpTitle, haveAccountLabel, logInButton, pageUIView, nameTF, surnameTF, emailTF, dateTF, phoneNumberTF, passwordTF, registerButton, lineView, lineView2, orLabel, withGoogleButton, bottomPadingView].forEach{
            view.addSubview($0)
        }
        [backgroundImage, backButton, singUpTitle, haveAccountLabel, logInButton, pageUIView, nameTF, surnameTF, emailTF, dateTF, phoneNumberTF, passwordTF, registerButton, lineView, lineView2, orLabel, withGoogleButton, bottomPadingView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupDatePicker()
        configurePasswordTextField()
        configureSingUpViewLayputs()
    }
    
    func configureSingUpViewLayputs(){
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            
            singUpTitle.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            singUpTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            haveAccountLabel.topAnchor.constraint(equalTo: singUpTitle.bottomAnchor, constant: 10),
            haveAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width/5),
            
            logInButton.centerYAnchor.constraint(equalTo: haveAccountLabel.centerYAnchor),
            logInButton.leadingAnchor.constraint(equalTo: haveAccountLabel.trailingAnchor, constant: 5),
            
            pageUIView.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20),
            pageUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pageUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pageUIView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),
            
            nameTF.topAnchor.constraint(equalTo: pageUIView.topAnchor, constant: 20),
            nameTF.leadingAnchor.constraint(equalTo: pageUIView.leadingAnchor, constant: 20),
            nameTF.widthAnchor.constraint(equalTo: pageUIView.widthAnchor, multiplier: 0.42),
            nameTF.heightAnchor.constraint(equalTo: pageUIView.heightAnchor, multiplier: 0.09),
            
            surnameTF.trailingAnchor.constraint(equalTo: pageUIView.trailingAnchor, constant: -20),
            surnameTF.centerYAnchor.constraint(equalTo: nameTF.centerYAnchor),
            surnameTF.widthAnchor.constraint(equalTo: nameTF.widthAnchor),
            surnameTF.heightAnchor.constraint(equalTo: nameTF.heightAnchor),
            
            emailTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 20),
            emailTF.leadingAnchor.constraint(equalTo: nameTF.leadingAnchor),
            emailTF.trailingAnchor.constraint(equalTo: surnameTF.trailingAnchor),
            emailTF.heightAnchor.constraint(equalTo: nameTF.heightAnchor),
            
            dateTF.leadingAnchor.constraint(equalTo: emailTF.leadingAnchor),
            dateTF.trailingAnchor.constraint(equalTo: emailTF.trailingAnchor),
            dateTF.heightAnchor.constraint(equalTo: emailTF.heightAnchor),
            dateTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 20),
            
            phoneNumberTF.leadingAnchor.constraint(equalTo: dateTF.leadingAnchor),
            phoneNumberTF.trailingAnchor.constraint(equalTo: dateTF.trailingAnchor),
            phoneNumberTF.topAnchor.constraint(equalTo: dateTF.bottomAnchor, constant: 20),
            phoneNumberTF.heightAnchor.constraint(equalTo: dateTF.heightAnchor),
            
            passwordTF.leadingAnchor.constraint(equalTo: phoneNumberTF.leadingAnchor),
            passwordTF.trailingAnchor.constraint(equalTo: phoneNumberTF.trailingAnchor),
            passwordTF.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 20),
            passwordTF.heightAnchor.constraint(equalTo: phoneNumberTF.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: passwordTF.heightAnchor),
            
            lineView.leadingAnchor.constraint(equalTo: registerButton.leadingAnchor),
            lineView.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            lineView.widthAnchor.constraint(equalTo: pageUIView.widthAnchor, multiplier: 0.38),
            
            lineView2.trailingAnchor.constraint(equalTo: registerButton.trailingAnchor),
            lineView2.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
            lineView2.heightAnchor.constraint(equalTo: lineView.heightAnchor),
            lineView2.widthAnchor.constraint(equalTo: lineView.widthAnchor),
            
            orLabel.leadingAnchor.constraint(equalTo: lineView.trailingAnchor),
            orLabel.trailingAnchor.constraint(equalTo: lineView2.leadingAnchor),
            orLabel.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
            
            withGoogleButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            withGoogleButton.heightAnchor.constraint(equalTo: passwordTF.heightAnchor),
            withGoogleButton.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor),
            withGoogleButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),

            
            bottomPadingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomPadingView.topAnchor.constraint(equalTo: pageUIView.bottomAnchor),
            bottomPadingView.widthAnchor.constraint(equalToConstant: 10),
            bottomPadingView.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
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
    func setupDatePicker() {
        // DatePicker oluştur
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels // iOS 14 ve sonrası için stil
        datePicker.locale = Locale(identifier: "en_GB") // Gün/Ay/Yıl formatı

        // DatePicker'ı TextField'in inputView'una ata
        dateTF.inputView = datePicker

        // "Done" butonu ekleyerek kullanıcıyı tarih seçimini tamamlamaya yönlendir
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)

        dateTF.inputAccessoryView = toolbar

        // DatePicker'da bir tarih seçildiğinde çağrılacak yöntem
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
}

extension SingUpViewController: UITextFieldDelegate{
    // Kullanıcının girdiği tüm karakterleri küçük harfe dönüştürme
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let textRange = Range(range, in: textField.text ?? "") {
            let updatedText = textField.text?.replacingCharacters(in: textRange, with: string.lowercased())
            textField.text = updatedText
        }
        return false
    }
}

#Preview(){
    SingUpViewController()
}
