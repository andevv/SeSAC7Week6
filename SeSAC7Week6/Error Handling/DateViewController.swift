//
//  DateViewController.swift
//  SeSAC7Week6
//
//  Created by andev on 8/7/25.
//

import UIKit
import SnapKit

//오류 처리 패턴
enum BoxOfficeValidationError: Error {
    case emptyString
    case isNotInt
    case isNotDate
}

class DateViewController: UIViewController {
    
    let textField = UITextField()
    let button = UIButton()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        configure()
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        
        guard let text = textField.text else {
            print("텍스트필드 글자가 nil입니다")
            return
        }
        
        do {
            let _ = try validateUserInput(text: text)
            label.text = "검색이 가능합니다."
            
        } catch BoxOfficeValidationError.emptyString {
            label.text = "빈 문자는 검색을 할 수 없습니다."
        } catch BoxOfficeValidationError.isNotInt {
            label.text = "문자열은 검색을 할 수 없습니다."
        } catch BoxOfficeValidationError.isNotDate {
            label.text = "날짜가 아니면 검색을 할 수 없습니다."
        } catch {
            label.text = "BoxOffice 에러가 아닌 다른 상황"
        }
        
        
        //        if validateUserInput(text: text) {
        //            label.text = "검색이 가능합니다."
        //        } else {
        //            label.text = "검색을 할 수 없습니다."
        //        }
    }
    
    func validateUserInput(text: String) throws(BoxOfficeValidationError) -> Bool {
        
        //빈 값
        guard !(text.isEmpty) else {
            print("빈 값")
            throw .emptyString
        }
        
        //입력한 내용이 숫자인지
        guard Int(text) != nil else {
            print("숫자가 아닙니다")
            throw .isNotInt
        }
        
        //입력한 값이 날짜 형태로 변환되는지
        guard checkDateFormat(text: text) else {
            print("숫자지만 날짜 형태가 아닙니다")
            throw .isNotDate
        }
        
        return true
    }
    
    func configure() {
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(label)
        
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        button.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(textField.snp.bottom).offset(20)
        }
        label.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(button.snp.bottom).offset(20)
        }
        button.backgroundColor = .red
        label.backgroundColor = .yellow
    }
    
    func checkDateFormat(text: String) -> Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        return format.date(from: text) == nil ? false : true
    }
    
    
}
