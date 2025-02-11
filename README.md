### autorun.nvim

## 在 `nvim` 中设置 快捷键(默认`:Autorun`) 快速运行你的，c cpp py rust代码。

# 安装(使用 `lazy.vim` 插件管理器)

    { 'ShangYJQ/autorun.nvim',   opts = {} },
    { 'akinsho/toggleterm.nvim', version = "*", config = true }

# 安装(在lvim中)

    {
        'ShangYJQ/autorun.nvim',
        dependencies = {
          { 'akinsho/toggleterm.nvim' },
        },
        config = function()
          require("autorun").setup {
            py_exec = "python3",
            cpp_c = "clang++",
            c_c = "clang",
          }
        end
    },

# 配置

1. `cpp_c`:默认为 `clang++` 你可以配置为 `g++`
2. `c_c`:默认为 `clang` 你可以配置为 `gcc`
3. `py_exec`:默认为 `python` 你可以配置为 `python3`
