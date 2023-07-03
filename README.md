# 🌎 WorldHunter

 WWDC23 Swift Student Challenge - World Geography Education App [Accepted]

# 🔍 Introducton
<p align="center"><img src="https://github.com/yujinnee/WorldHunter/assets/51031771/85e8ca93-94bc-485b-b210-f5325b968e88" width="80%" height="80%"></p>

World Hunter is a Swift UI app for global geographic information education. It gives a hint of the name information about the countries around treasure, and based on this hint, you can find a country where treasure is hidden. In this process, you can learn the geographical information of the country where the treasure is hidden and the geographical information of the surrounding country together.
The core functions of the app are continental selection, country quiz and treasure observation.

# 🛠️ Technologies
- SwiftUI
- UIKit
- SceneKit
- ARKit


# 📱 Feature

### 📌 Continent Selection Screen
<p align="center"><img src="https://github.com/yujinnee/WorldHunter/assets/51031771/1664c8b6-c0ac-4057-b056-2c78fc356618" width="80%" height="80%"></p>
This is the Continental Selection screen. The 3D Earth is implemented so that you can choose the continent you want to find treasure and learn the shape and location of the six continents of the world. For this function, I used ARKit framework technology. You can freely spin the globe with your fingers and enjoy the view of the Earth.

### 📌 Country Quiz Screen
<p align="center"><img src="https://github.com/yujinnee/WorldHunter/assets/51031771/716e57f4-c5e9-4a5a-902d-0541e46d5644" width="80%" height="80%"></p>

After selecting a continent, a map of that continent appears and hints about the country where the treasure is hidden appear. This hint is about neighboring countries surrounding the country where the treasure is hidden. You can zoom in, zoom out and move the map implemented with UIScrollView of UIKit and explore the country where the treasure is hidden.
On the right side of the map, there are buttons where you can enter the correct answers.
If the answer is wrong, an alert window appears asking you to find it again, and if the answer is correct, it goes to the Treasure Observation Screen.

### 📌 Treasure Observation Screen
<img width="936" alt="Screenshot 2023-07-03 at 12 04 38 PM" src="https://github.com/yujinnee/WorldHunter/assets/51031771/d82d651d-5431-4a6a-90bf-af3f8d4feaf2">


On the Treasure Observation Screen, you can check the treasure you found through the camera. For this function, I used ARKit and RealityKit. It actually gives you a sense of reality and interest by discovering and observing treasures lying around you. After the observation, you can return to the previous screen and take a quiz about the new country through the Find Another Treasure button at the bottom.



# 🌎 Continental Screens

# Africa
https://github.com/yujinnee/WorldHunter/assets/51031771/09b93c56-8e1c-4298-a109-fbe475e327f3
# Asia
https://github.com/yujinnee/WorldHunter/assets/51031771/7943f5fd-ed51-49a3-bd0f-f57e2141679a
# Europe
https://github.com/yujinnee/WorldHunter/assets/51031771/8d65c815-6243-4211-9ef8-85efcb7684df
# North America
https://github.com/yujinnee/WorldHunter/assets/51031771/eccd1498-7f2e-4ff7-8818-702db9164b8f
# Oceania
https://github.com/yujinnee/WorldHunter/assets/51031771/4edc76c2-8cbd-4caf-990e-f11c80778820
# South America
https://github.com/yujinnee/WorldHunter/assets/51031771/be2dad39-effe-4f9f-b874-b8426a49dc3c

