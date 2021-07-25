import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var inputPriceTextField: UITextField!
    @IBOutlet private weak var inputTaxTextField: UITextField!

    var token: NSObjectProtocol?

    private let calculateModel = CalculateModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        token = NotificationCenter.default.addObserver(forName: .calculateNotice, object: nil, queue: OperationQueue.main, using: { [weak self] _ in self?.displayResultPrice()
        })

        inputTaxTextField.text = UserDefaults.standard.string(forKey: "tax")
    }

    private func displayResultPrice() {
        priceLabel.text = "\(String(calculateModel.taxIncludedPrice!))円"
    }

    @IBAction private func calculateButton(_ sender: Any) {
        let price = Int(inputPriceTextField.text!) ?? 0
        let tax = Int(inputTaxTextField.text!) ?? 0
        calculateModel.calculatePrice(price: price, tax: tax)

        UserDefaults.standard.set(tax, forKey: "tax")
    }
}

extension Notification.Name {
    static var calculateNotice = Notification.Name("calculateNotice")
}
