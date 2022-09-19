# CompressingAndroidRes
利用github-action/github-ci服务器资源去压缩项目大图. 
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_action_trigger.png)
![](https://media.githubusercontent.com/media/BruceWind/CompressImagesInAndroid/master/screenshot_of_gitlab_ci.png)


因为图片压缩非常耗费性能与时间。所以，我做了个这个repo。
它可以自动 或者手动触发 ci/acction任务进行压缩。


- [x] 目前只压缩res目录.
- [x] **github-action**运行，并且自动commit.
- [x] **gitlab-ci**运行，并且自动commit.
- [ ] supporting FLIF format.

### 提醒 
> 1. clone仓库前你需要安装[git-lfs](https://git-lfs.github.com/) .

***其他***, 这个仓库不只在android项目工作，IOS项目应该也是可以的。
