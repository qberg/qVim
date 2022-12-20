local status_ok, zenmode = pcall(require, "zen-mode")
if not status_ok then
	return
end

zenmode.setup {
    window = {
        width = 90,
        options = {
            number = true,
            relativenumber = true,
        }
    },
}
