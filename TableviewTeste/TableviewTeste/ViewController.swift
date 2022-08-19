import UIKit

enum Contacts {
    static let contacts: [Contact] = [
        Contact(name: "Matheus", telephone: "3133333333"),
        Contact(name: "Luix", telephone: "3133333333"),
        Contact(name: "Otavio", telephone: "3133333333"),
        Contact(name: "Leo", telephone: "3133333333"),
        Contact(name: "Luiza", telephone: "3133333333"),
        Contact(name: "Amanda", telephone: "3133333333"),
        Contact(name: "Jorgina", telephone: "3133333333"),
    ]
}

struct Section {
    let letter: String
    let names: [Contact]
}

var sections = [Section]()

let userNames = Contacts.contacts.map { $0 }

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let groupedDictionary = Dictionary(grouping: userNames, by: {String($0.name.prefix(1))})
        let keys = groupedDictionary.keys.sorted()
        
        sections = keys.map{ Section(letter: $0, names: groupedDictionary[$0]!.sorted()) }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContactDetail" {
            let controller = segue.destination as! DetailViewController
            controller.contact = contact
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].names.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map{$0.letter}
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].letter
    }
   
}

extension ViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let section = sections[indexPath.section]
        contact = section.names[index]
        self.performSegue(withIdentifier: "ContactDetail", sender: contact)
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
       let section = sections[indexPath.section]
       let username = section.names[indexPath.row]
       cell.textLabel?.text = username.name
       return cell
    }   
    
}
