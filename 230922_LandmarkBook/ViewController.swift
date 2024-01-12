//
//  ViewController.swift
//  230922_LandmarkBook
//
//  Created by hasan bilgin on 22.09.2023.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    //tableView listeleme itemi diyebiliriz
    //storyboarddan table view getirdik ve add new constraints den üst sağ sol alt 0 yaptık
    //UITableViewDelegate,UITableViewDataSource tableView için nmiras aldık bunlar protokol(Pr)

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages=[UIImage]()
    
    var chosenLandmarkName=""
    var chosenLandmarkImage=UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewController delegatemizi tableview aktarıyoruz aynı şekilde alttakide öle
        tableView.delegate=self
        tableView.dataSource=self
        
       
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonhenge")
        landmarkNames.append("Taj Mahal")
        
       
        landmarkImages.append(UIImage(named: "colosseum.jpg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpg")!)
        
    }
    
    //kalıtımdan getirdik tableView için
    //tableViewde kaç tane item olucağını sorar
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        return landmarkNames.count
    }
    
    //kalıtımdan getirdik tableView için
    //tableViewde ne gösterilceğini sorar
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //kalkıcak olan koddur 4 satırı yerine yazılabilir tabi geçerli ise
        //cell.textLabel?.text="test"
        //cell.defaultContentConfiguration() içerik ayarlayıcısı diyebiliriz
        var content=cell.defaultContentConfiguration()
        //content içinde image de vardır
        //ana texttir
        content.text=landmarkNames[indexPath.row]
        //resimli göstericek
        //content.image=landmarkImages[indexPath.row]
        //ikincil texttir textin altında yer alır
        //content.secondaryText="ikinciltest"
        //oluşturduğumuz contente eşitleyelim
        cell.contentConfiguration=content
        return cell
    }
    
    //tableview item/sıra/hücre seçildiğinde
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName=landmarkNames[indexPath.row]
        chosenLandmarkImage=landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil )
    }
    
    
    //ekran geçişi yapmadna önce o ekranın değişkenlerine ulaşabiliyoruz ve ona göre veri göndericez
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toDetailsVC"{
            //hedef DetailsVC anlamı taşıyor
            let destinationVC=segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName=chosenLandmarkName
            destinationVC.selectedLandmarkImage=chosenLandmarkImage
        }
    }
    
    //row un delete insert vs özellik veren function dur
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //indexPath seçilen indextir
            //landmarkNames.remove.. de aynı self demesi karışmasın manasında
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            //dizilerden sildik tableviewden de silelim
            //bu tüm listeyi yeniler çalışır ama kastırabilir
            //tableView.reloadData()
            //ondna bunu denedik
            //with animasyon çeşidi seçebiliriz
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    //resimleri atarken 1xte çıkıyo ya 2x yada 3x büyüklükte varsa atılabilir anlamında detaylı gösterilcek

    


}

