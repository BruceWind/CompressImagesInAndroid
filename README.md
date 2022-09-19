[中文](https://github.com/BruceWind/CompressImagesInAndroid/blob/master/README_zh.md)

Compressing images by shell on github-action or github-ci. 
# CompressingAndroidRes
In the background, some developers has been bothering about coworkers pushing large image into Android project.
There are many approches to achieve our goal. Some people may want to run a shell to compress all large images, however, compressing image is so slow on computers. It cost too much time and laptop run it may got heated up.

In my humble opinion, developers can create a automatic task for compressing them  so that I made this. 
It can work automatically on github-action or gitlab-ci so that you don't need to spent time on compressing large images.

In this repo, an exemple for starting an automatic task to do that. It could work with in Gitlab CI and Github Actions.

### Github Actions

Fistly, you start a manual action to.
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_action_trigger.png)

And then, action will push some images compressed if need.
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_action_commited.png)


### Gitlab CI
In Gitlab, everything is automatic.
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_of_gitlab_ci.png)

- [x] compressing images that below res directory in shell script.
- [x] compressing images in gitlab-ci and then commit new file.
- [x] works on **gitlab-ci**, and automatically commit new files.
- [ ] supporting FLIF format.


On the other hand, you still can run shell without CI or Actions task.

Furthermore, it work not only in Android project but also ios project, or other projects.

### Remind 
> 1. Before cloning this repo, you should install [git-lfs](https://git-lfs.github.com/) .

