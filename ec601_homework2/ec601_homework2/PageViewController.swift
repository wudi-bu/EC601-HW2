//
//  PageViewController.swift
//  ec601_homework2
//
//  Created by 吴迪 on 9/29/16.
//  Copyright © 2016 吴迪. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource{
    var pageHeadings = ["step1:Find your Zodiac", "step2:Get a Chinese name"]
    var pageImages = ["12", "13"]
    var pageSubHeadings = ["Find your zodiac as a starter, simply input your year of birth and you will get your zodiac figure.", "Shake your phone to get a Chinese name.Doesn't like it?Shake again!"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the data source to itself
        dataSource = self
        
        // Create the first walkthrough screen
        if let startingViewController = self.viewControllerAtIndex(index: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //detect user scroll even to set index of pagecontroller, for scroll forward
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WelcomeViewController).index
        
        index += 1
        
        return self.viewControllerAtIndex(index: index)
    }
      //detect user scroll even to set index of pagecontroller, for scroll back
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WelcomeViewController).index
        
        index -= 1
        
        return self.viewControllerAtIndex(index: index)
    }
    func viewControllerAtIndex(index: Int) -> WelcomeViewController? {
        
        if index == NSNotFound || index < 0 || index >= self.pageHeadings.count {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "pagecontentviewcontroller") as? WelcomeViewController {
            
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
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
