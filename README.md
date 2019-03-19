# 用法

如果你在当前/root目录下面有个test.jpg图片，那么运行

```
docker run --rm -v /root:/pic hellozjf/easy12306 /usr/bin/python3 /easy12306/main.py /pic/test.jpg
```

这句会打印出预测的结果