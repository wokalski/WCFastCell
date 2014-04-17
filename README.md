WCFastCell
==========

###What's new

* UICollectionView support

==========
#####Cocoa pods
<pre><code> pod 'WCFastCell'
</code></pre>

###What it is?
WCFastCell is a drop in replacement for UITableViewCell & UICollectionViewCells. It draws subviews' contents (either UILabels or UIImageViews) on a single layer. Thanks to that UITableViews & UICollectionViews scroll more smoothly. It can be especially useful on older devices.

#### UITableViewCells vs WCFastCells
<img src="/README%20resources/UITableViewCell.tiff" height="500px">
<img src="/README%20resources/WCFastCell.png" height="500px">

![](/README\ resources/Performance\ difference.png)

#####Device: iPhone 4
###### UITableViewCells: ~35 FPS
###### WCFastCells: ~60 FPS
###### Checkout the Sample project for more information.


#### How to use it?
Just change the class of your UITableViewCell (or it's subclass) to WCFastCell (or set WCFastCell as a base class accordingly).

###What it isn't?

If you need to animate cell's contents you should not use WCFastCell, but in other cases you are free to use it.

###License
Copyright (c) 2013-2014 Wojciech Czekalski. All rights reserved.

WCFastCell is free and open source code, licensed under MIT. See LICENSE for full details.

### About me

[Twitter: @wczekalski](http://twitter.com/wczekalski)

[Blog - Code Maverick](http://blog.wczekalski.com)
