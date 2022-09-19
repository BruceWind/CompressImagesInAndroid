[中文](https://github.com/BruceWind/CompressImagesInAndroid/blob/master/README_zh.md)

# CompressingAndroidRes
Compressing images by shell on github-action or github-ci. 

Due to the fact that compressing images are so slow on computers so that I make this.
It can work automatically on github-action or gitlab-ci so that you don't need to spent time on compressing large images.
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_action_trigger.png)
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_of_gitlab_ci.png)

- [x] compressing images that below res directory in shell script.
- [x] compressing images in gitlab-ci and then commit new file.
- [x] works on **gitlab-ci**, and automatically commit new files.
- [ ] supporting FLIF format.


On the other hand, you still can run shell without CI or action task.
Furthermore, it work not only in Android project but also ios project, or other projects.

### Remind 
> 1. Before cloning this repo, you should install [git-lfs](https://git-lfs.github.com/) .

