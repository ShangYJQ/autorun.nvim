### autorun.nvim

## 在 `nvim` 中设置 快捷键(默认`Ctrl + r`) 快速运行你的，cpp py rust代码。

# 安装(使用 `lazy.vim` 插件管理器)

    { 'ShangYJQ/autorun.nvim',   opts = {} },
    { 'akinsho/toggleterm.nvim', version = "*", config = true }

# 配置

1. `cpp_c`:默认为 `clang++` 你可以配置为 `g++`
2. `c_c`:默认为 `clang` 你可以配置为 `gcc`
3. `py_exec`:默认为 `python` 你可以配置为 `python3`
