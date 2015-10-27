

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {

    
    @IBOutlet weak var tableView: UITableView!;
    
    let images = [
        "A-Lin",
        "卓文萱",
        "田馥甄",
        "叮噹",
        "許茹芸",
        "林依晨",
        "蔡依林",
        "王心凌"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(DefaultCell.classForCoder(), forCellReuseIdentifier: "Cell");
        
        
        
    }
    
    func getPage(identifier: String) -> AnyObject? {
        return self.storyboard?.instantiateViewControllerWithIdentifier(identifier);
    }

    //MARK: UITableViewDelegate / DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DefaultCell;
        cell.indexPath = indexPath;
        cell.textLabel?.text = "Image: \(self.images[indexPath.row])";
        
        // resgister this to using 3d Touch.
        // if your app api basic version lower than iOS 9.0, you'll need it.
        if #available(iOS 9.0, *) {
            self.registerForPreviewingWithDelegate(self, sourceView: cell);
        }
        
        
        return cell;
        
    }
    
    
    //MARK: UIViewControllerPreviewingDelegate - 3DTouch Using.
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        let index = (previewingContext.sourceView as! DefaultCell).indexPath
        
        let page = getPage("ImageViewController") as! ImageViewController;
        page.imageName = self.images[index.row];
        self.navigationController?.pushViewController(page, animated: true);
        
    }
    
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let index = (previewingContext.sourceView as! DefaultCell).indexPath
        let page = getPage("ImageViewController") as! ImageViewController;
        page.imageName = self.images[index.row];
        page.isPreview = true;
        return page;
    }
    
    
    
    
    
}

