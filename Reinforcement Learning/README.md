# AWS Deep Racer
As an assingment for the class "Reinforcement Learning" we had to learn how to make a car drive by itself. Yes, I agree, it sounds like a cool assignment right? And it was, I think it was my favorite, and it was so addicting!

Amazon writes this on their page: "AWS DeepRacer gives you an interesting and fun way to get started with reinforcement learning (RL). RL is an advanced machine learning (ML) technique that takes a very different approach to training models than other machine learning methods. Its super power is that it learns very complex behaviors without requiring any labeled training data, and can make short term decisions while optimizing for a longer term goal.

* Build models in Amazon SageMaker and train, test, and iterate quickly and easily on the track in the AWS DeepRacer 3D racing simulator.
* Experience the thrill of the race in the real-world when you deploy your reinforcement learning model onto AWS DeepRacer.
* Compete in the world’s first global, autonomous racing league, to race for prizes and glory and a chance to advance to the Championship Cup."

Below you can see a GIF of my race and the scoreboard where I placed 3rd out of 17 participants in my group:

![AWS DeepRacer](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning/DeepRacer.gif)

![Scoreboard](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning/Scoreboard.png)

The youtube link to access the video can be viewed [here](https://youtu.be/nVsVUfC0EdE).

# Lunar Lander
For our first assignment in "Reinforcement Learning" I worked with the OpenAI's Lunar Lander gym. I used reinforcement learning (RL) to train a lunar lander vehicle in a Box2D simulation environment to land itself on the surface of the moon. I adjusted hyperparameters and the reward function as I considered appropriate, ran the training multiple times and compared the results. The notebook can be accessed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning/lunarlander.ipynb).

![Lunar Lander](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning/LunarLander.gif)

# Q-Learning
As a group project in the class "Reinforcement Learning" we chose to dive deeper into the topic of Q-learning. Within reinforcement learning there are two main algorithm methods; model-based and model-free. 

Model-based algorithms utilize reward functions to progressively improve the model, on the other hand model-free algorithms disregard the normal reward functions and estimate their own value functions for an unknown Markov decision process, based on experience. Examples of these different type of algorithm are Monte-Carlo Learning, Temporal-Difference Learning, and Q-Learning.

The most popular of these methods is Q-Learning and like other model-free algorithms is characterized as off-policy learning. This means that the algorithm finds the best possible action considering its current position. Through this method an agent’s objective is to obtain the maximum number of points, and Q-learning attempts to learn how many points it is expected to get if it were to behave perfectly.

To read the full report you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning/Q-Learning%20Report.pdf). The presentation can also be viewed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning/Q-Learning%20Presentation.pdf).

# Reinforcement Learning - Final
Due to the COVID situation our professor decided not to have an exam, rather we sent him a paper answering several questions. The report can be viewed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning/Reinforcement%20Learning%20-%20Final%20Report.pdf), and the report answers these questions:
1. What is Reinforcement Learning and how is it different from other methods like Supervised or Unsupervised Learning
2. What are Markov Decision Process (MDP) and Bellman’s equation?
3. What is a Dynamic Programming (DP) method and how is it different from MDP methods?
4. What is a Multi-armed Bandit problem, and what are example applications of it in real-life?
5. Explain 2 algorithms for solving a Multi-Armed Bandit problem
6. What is the difference between Model-based and Model-free RL methods?, describe a method for each
7. What is the difference between On-policy and Off-policy RL methods?, describe a method for each
8. What are the advantages and disadvantages of Monte Carlo (MC) methods vs Temporal Difference (TD) methods?
9. What is SARSA and how is it different from Q-learning?
10. Describe the following three RL algorithms, and how these work in high level:
* Principal Policy Optimization (PPO)
* Meta-Q-learning
* Asynchronous Advantage Actor Critic (A3C)
