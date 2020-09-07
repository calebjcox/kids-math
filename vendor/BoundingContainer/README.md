# godot-bounding-container
Godot's built in container classes grow with the contents. This works well for a lot of cases but not when you want to be able to limit the size the of the container (e.g. when you want to keep the entire contents on the screen).

This is a custom `Container` (i.e. extends `Container`) called `BoundingContainer`. It allows for specifying bounding criteria in both the X and Y directions independently.

To use this in another Godot project, put bounding_container.gd and the copyright notice into the sub-directory of your Godot project then start or restart the editor.