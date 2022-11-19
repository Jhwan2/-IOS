//
//  ViewController.swift
//  MusicSearch
//
//  Created by 이주환 on 2022/11/08.
//

import UIKit

class ViewController: UIViewController, UISearchControllerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var musicManager = musicSearchManager.shared
    var musicArr: [Music] = []
//    let searchBar = UISearchController()
    let searchBar = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchViewController)
    
    let musicURL = "https://itunes.apple.com/search?media=music&term="
    var searchKeyWord = "jazz"
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.searchController = searchBar
        searchBar.searchResultsUpdater = self
        
        // 첫글자 대문자 설정 없애기
        searchBar.searchBar.autocapitalizationType = .none
        
//        searchBar.searchBar.delegate = self
        
        // Do any additional setup after loading the view.
//        musicManager.fetchMusic(url: , completion: <#T##(MusicData) -> Void#>)
        self.title = "musicSearch"
        musicManager.getMusicArr(url: musicURL+searchKeyWord) { musics in
            print("@@@@@@@@@@@@@@@@@@@@@@@@")
//            print(musics)
            self.musicArr = musics
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
//            self.tableView.reloadData()
        }
        tableView.dataSource = self
        tableView.backgroundColor = .blue
        tableView.rowHeight = 120
//        tableView.register(MusicCell.self, forCellReuseIdentifier: "MusicCell")
        tableView.register(UINib(nibName: "MusicCell", bundle: nil), forCellReuseIdentifier: "MusicCell")
        
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        
        
//      sprint(musicArr[indexPath.row].songName as Any)
        cell.imageUrl = musicArr[indexPath.row].imageUrl
        cell.titleLabel.text = musicArr[indexPath.row].songName
        cell.detailLabel.text = musicArr[indexPath.row].artistName
        cell.selectionStyle = .none
        cell.dateLabel.text = musicArr[indexPath.row].albumName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return musicArr.count
    }
    
    
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchKeyWord = searchText
        musicArr = []
        musicManager.getMusicArr(url: musicURL+searchKeyWord) { musics in
            self.musicArr = musics
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
}

extension ViewController: UISearchResultsUpdating {
    // 유저가 글자를 입력하는 순간마다 호출되는 메서드 ===> 일반적으로 다른 화면을 보여줄때 구현
    func updateSearchResults(for searchController: UISearchController) {
        print("서치바에 입력되는 단어", searchController.searchBar.text ?? "")
        // 글자를 치는 순간에 다른 화면을 보여주고 싶다면 (컬렉션뷰를 보여줌)
        let vc = searchController.searchResultsController as! SearchViewController
        // 컬렉션뷰에 찾으려는 단어 전달
        vc.searchTerm = searchController.searchBar.text ?? ""
    }
}
