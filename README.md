# NFSMWAIPlayerFixes

《极品飞车：最高通缉》(2005) 中玩家驾驶 AI 车辆时的实验性运行时修复。当前源码版本：**v1.6.3-test**。

## 功能

- AI 车辆空指针崩溃保护与原生重置行为兼容。
- 玩家警车生命值及外观损伤行为修复。
- 本地 AI 汽车音频绑定，以及直升机周边音频监听数据兼容。
- 本地直升机 HUD、加载淡出、热度转发及汽车性能限制兼容。

直升机自身的玩家操控不在本项目当前范围内；速度显示为 0 不作为待修问题。

## 构建

需要 Windows、Visual Studio C++ 工具链和 Windows SDK。打开 **x86 Native Tools Command Prompt for VS**，在项目根目录运行：

```bat
build.cmd
```

生成 `build\NFSMWAIPlayerFixes.asi` 和对应 INI。项目不依赖额外 SDK；使用 MSVC x86 内联汇编，不能按 x64 构建。

## 安装与配置

将生成的 ASI 与 INI 放在游戏 ASI 加载器支持的同一插件目录中，只保留一份本插件。修改配置后重启游戏。配置见 [NFSMWAIPlayerFixes.ini](outputs/NFSMWAIPlayerFixes.ini)。

本插件依赖特定游戏可执行文件的绝对地址和字节签名，不应视为支持所有地区、补丁或其他修改后的版本。签名不匹配的修复会跳过安装。可将 `[Debug] EnableLog` 设为 `1` 查看启用结果。

## 验证状态

v1.6.3-test 已编译，并使用两份直升机与一份普通警车转储进行离线执行回归，覆盖监听更新、此前空指针路径、最近音源/距离查询、汽车效果隔离、状态切换、解绑/重绑定，以及原有 HUD、追捕和车辆音频行为。部分外部服务和道路查询使用桩。

**当前版本尚未完成游戏内试听和完整实机回归，不能据此宣称所有声音问题或崩溃已解决。** 转储、游戏可执行文件、第三方库和生成的二进制不包含在源码仓库中。

源码位于 [outputs/NFSMWAIPlayerFixes.cpp](outputs/NFSMWAIPlayerFixes.cpp)。
