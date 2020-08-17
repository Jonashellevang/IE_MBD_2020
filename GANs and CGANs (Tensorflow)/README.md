# Deep Generative Adverserial Nets
This practice session pursues the following objectives:
- To understand and create our own Generative Adversarial Neural Nets
- To evolve them to create Conditional Adversarial Neural Nets

Generative Adversarial Networks (GANs) was invented by Ian Goodfellow in 2014 and is one of the most brilliant ideas in the last 10 years within the field of Machine Learning. The general idea is to generate images, but now we are using them for many other things. The model uses variational autoencoders for the Generator to create new images, while it uses the Discriminator to classify the generated images from real images.

The topic is described further in the report that you can access by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs/GANs%20and%20CGANs%20Report.pdf) or clicking the file above called "GANs and CGANs Report.pdf". Although the results are all in the report, it does not contain the GIFs created. These can be viewed below:

For the first notebook called "01_DCGAN_MNIST.ipynb" I optained this result for the first 100 Epochs:

![MNIST Numbers](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs/01_dcgan_100Epochs.gif)

For the second notebook called "02_DCGAN_CIFAR10.ipynb" I optained this result for the first 100 Epochs:

![MNIST CIFAR10](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs/02_dcgan_100epochs.gif)

For the 200 next Epochs I obtained this result:

![MNIST CIFAR10](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs/02_dcgan_Additional200epochs.gif)

For the third notebook called "03_CDCGAN_FASSION_MNIST.ipynb" I had to make the Conditional Generative Adverserial Net from scratch and obtained this result:

![MNIST Fashion Dataset](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs/03_cdcgan_100Epochs.gif)
