# iDonation @ AngelHack Global Hackathon Series: Taipei

## Introduction
- TPE2SFO is an iOS project to take a picture and recognize clothes objects through Google Cloud Vision API
- flask-led.py runs on linkit 7688 develpment board to control the led via http requests.

## Usage
- Open TPE2SFO.xcworkspace.
- Create apikey.plist and add your google vision api key in apikey.plist with key "GoogleVisionApiKey".
- Select target "TPE2SFOiPad" and run.
> This project only work on real device not a simulator, because it need cameras. :)
- Select "I want to sell the cloth".
- Select "I'd like to put anthoer one".
- Take a photo and the app will upload photo to google vision to detect cloth label.
- You can take another photo to detect. Finally, select "Complete the process" to see the detected list.

## Setup linkit 7688 
I disable interact with 7688 on line:107 and line:111 in GetPhotoVC. If you want to interact with 7688. Make sure 7688 and iPad in the same subnet that iPad can find 7688 otherwise it don't work.


## Contributors
- 張捷中 Jie-Chung Chang
- 高爾廷 Erh-Ting Kao
- 蔡祥霖 Hsiang-Lin Tsai
- 葉怡君 Yi-Chun Yeh
- 郭軒騏 Hsuan-Chi Kuo
## Lincese 

- The Mit Lincese
