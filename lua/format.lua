require('formatter').setup({
    logging = false,
    filetype = {
        dart = {
            function ()
                return {
                    exe = "flutter",
                    args = {vim.api.nvim_buf_get_name(0)}
                }
            end
        }
    }
})
