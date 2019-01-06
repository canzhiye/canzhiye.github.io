---
layout: post
title:  "Sneak Peek: Pose Estimation on Basketball Broadcast Video"
date:   2018-07-21
---

I'm thinking about how to apply computer vision to basketball in order to quantify things that are not currently or see the game in a different way. 

This post merely includes some early thoughts and miniscule prototypes.

I used Facebook Research's DensePose. It was kind of a pain to install, so I wrote a little [gist](https://gist.github.com/canzhiye/af55bde2a0437c5e46997bb969024676) for it if you're interested in tinkering yourself. It might not ultimately be the right tool though.

I didn't pre-process the videos at all. The court and crowd definitely needs to be segmented out. [Here's](https://twitter.com/canzhiye/status/1012390885298864130) what it looks like without that.

This isn't NBA specific. Here I pulled a Euroleague clip. Also, I thought it might be interesting to turn the players into just a single-colored silhouette. Can that remove some bias in scouting? Can you guess who's shooting in [this clip](https://twitter.com/canzhiye/status/1020688241643671556)?  

This is very much a work in progress. Would love to hear any ideas or feedback!