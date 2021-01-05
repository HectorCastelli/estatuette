# Estatuette

Estatuette is a strategic dungeon-crawling game about doing the most with little.

With a predetermined team of archeologists, each with their own personality and skills, the player has to dive into mystical ruins and come back with treasures.

The game is structured in levels, each level is a ruin (possibly separated into multiple sub-rooms). In the ruins, there is always at least one mythical creature laying around. The mythical creatures affect the level differently, but they are all capable of killing the archeologists.

Dead archeologists affect the level by changing how movement works. An example, a certain archeologist can work by launching whoever moves on top of him one cell towards the treasure.

Archeologists can also have effects when they die, for example, launching the treasure 2 cells towards the entrance of the ruin, or by blocking the path for the creatures.


## Mythical Creatures

### Gorgon

The gorgon is a stationary creature. It looks around the treasure room. Whenever an archeologist ends their turn looking towards the gorgon, they turn to stone and die.

### Minotaur

The minotaur patrols the ruin. Every once in a while it goes into a rage-induced fit and hits the ground. This causes rocks to fall in the nearby sections of the ruin, killing archeologists located on them.

### Harpy

The harpy is a reactive creature. It will not impede the archeologists from reaching the treasure, however, it will go after them when they have the treasure in their hands. It flies in a zig-zag aroudn the ruin, and whenever it finds an archeologist with the treasure, it drags the archeologist one cell towards the treasure's initial position, then kills the archeologist.

### Cerberus

The cerberus is a tricky opponent. It uses it's abilities to see past, present and future to move around the ruin at the same time as the archeologists.

### Ladon

The ladon takes the treasure with it. While it's very capable of protecting it, it prefers to kill invaders then run away.

### Stymphalian birds

This is the only creature that works in groups. They take turns patroling the ruin, the same way as the harpy, however they do not move the treasure, only kill its holder.


## Archeologists

### Digger

This piece moves only on the horizontal or vertical axis.

When it dies it adds one unit either horizontally or vertically.

This unit can pass thru diggable areas.

### Carrier

This piece moves only on the diagonal.

When carrying the treasure, add one unit to this piece's movement.

When this piece dies, add one unit diagonally to the movement path.

### Scout

This piece moves in an arc (> or <). This piece gets one more movement if its starting movement position is adjecent to a mythical creature.

When dead, this piece adds one unit horizontally.

If this piece dies with the treasure in hands, move the treasure one unit towards the exit.

### Machine Expert

This piece moves only on L shapes.

If movement passes thru a destructable area, destroy that area.

When it dies it adds one unit on the vertical axis to the movement path.

### Archeologist Chief

This is the most versatile piece.

It can move diagonally or in a straight line. However, it has limited range.

When it dies it adds one unit to the movement path on any desired direction.