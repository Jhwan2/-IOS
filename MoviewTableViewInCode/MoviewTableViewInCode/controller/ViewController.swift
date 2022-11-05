//
//  ViewController.swift
//  MoviewTableViewInCode
//
//  Created by 이주환 on 2022/10/02.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView = UITableView()
    private var movies: [Movie] = []
    var moviemanager = MovieManager()
    
    
    
    //MARK: view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.s
        tableSet()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 120
        
        moviemanager.setMovies()
        movies = moviemanager.getMovieArray()
    }
    
    //MARK: table auto layout setting
    func tableSet(){
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "movieCell")
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! CustomTableViewCell
        
        cell.mainImageView.image = movies[indexPath.row].movieImage
        cell.movieNameLabel.text = movies[indexPath.row].movieName
        cell.descriptionLabel.text = movies[indexPath.row].movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
    

}


extension ViewController: UITableViewDelegate {
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let detailVC = detailViewController()
        detailVC.movieData = movies[indexPath.row]
        //show(detailVC, sender: nil)
//        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true)
    }
}


