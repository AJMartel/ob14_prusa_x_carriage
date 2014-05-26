ob14_prusa_x_carriage
=====================

New X carriage for my ob14. Note, the project is based on a few things up on thingiverse:

1. [ob1.4](http://www.thingiverse.com/thing:41967)
1. [OB1.4 to prusa i3 X ends](http://www.thingiverse.com/thing:302416)

Mainly I am taking the acme rods I purchased for a different printer provided by [MakersToolworks](http://store.makerstoolworks.com/motion/z-axis-lead-screw-and-nut-single/) and adapting the z mount to fit the nut they use.

I do not think the nut is anything special to MakersToolworks as I have seen similar available through [Misumi](http://us.misumi-ec.com/vona2/detail/110300085250/?Inch=0)

As the scad files are not available in the ob1.4 to prusa i3 X ends, I'm just loading their .stl files and hacking/slashing. I'd rather have the original source and do a better derivative, but hey ;)

I have imported a number of scad files from [Prusa3](https://github.com/josefprusa/Prusa3). I added Prusa3 as a sub-module. Once you clone, do the following:
1. git submodule init
1. git submodule update

From there, I believe you will be able to simply open the files in openscad
