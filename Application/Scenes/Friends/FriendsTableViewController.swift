//
//  FriendsTableViewController.swift
//  Application
//
//  Created by Alex Gikaev on 29.07.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    // MARK: - Аутлеты
    
    @IBOutlet var friendsTableView: UITableView!
    
    
    // MARK: - Свойства
    
    /// идентификатор для ячейки
    private let cellID = "FriendTableViewCell"
    /// массив с человеками
    var people = [Name(name: "Роман Демидов", image: UIImage(named: "Roma")),
                 Name(name: "Кирилл Орлов", image: UIImage(named: "Kirill")),
                 Name(name: "Клим Беларусов", image: UIImage(named: "Klim")),
                 Name(name: "Ксюша Корниенко", image: UIImage(named: "Ksusha")),
                 Name(name: "Николай Люкшин", image: UIImage(named: "Kolya")),
                 Name(name: "Георгий Алигафренович", image: UIImage(named: "Gosha"))]
    
    /// выход и добавление выбранного города
    @IBAction func goBackFromAvaliableFriends(with segue: UIStoryboardSegue) {
        guard let avaliableVC = segue.source as? AddFriendTableViewController,
              let indexPath = avaliableVC.tableView.indexPathForSelectedRow else { return }
        let newFriend = avaliableVC.people[indexPath.row]
        
        guard !people.contains(where: { $0.name == newFriend.name}) else {return}
             

        people.append(newFriend)
        friendsTableView.reloadData()
            
    }
    
  
    /// возвращает количество заполненных ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    /// воводит информацию в ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FriendTableViewCell else {
            fatalError("{Message: Error in dequeue FriendTableViewCell}")
        }
        cell.friendImage.image = people[indexPath.row].image
        cell.friendName.text = people[indexPath.row].name
        return cell
    }
    
    // функция удаления свайпом влево
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deletedFriend = people[indexPath.row]
            people.remove(at: indexPath.row)
            print(deletedFriend.name)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /// Отправляет данные с нажатой ячейки в collectionview 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushImage" {
            let cell: FriendTableViewCell = sender as! FriendTableViewCell
            let image = cell.friendImage.image
            let previewVC: FullScreenImageCollectionViewController = segue.destination as! FullScreenImageCollectionViewController
            
            previewVC.currentPhoto = image
        }
    }
}


//extension UIImageView {
//
//    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
//        layer.masksToBounds = false
//        layer.shadowOffset = offset
//        layer.shadowColor = color.cgColor
//        layer.shadowRadius = radius
//        layer.shadowOpacity = opacity
//
//        let backgroundCGColor = backgroundColor?.cgColor
//        backgroundColor = nil
//        layer.backgroundColor = backgroundCGColor
//    }
//}


