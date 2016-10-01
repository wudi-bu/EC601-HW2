//
//  WelcomeViewController.swift
//  ec601_homework2
//
//  Created by 吴迪 on 9/29/16.
//  Copyright © 2016 吴迪. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UITextView!
    //index of the page
    var index : Int = 0
    //String to do assigment to the var
    var heading : String = ""
    var imageFile : String = ""
    var subHeading : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // This is a bug,the index is oposite,1 is actually 0,0 is actually 1. Use this to make it work for now
        var k=0
        if(index==1)
        {
        k = 0
        }
        else
        {
        k = 1
        }
        pageControl.currentPage = k
        //using data in array to set the labels and pictures in the welcome page
        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
        getStartedButton.isHidden = (index == 1) ? false : true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
