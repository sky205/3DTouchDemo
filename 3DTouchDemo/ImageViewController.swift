
import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var isPreview: Bool = false;
    var imageName: String!;
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageNameLabel.text = self.imageName;
        if !self.isPreview {
            self.imageView.image = UIImage(named: "\(self.imageName).jpg");
            print(self.imageView.image);
            self.view.backgroundColor = UIColor(white: 1, alpha: 1);
        }else{
            self.view.backgroundColor = UIColor(white: 0.9, alpha: 1);
        }
        
    }
    
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        
        let items = [
            UIPreviewAction(title: "View", style: .Default, handler: { (actoin, controller) -> Void in
                print("View action handler");
            })
        ]
        
        return items;
    }
    

}
