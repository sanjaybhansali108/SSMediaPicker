# SSMediaPicker
SSMediaPickerHelper class helps you to take image and video easily without writing number of code. This class automatically present the action sheet as per the device and simulator.

Just copy the SSMediaPickerHelper Class into your project.

# Declare a variable with
var ssMediaPickerHelper : SSMediaPickerHelper?

and then just initialise it as per your where you want actionsheet picker.

# Example
# For Selecting an Image From Gallary or Camera

 ``` 
 ssMediaPickerHelper = SSMediaPickerHelper(viewController: self, isForVideo: false, imageCallback: { (image) in
            
            if image != nil {
            self.imageView.image = image
            }
            self.buttonPlay.isHidden = true
            }, videoCallback: nil)
```

### ScreenShots

```
(https://drive.google.com/open?id=0B-B09f6zPznFQWN0RDRmN2RIdHM)
(https://drive.google.com/open?id=0B-B09f6zPznFeFFzZm5rWjdfTkU)
(https://drive.google.com/open?id=0B-B09f6zPznFYkpWWkRxcU9xR2c)
```
# For Selecting a Video From Gallary or Camera

 ``` 
 ssMediaPickerHelper = SSMediaPickerHelper(viewController: self, isForVideo: true, imageCallback: nil, videoCallback: { (url) in
            
            if url != nil {
                self.imageView.image = self.thumbnailForVideoAtURL(url: url!)
                self.videoURL = url!
                self.label.text = url?.absoluteString
            }
            
            self.buttonPlay.isHidden = false
            })
```
### ScreenShots

```
(https://drive.google.com/open?id=0B-B09f6zPznFSVZhRmpXYTdDSmc)
(https://drive.google.com/open?id=0B-B09f6zPznFdE5JTlQ0U19BeWM)
(https://drive.google.com/open?id=0B-B09f6zPznFc1Vud0cwNndqeTQ)
```
Thank You,

Sanjay Shah
