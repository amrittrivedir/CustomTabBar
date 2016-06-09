

import UIKit

@objc(ATTabbar) class ATTabbar: UIStoryboardSegue {

    override func perform() {
        let tabBarViewController:ViewController = self.sourceViewController as! ViewController
        let myDestinationviewController:UIViewController=tabBarViewController.destinationViewController! as UIViewController
        
        if ((tabBarViewController.oldViewController?.isViewLoaded()) != nil)
        {
            tabBarViewController.oldViewController!.willMoveToParentViewController(nil)
            tabBarViewController.oldViewController!.view.removeFromSuperview()
            tabBarViewController.oldViewController!.removeFromParentViewController()
        }
        myDestinationviewController.view.frame=tabBarViewController.container.bounds
        tabBarViewController.addChildViewController(myDestinationviewController)
        tabBarViewController.container.addSubview(myDestinationviewController.view)
        myDestinationviewController.didMoveToParentViewController(tabBarViewController)
    }
}
