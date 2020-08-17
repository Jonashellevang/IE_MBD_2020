# Convolutional Neural Nets
As the first group assignment in "Machine Learning 3" we had to learn how to code CNNs, and as a bonus exercise, I created a [YOLOv3 Tutorial](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/YOLOv3%20Tutorial).

Convolutional neural networks or convnets or CNNs are a type of neural networks specialized on images. CNNs appears in 1998 introduced in a paper by Le-cun and Bengio. They were inspired on the research in the 1950s and 1960s on the visually perception on the brain. The first Convolutional Neural Network was called Le-Net5 and was able to perform the MNIST task (recognize written digits).

For the three first exercises, our goal was to build a neural net for classifying cats and dogs images, use regularization techniques and the consept of Transfer Learning on the Flower dataset.

The report can be accessed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Report.pdf), and the exercise files can be accessed here:
* [Exercise 1 - Cats vs. Dogs](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Cats_vs_Dogs%20Exercise%201.ipynb)
* [Exercise 2 - Cats vs. Dogs](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Cats_vs_Dogs%20Exercise%202.ipynb)
* [Exercise 3 - Cats vs. Dogs](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Cats_vs_Dogs%20Exercise%203.ipynb)
* [Exercise 3 - Flowers](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Flowers%20Exercise%203.ipynb)

### How to Avoid Overfitting
As part of a forum exercise in "Computer Vision" class I wrote a short paragraph about how to avoid overfitting in CNNs:

In general, the more filters we have, the more we are facing the risk of overfitting our CNN model due to the increased amount of parameters. To avoid this, we have to reduce the number of parameters, and this we obtain with the pooling operator. The pooling operator has two goals:
1. to reduce the size of the representation and therefore increase the computation speed
2. summarize or extract the key information discarding some noise information

For pooling we usually use a window size of 2 or 3, and a stride (moving window) of 2. The "window" is then moved across the filtered image, and for example in the most used pooling operator, max pooling, we take the maximum value from the window and with that we reduce the size, increase the speed, discarding noise information and extract only the key information from the image.

We can also avoid overfitting by using a regularization technique, where the most popular one is dropout. This can be used when after a certain epochs, training loss is going down, but validation loss increases. This is a clear sign of overfitting, and works in a way that you define a "dropout-rate" where you define a probability that a neuron is dropped with a probability p. This will keep happening during each iteration, and the dropped out neurons are resampled again with a probability p at every training step. This helps the model to not be too dependent on certain neurons, and therefore helps to reduce overfitting.

If we are training on few samples, data augmentation is the way to go to reduce overfitting! Data augmentation creates new samples of our images, and if we have pictures of dogs, we can increase the size of the training data by shifting, rotating, contrast changes, resizing, normalization and many other data augmentation techniques to the images of the dogs we already have. Before you know it, your training sample is much larger than it originally was. 
