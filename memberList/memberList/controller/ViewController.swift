//
//  ViewController.swift
//  memberList
//
//  Created by 이주환 on 2022/11/03.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView! = UITableView()
    
    // MVC패턴을 위한 데이터 매니저 (배열 관리 - 데이터)
    var memberListManager = MemberManager()
    
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        memberListManager.makeMembersListDatas()
        title = "MemberList"
        
        // 네비게이션바 오른쪽 상단 버튼 설정
        self.navigationItem.rightBarButtonItem = self.plusButton
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 60
//        tableView.backgroundColor = .blue
        tableView.register(MemberTableViewCell.self, forCellReuseIdentifier: "memberCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    // 멤버를 추가하기 위한 다음 화면으로 이동
    @objc func plusButtonTapped() {
        // 다음화면으로 이동 (멤버는 전달하지 않음)
        let detailVC = DetailViewController()
        
        // 다음 화면의 대리자 설정 (다음 화면의 대리자는 지금 현재의 뷰컨트롤러)
        detailVC.delegate = self
        
        // 화면이동
        navigationController?.pushViewController(detailVC, animated: true)
        //show(detailVC, sender: nil)
    }


}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath) as! MemberTableViewCell
        
        let arr = memberListManager.getMembersList()
        cell.member = arr[indexPath.row]
//        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let detailVC = DetailViewController()
        
        // 다음 화면의 대리자 설정 (다음 화면의 대리자는 지금 현재의 뷰컨트롤러)
        //detailVC.delegate = self
        
        // 다음 화면에 멤버를 전달
        let currentMember = memberListManager.getMembersList()[indexPath.row]
        detailVC.member = currentMember
        detailVC.delegate = self
        // 화면이동
        navigationController?.pushViewController(detailVC, animated: true)
        //show(detailVC, sender: nil)
    
    }
}

extension ViewController: MemberDelegate {
    func addNewMember(_ member: Member) {
        // 모델에 멤버 추가
        memberListManager.makeNewMember(member)
        // 테이블뷰를 다시 로드 (다시 그리기)
        tableView.reloadData()
    }
    
    func update(index: Int, _ member: Member) {
        // 모델에 멤버 정보 업데이트
        memberListManager.updateMemberInfo(index: index, member)
        // 테이블뷰를 다시 로드 (다시 그리기)
        tableView.reloadData()
    }
    
    
    
}
