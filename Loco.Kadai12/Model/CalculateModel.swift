import Foundation

final class CalculateModel {
    private(set) var taxIncludedPrice: Int?

    func calculatePrice(price: Int, tax: Int) {
        let resultTax = Double(price) * (Double(tax) / 100)
        taxIncludedPrice = price + Int(resultTax)
        calculateNotice()
    }

    private func calculateNotice () {
        NotificationCenter.default.post(name: .calculateNotice, object: nil)
    }
}
