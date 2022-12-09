//
//  ViewController.swift
//  Session4DynamicTable
//
//  Created by Ali Akbar on 02/12/22.
//

import UIKit

let dummyAcademyData = [
  AcademyModel(
    id: 145,
    name: "Memulai Pemrograman Dengan Swift",
    image: UIImage(named: "Swift")!,
    description: "Belajar bahasa Swift buat kamu yang ingin mempelajari konsep dasar pemrograman dalam mengembangkan aplikasi iOS, iPadOS, dan macOS."
  ), AcademyModel(
    id: 171,
    name: "Belajar Membuat Aplikasi iOS untuk Pemula",
    image: UIImage(named: "iOSPemula")!,
    description: "Pelajari cara membuat aplikasi pertamamu dengan Xcode. Kelas ini mengajarkan dasar yang dibutuhkan mulai dari Controller sampai TableViews."
  ), AcademyModel(
    id: 202,
    name: "Belajar Fundamental Aplikasi iOS",
    image: UIImage(named: "iOSFundamental")!,
    description: "Pelajari komponen fundamental iOS berdasarkan teknik yang digunakan industri mulai dari App Design, SwiftUI, Networking, sampai Database."
  ), AcademyModel(
    id: 209,
    name: "Menjadi iOS Developer Expert",
    image: UIImage(named: "iOSExpert")!,
    description: "Saatnya jadi iOS Expert dengan belajar Clean Code, Design Pattern, Clean Architecture, Reactive Programming, DI, Modularization, dan TDD."
  ), AcademyModel(
    id: 169,
    name: "Belajar Prinsip Pemrograman SOLID",
    image: UIImage(named: "SOLID")!,
    description: "Pelajari kelima prinsip desain yang merupakan pedoman untuk rancangan kode yang baik pada pemrograman berorientasi objek (OOP)."
  ), AcademyModel(
    id: 292,
    name: "Meniti Karier sebagai Software Developer",
    image: UIImage(named: "MenitiKarier")!,
    description: "Pelajari berbagai jalur yang tersedia sebagai Software Developer dari sudut pandang developer ahli yang sudah meniti karier di bidangnya."
  ), AcademyModel(
    id: 317,
    name: "Belajar Dasar Git dengan GitHub",
    image: UIImage(named: "GitDenganGitHub")!,
    description: "Pelajari cara mengelola data atau kode menggunakan Git dengan GitHub, mulai dari dasar-dasar Git hingga berkolaborasi dengan tim."
  ), AcademyModel(
    id: 237,
    name: "Memulai Dasar Pemrograman untuk Menjadi Pengembang Software",
    image: UIImage(named: "PengembangSoftware")!,
    description: "Pelajari langkah menjadi pengembang software dari tahapan analisis dan perencanaan sampai modifikasi perangkat lunak beserta dokumentasi."
  )
]

class ViewController: UIViewController {

    @IBOutlet weak var academyTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        academyTableView.dataSource = self
        
        academyTableView.delegate = self
        
        academyTableView.register(UINib(nibName: "AcademyTableViewCell", bundle: nil), forCellReuseIdentifier: "AcademyCell")
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: dummyAcademyData[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.academyModel = sender as? AcademyModel
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "AcademyCell",
            for: indexPath
        ) as? AcademyTableViewCell {
            let academy = dummyAcademyData[indexPath.row]
            cell.academyLabel.text = academy.name
            cell.academyImageView.image = academy.image
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyAcademyData.count
    }
}
