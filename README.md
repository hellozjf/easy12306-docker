# 用法

如果你在当前/root/tmp目录下面有个test.jpg图片，那么运行

```
docker run --rm -v /root/tmp:/pic hellozjf/easy12306:1.0.0 test.jpg
```

这句会打印出预测的结果