//
//  GetPhotoVC.swift
//  TPE2SFO
//
//  Created by zip520123 on 2017/7/29.
//  Copyright © 2017年 zip520123. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire
import SwiftyJSON

class GetPhotoVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    static var apiKey = ""
    static let apiURL = "https://vision.googleapis.com/v1/images:annotate?key=\(apiKey)"
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    var clothList = [ClothObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadApikey()
    }
    
    @IBAction func popself(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func loadApikey(){
        
        let path = Bundle.main.path(forResource: "apikey", ofType: "plist")
        let	keys = NSDictionary(contentsOfFile: path!)
        let plistApiKey = keys!["GoogleVisionApiKey"] as! String
        GetPhotoVC.apiKey = plistApiKey
        
    }
    @IBAction func takePicture(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        picker.cameraOverlayView = UIImageView(image:#imageLiteral(resourceName: "cut-2"))
        present(picker, animated: true)
    }
    @IBAction func chooseImage(_ sender: Any) {
        // The photo library is the default source, editing not allowed
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .savedPhotosAlbum
        present(picker, animated: true)
    }
    //image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true)
        imageView.image = nil
        guard let uiImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        imageView.image = uiImage
        
        textView.text = "loading..."
        //IMAGE_PROPERTIES  , LABEL_DETECTION
        let imageString = base64EncodeImage(uiImage)
        let json : JSON = ["requests" :
            ["image" : ["content" : imageString] ,
             "features" : ["type" : "LABEL_DETECTION" ,
                           "maxResults" : 10
                ]
            ]
        ]
        
        let parem: Parameters = json.dictionaryObject!
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        
        
        Alamofire.request(GetPhotoVC.apiURL, method: .post, parameters: parem, encoding: JSONEncoding.default , headers: nil).responseJSON(options:.mutableContainers){[weak self] response in
            hud.hide(animated: true)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let newCloth = ClothObject(image: uiImage, json: json)
                self?.clothList.append(newCloth)
                self?.updateText(json: json)

            case .failure(let error):
                self?.textView.text = error.localizedDescription
                print(error)
            }
        }
        
    }
    func updateText(json : JSON){

        let jsonArray = json["responses"][0]["labelAnnotations"].arrayValue
        var detectS = ""
        for item in jsonArray {
            let des = item["description"].stringValue
            detectS.append(des)

            detectS.append("\n")
        }
        textView.text = detectS
        for item in jsonArray {
            if item["description"].stringValue == "t shirt" {
//              lightLED(bool: true)
                return
            }
        }
//        lightLED( bool : false)
        
    }
    
    func lightLED( bool : Bool){
    
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        let urlString = "http://mylinkit.local:8090/\(bool)"

        Alamofire.request(urlString).response { (_) in
            hud.hide(animated: true)
        }


    
    }
    func resizeImage(_ imageSize: CGSize, image: UIImage) -> Data {
        UIGraphicsBeginImageContext(imageSize)
        image.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        let resizedImage = UIImagePNGRepresentation(newImage!)
        UIGraphicsEndImageContext()
        return resizedImage!
    }
    func base64EncodeImage(_ image: UIImage) -> String {
        var imagedata = UIImagePNGRepresentation(image)
        
        // Resize the image if it exceeds the 4MB API limit
        if (imagedata!.count > 4096000) {
            let oldSize: CGSize = image.size
            let newSize: CGSize = CGSize(width: 800, height: oldSize.height / oldSize.width * 800)
            imagedata = resizeImage(newSize, image: image)
        }
        
        return imagedata!.base64EncodedString(options: .endLineWithCarriageReturn)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let clothTableVC = segue.destination as? ClothTableVC {
            clothTableVC.clothList = self.clothList
        }
    }

}
