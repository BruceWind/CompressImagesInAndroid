# CompressingAndroidRes
利用github-action/github-ci服务器资源去压缩项目大图. 


### Background
一些工程师一直在抱怨同事把大图片上传到Android项目中。
因此，有些人可能想运行一个shell来压缩所有的大图片，然而，压缩图片在电脑上是如此缓慢。它花费了太多的时间，而且可能会有**电脑过热**。

有几种方法可以实现我们的目标。

在我看来，其中最好的方法是在**服务器**上创建一个自动任务来压缩它们。
所以我做了这个, 它可以在**github-action或gitlab-ci**上自动工作，这样你就不需要花时间去压缩大图片了。

在这个 repo 中，有一个启动自动任务的例子，可以做到这一点。它可以在Gitlab CI和Github Actions中工作。
因为图片压缩非常耗费性能与时间。所以，我做了个这个repo。
它可以自动 或者手动触发 ci/acction任务进行压缩。


### Github Actions
在github上您需要手动触发任务，修改成功之后，会自动创建commit。
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_action_trigger.png)
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_action_commited.png)

### Gitlab CI
在Gitlab自动触发。
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_of_gitlab_ci.png)

### 计划

- [x] 目前只压缩res目录.
- [x] **github-action**运行，并且自动commit.
- [x] **gitlab-ci**运行，并且自动commit.
- [ ] supporting FLIF format.



### 此外 

你仍然可以在没有CI或Actions任务的情况下运行shell。

此外，它不仅可以在Android项目中工作，也可以在ios项目或其他项目中工作，只是需要做一点改变。


### 提醒 
> 1. clone仓库前你需要安装[git-lfs](https://git-lfs.github.com/) .

***其他***, 这个仓库不只在android项目工作，IOS项目应该也是可以的。
