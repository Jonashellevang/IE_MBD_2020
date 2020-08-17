# YOLOv3 Object Detector For Detecting Guns - A Full Tutorial
As the fourth task in our group assignment 1 for "Machine Learning 3" class we had an optional exercise to create a YOLOv3 notebook to locate & classify different objects in a single image. For this assignment I decided to create a tutorial for others to learn the process that I have gone through learning how YOLOv3 works.

![Gun Detection](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/YOLOv3%20Tutorial/gun%20detection.png)

### What Is YOLOv3?
You Only Look Once (YOLO) is a neural network made for detecting objects and their location in the image created by Joseph Redmon. Yolov3 just means that it is the third verion of YOLO, and it is exciting news that YOLOv4 has already been launched in April 2020.

Object detection is a task in computer vision to detect objects, their location, their magnitude, and what they are. In other words, it is algorithms you use to classify images, is it a cat or a dog? YOLOv3 is in the category of Region Proposal Classification Network (RCNN), but compared to its’ siblings, YOLO looks more like a Fully Convolutional Neural Network (FCNN). It is an algorithm using DarkNet and it is written in C.

Why do we use YOLO and not either one of the other deep learning algorithms for classifying images?
* YOLOv3 is much faster, where it reaches 45 frames per second, although it is no longer the most accurate where RetinaNet and SSD outperforms its' accuracy.
* Detects multiple objects within the same image.
* Widely used for videos due to its speed.

Each image is associated with a label file saved as .txt file, and to be able to get this we have three options; we can build them from scratch with our own pictures and labels using a tool, we can use already labeled images or we can use pre-trained models. YOLOv3 is basically just another state-of-the-art (SOA), real-time object detection system for images and videos.
