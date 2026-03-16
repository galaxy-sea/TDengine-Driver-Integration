

## 特性
- 有驱动列表可以选择并自动下载，免除痛苦
- tables只展示 `超级表`，`虚拟表`，`普通表`。不显示 `子表`（没啥意义）
- `视图`还在适配中（`没有企业版无法验证,谁施舍一下吧`）
- 方言支持(适配)
  -[x] 关键字提示
  -[x] 函数提示
  -[ ] liveTemplates
  -[ ] 元数据提：database/table/Field 
  - 高亮
    -[x] 关键字高亮
    -[x] 函数高亮
    -[ ] 元数据高亮


## 支持版本

[支持版本查看](https://docs.taosdata.com/reference/connector/#%E7%89%88%E6%9C%AC%E6%94%AF%E6%8C%81)
``用最新的就对了``，没有空测试所有版本的兼容性，毕竟要测试 TDengine、TDengine JDBCDriver、JetBrains全家桶 三者的兼容性是一个玄学。

## 插件安装地址

https://plugins.jetbrains.com/plugin/30538-tdengine-driver-integration


## 已知问题
- JetBrains 2025.2.4 添加后无法点击，使用完成重启法重启idea、datagrip （可能是我用开发版造成的吧）
- JetBrains 2024.3 冻屏无法解决，直接升级JetBrains版本吧 （JetBrains用了虚拟线程）

> 代码也不是很多但是不知道什么原因 JetBrains database模块开发总是会有一些问题。
