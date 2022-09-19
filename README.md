[中文](https://github.com/BruceWind/CompressImagesInAndroid/blob/master/README_zh.md)

# CompressingAndroidRes
Compressing images by shell on github-action or github-ci. 

### Background
Some engineers have been complaining about colleagues uploading large images into Android projects.
Thus, some people may want to run a shell to compress all large images, however, compressing image is so slow on computers. It cost too much time and might have **overheated computers**.

There are several approches to achieve our goal. 

In my humble opinion, the best way of them is creating a automatic task to compress them on **server**.
So I made this. 
It can automatically work on **github-action or gitlab-ci** so that you don't need to spent time on compressing large images.

In this repo, an exemple for starting an automatic task to do that. It could work with in Gitlab CI and Github Actions.


### Github Actions

Fistly, you start a manual action to.
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_action_trigger.png)

And then, action will push some images compressed if need.
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_action_commited.png)


### Gitlab CI
In Gitlab, everything is automatic. Some environment may provide manual way to run compressing. But I did not give the example, you can change code to achieve.
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_of_gitlab_ci.png)

### Plan

- [x] compressing images that below res directory in shell script.
- [x] compressing images in gitlab-ci and then commit new file.
- [x] works on **gitlab-ci**, and automatically commit new files.
- [ ] supporting FLIF format.

### In addition 

You still can run shell without CI or Actions task.

Furthermore, it work not only in Android project but also ios project, or other projects-just need a little bit change.

### Remind 
> 1. Before cloning this repo, you should install [git-lfs](https://git-lfs.github.com/) .

