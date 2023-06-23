First though.. What is motion planning?

Motion planning stands as a central pillar in robotics. Planning enables robots and autonomous agents to move themselves and other parts of the world to a desired goal by choosing a sequence of appropriate actions. Like robotics in general, motion planning draws on a number of different fields in developing its tools. Approaches to motion planning have grown out of artificial intelligence, optimal control, and operations research.


More colloquially, motion planning can be broadly defined as the problem of computing motions, actions, or controls that move a robot through its environment in such a way that some task is performed while obeying some set of constraints.

In its most basic form, that task can be defined as moving from some start configuration to some goal configuration, with typical constraints being defined as obstacle avoidance over the motion, obeying joint limits, etc. Complexity in task definitions and constraint definitions builds from there.

I personally like to present motion planning as a generic optimization problem and then look specifically at how aspects of that problem are defined. Be forewarned, <b>I’m going to grossly abuse notation/terminology and ignore nuance all over this post with the goal of imparting intuition rather than specifics.<b>

