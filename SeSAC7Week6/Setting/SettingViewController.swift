//
//  SettingViewController.swift
//  SeSAC7Week6
//
//  Created by Jack on 8/6/25.
//

import UIKit
import SnapKit

enum Setting: String, CaseIterable {
    
    case version = "버전정보"
    case personal = "개인정보"
    case push = "푸시설정"
    case setting = "설정"
    
    var detail: [String] {
        switch self {
        case .setting:
            return ["알림", "채팅", "친구"]
        case .version:
            return ["개인정보처리방침", "오픈소스라이센스", "기타"]
        case .personal:
            return ["프로필 수정", "회원탈퇴"]
        case .push:
            return ["asdas", "asda", "d"]
        }
    }
}

class SettingViewController: UIViewController {
    
    let list = Setting.allCases
    
    lazy var tableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Setting.allCases[section].detail.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].rawValue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
            let row = Setting.allCases[indexPath.section].detail[indexPath.row]
            cell.settingLabel.text = row
        return cell
        
    }
}


extension SettingViewController {
    
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureView() {
        navigationItem.title = "네비게이션 타이틀"
        view.backgroundColor = .white
    }
}
