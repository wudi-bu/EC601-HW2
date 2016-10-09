//
//  NameViewController.swift
//  ec601_homework2
//
//  Created by 吴迪 on 9/30/16.
//  Copyright © 2016 吴迪. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    //Name samples
    @IBOutlet weak var webVIew: UIWebView!
    var name_array = ["李思图","王晓天","赵一凡","陈思源","富贵山"]
    @IBOutlet weak var Name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let talkshow_link:String = "https://www.youtube.com/embed/s-RNqQxwg-Y"
        let width = 375
        let height = 300
        let frame = 30;
        let Code:NSString = "<iframe width=\(width) height=\(height) src=\(talkshow_link) frameborder=\(frame) allowfullscreen></iframe>" as NSString;
        self.webVIew.loadHTMLString(Code as String, baseURL: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Enable current controler to be first responder
    override var canBecomeFirstResponder: Bool { return true }
    //Shake detetion
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(motion == UIEventSubtype.motionShake){
            var alertController1 = UIAlertController(title: "恭喜你，成功了！", message: nil, preferredStyle: .alert)
            var cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            alertController1.addAction(cancelAction)
            self.present(alertController1, animated: true, completion: nil)
            //Generate random number to set Name label
            Name.text = name_array[Int(arc4random_uniform(4))]
        }
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
