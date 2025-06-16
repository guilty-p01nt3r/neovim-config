return {
  'nmac427/guess-indent.nvim',
  lazy = true,
  event = { "BufEnter" },
	config = function()
    require('guess-indent').setup {}
  end,
}
