return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup{
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false, -- disable standard vim highlighting
            },
            ensure_installed = { "c", "cpp", "rust", "java", "lua", "bash", "markdown", "markdown_inline", "python"},
            sync_install = true,
            ignore_install = {},
            autopairs = { enable = true },
            autotag = { enable = true },
            indent = { enable = true },
            refactor = {
                highlight_definitions = {
                    enable = true,
                    -- Set to false if you have an `updatetime` of ~100.
                    clear_on_cursor_move = true,
                },
                highlight_current_scope = { enable = false },
            },

        }
    end,
}
