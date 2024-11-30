return {
    -- Displays the color for hex values
    -- To use this plugin, open the file you want to use,
    -- then enter the COMMAND mode and run this command in Neovim
    -- :ColorizerAttachToBuffer
    {
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require("colorizer").setup({
                -- You can also set the plugin to automatically work
                -- when you open certain file types
                "css";
                "svelte";
                "lua";
                "toml";
            })
        end
    }
}
