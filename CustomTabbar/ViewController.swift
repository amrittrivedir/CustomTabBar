

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    var destinationViewController:UIViewController!
    var oldViewController:UIViewController!
    var _viewControllersByIdentifier:NSMutableDictionary!
    var destinationIdentifier:NSString!

    @IBOutlet weak var sliderView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sliderView.layer.cornerRadius = 20
        
        
        _viewControllersByIdentifier = NSMutableDictionary()
        
        if(self.childViewControllers.count < 1){
            self.performSegueWithIdentifier("FirstSegue", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnTabChangedClicked(sender: AnyObject) {
        let button = sender as! UIButton
        UIView.animateWithDuration(0.5, animations: {
            self.sliderView.center = button.center
        })
        
        switch button.tag {
        case 1:
            self.performSegueWithIdentifier("FirstSegue", sender: nil)
        case 2:
            self.performSegueWithIdentifier("SecondSegue", sender: nil)
        case 3:
            self.performSegueWithIdentifier("ThirdSegue", sender: nil)
        case 4:
            self.performSegueWithIdentifier("FourthSegue", sender: nil)
            
        default:
            self.performSegueWithIdentifier("FirstSegue", sender: nil)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.oldViewController = self.destinationViewController;
        
        
        if((_viewControllersByIdentifier.objectForKey(segue.identifier!)) == nil){
            _viewControllersByIdentifier.setObject(segue.destinationViewController, forKey: segue.identifier!)
        }
        
        
        
        self.destinationIdentifier = segue.identifier;
        self.destinationViewController = _viewControllersByIdentifier.objectForKey(self.destinationIdentifier) as! UIViewController;
        
    }
}

