# SSMediaPicker
SSMediaPickerHelper class helps you to take image and video easily without writing number of code. This class automatically present the action sheet as per the device and simulator.

Just copy the SSMediaPickerHelper Class into your project.

# Declare a variable with
var ssMediaPickerHelper : SSMediaPickerHelper?

and then just initialise it as per your requirement.

# Example
# For Selecting an Image From Gallary or Camera

            ssMediaPickerHelper = SSMediaPickerHelper(viewController: self, isForVideo: false, imageCallback: { (image) in
            
            if image != nil {
            self.imageView.image = image
            }
            self.buttonPlay.isHidden = true
            }, videoCallback: nil)


# For Selecting a Video From Gallary or Camera

            ssMediaPickerHelper = SSMediaPickerHelper(viewController: self, isForVideo: true, imageCallback: nil, videoCallback: { (url) in
            
            if url != nil {
                self.imageView.image = self.thumbnailForVideoAtURL(url: url!)
                self.videoURL = url!
                self.label.text = url?.absoluteString
            }
            
            self.buttonPlay.isHidden = false
            })


Thank You,

Sanjay Shah
