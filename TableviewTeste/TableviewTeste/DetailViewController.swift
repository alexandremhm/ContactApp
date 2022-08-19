import UIKit

class DetailViewController: UIViewController {
    var contact: Contact?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var telephoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = contact {
            nameLabel.text = contact.name
            telephoneLabel.text = contact.telephone
        }
    }
}
