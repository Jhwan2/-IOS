//
//  detailViewController.swift
//  MoviewTableViewInCode
//
//  Created by 이주환 on 2022/10/02.
//

import UIKit

class detailViewController: UIViewController {
    
    var dView = detailView()
    
    var movieData: Movie?
    
    override func loadView() {
        self.view = dView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dView.mainImageView.image = movieData?.movieImage
        dView.movieNameLabel.text = movieData?.movieName
        dView.descriptionLabel.text = movieData?.movieDescription

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
