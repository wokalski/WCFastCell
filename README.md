#This project is no longer maintained

This project will not do any good for your application. GPUs are good at composition, and drawing in `drawRect:` is extremely inefficient. And this is what This project did; flattened the hierarchy of the whole `UITableViewCell` and drew it on one view.

---

If you want to improve the drawing performance of your app check out [AsyncDisplayKit](https://github.com/facebook/AsyncDisplayKit).
