//
//  ViewController.swift
//  MeetTheTeam
//
//  Created by Wade Sellers on 5/19/17.
//  Copyright © 2017 WadeSellers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Begin of code")
        if let checkedUrl = URL(string: "https://pbs.twimg.com/profile_images/690230312706519041/abGQPwuR.jpg") {
            testImageView.contentMode = .scaleAspectFit
            downloadImage(url: checkedUrl)
        }
        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
    }

    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }

    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.testImageView.image = UIImage(data: data)
            }
        }
    }


}

