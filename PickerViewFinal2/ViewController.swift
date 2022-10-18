//
//  ViewController.swift
//  PickerViewFinal2
//
//  Created by Jonathan Kearns on 10/18/22.
//

import UIKit

struct Podcast{
    var name: String
    var description: String
    var genre: String
    var coverArt: String
    var network: String?
    var subscribed: Bool
    var dateAdded: String
    var episodes: [Episode]
    
}

extension Podcast{
    static let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.mm.dd"
        return formatter
    }()


var dateFromString : Date  {
    let DateString = dateAdded.components(separatedBy: ".").reversed().joined(separator: ".")
    return Podcast.dateFormatter.date(from: DateString)!
    }
}


struct Episode {
    var name: String
    var audioFile: String
    var episodeNumber: Int
    var seasonNumber: Int?
    var datePublished: Date?
    var description: String
    var episodeArt: String
    var length: TimeInterval
    var currentPlay: TimeInterval
    var timeRemaining: TimeInterval{
        get {
            return length - currentPlay
        }
    }
    var played: Bool?
    var favorited: Bool
}



class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var myPicker: UIPickerView!
    var podcasts: [Podcast] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        
        
        var podcasts = [Podcast(name: "Comedy Bang Bang", description: "A comedy Podcast", genre: "Comedy", coverArt: "", subscribed: true, dateAdded: "05.01.2009", episodes: [Episode(name: "Ep 1", audioFile: "" , episodeNumber: 1, description: "The First episode", episodeArt: "", length: 3500, currentPlay: 300, favorited: false),
            Episode(name: "Ep 2", audioFile: "" , episodeNumber: 2, description: "The Second episode", episodeArt: "", length: 3600, currentPlay: 3600, favorited: false),
            Episode(name: "Ep 3", audioFile: "" , episodeNumber: 3, description: "The Third episode", episodeArt: "", length: 4000, currentPlay: 4000, favorited: false)]),
                        
            Podcast(name: "This American Life", description: "Storytelling", genre: "Personal Stories", coverArt: "", subscribed: true, dateAdded: "05.01.2009", episodes:
            [Episode(name: "Ep 1", audioFile: "" , episodeNumber: 1, description: "The First episode", episodeArt: "", length: 3500, currentPlay: 300, favorited: false),
            Episode(name: "Ep 2", audioFile: "" , episodeNumber: 2, description: "The Second episode", episodeArt: "", length: 3600, currentPlay: 3600, favorited: false),
            Episode(name: "Ep 3", audioFile: "" , episodeNumber: 3, description: "The Third episode", episodeArt: "", length: 4000, currentPlay: 4000, favorited: false)]),
                        
            Podcast(name: "Serial", description: "Storytelling", genre: "True Crime", coverArt: "", subscribed: true, dateAdded: "05.01.2009", episodes:
            [Episode(name: "Ep 1", audioFile: "" , episodeNumber: 1, description: "The First episode", episodeArt: "", length: 3500, currentPlay: 300, favorited: false),
            Episode(name: "Ep 2", audioFile: "" , episodeNumber: 2, description: "The Second episode", episodeArt: "", length: 3600, currentPlay: 3600, favorited: false),
            Episode(name: "Ep 3", audioFile: "" , episodeNumber: 3, description: "The Third episode", episodeArt: "", length: 4000, currentPlay: 4000, favorited: false)]),
        
        
        
        ]
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return podcasts.count
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return podcasts[row].name
    }

}

