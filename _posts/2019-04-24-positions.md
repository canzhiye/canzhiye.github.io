---
layout: post
title:  More Granular NBA Player Positions with Matchup Data
date:   2019-04-24
permalink: /continuous-positions/
---

Players are traditionally assigned discrete position labels (PG, SG, SF, PF, C). In my [previous post](http://canzhiye.com/matchups) on positions, I refined these position labels by using matchup data to suggest that maybe there are really only 4 distinct positions. Additionally, the two charts hinted at player similarities based on geometric distance in the visualizations.

This post takes a different approach in exploring player positions. Instead of assigning discrete labels, I put players' positions on a continuous spectrum instead. There are some neat things you can do with these more granular player positions! For example, given any 5 players, you can objectively sort them from "small" to "big" trivially. Another example: you can quantify the "size" of each lineup by adding all the player position values. I'm sure there are many other things you can do that I haven't thought of.

### Methodology

Using 2018-19 matchup data (who guards who and for how many possessions) from [stats.nba.com](http://stats.nba.com), I constructed two [directed graphs](https://en.wikipedia.org/wiki/Directed_graph) where nodes are players and edge weights are normalized number of possessions. In the offense graph, there are directed edges from offensive players to defensive players, weighted by the number of possessions of that matchup. The defense graph is the opposite. 


Then I used a [community detection algorithm](https://perso.uclouvain.be/vincent.blondel/research/louvain.html) on the graphs to partitions the nodes (players) into communities. The basketball interpretation of a community is a position. More specifically, players in the same community in the offense graph are guarded by similar players, and similarly players in the same communitiy in the defense graph guard similar players. I visually inspected the communities, which are just unordered categories, and assigned them integers -- the Lead Guard (PG) group as 0, the Wing (SG/SF) group as 1, Big Wing (SF/PF) group as 2, and Big (C) group as 3. 

On the offense and defense graphs, I ran [node2vec](https://snap.stanford.edu/node2vec/) to embed each node into an n-dimensional space (I arbitrarily chose n=16). Now each player has an n-dimensional representation and a 1-dimensional label in [0, 1, 2, 3]. Then I used a gradient boosted regressor (could really use any model here) to predict the 1-dimensional label from the n-dimensional representation. The result is a decimal "position" value for each player, where the "smaller" players have lower values, and "bigger" players have higher values.

### Results

<iframe class="airtable-embed" src="https://airtable.com/embed/shraD7HhIiCZaEMsq?backgroundColor=purple&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="480" style="background: transparent; border: 1px solid #ccc; margin-bottom: 20px"></iframe>

### Fun observations...
First, let's sanity-check the results with eye-test / our basketball knowledge. Not surprisingly, Dinwiddie, Ntilikina, Derek White, and Beverley are guards with above average values amongst guards. Compared to the likes of Burke, Sexton, Collison, Schroder, Kemba, the former group is more versatile and more likely to guard a player at a bigger position. The bigs with the largest position values are Embiid, Ibaka, Tristan Thompson. The smallest bigs include Markieff Morris, Faried, Amir Johnson, and Jonah Bolden -- players who often play alongside another big.

The community detection algorithm labels canonical 3&D wings Josh Richardson and Robert Covington as guards on offense. Since the graphs only consider matchup data, this seems to make sense because they are often guarded by opposing guards. On defense, Covington is identified as a wing, which everyone would agree is the correct label. 

This led me to wonder, which players have the largest discrepancies between their offense and defense positions? The rightmost column (o - d) answers that question. The most extreme players who guard bigger players than they are guarded by are Theis, Willy Hernangomez, Josh Jackson (?!?!?!), and Felicio. No idea what's going on with Jackson, but the other three are not really offensive options, so I guess they are matched up with wings on offense, but guard other bigs on defense.

Finally, a breakdown of the number of players at each position.

Offense:
- guard: 72
- wing: 126
- big wing: 67
- big: 76 

Defense:
- guard: 79
- wing: 114 
- big wing: 71 
- big: 77 


------

Thoughts? Questions? Comments? Ideas? → [@canzhiye](http://twitter.com/canzhiye)
