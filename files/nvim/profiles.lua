-- Defines the profiles you want to use
local profiles = {
	stable = { "~/.config/nvim/configs/stable", {
			plugins = "packer",
			preconfigure = "packer",
		}
	},

  rolling = {"~/.config/nvim/configs/rolling", {
      plugins = "packer",
      preconfigure = "packer",
    }
  },
}

-- return <name_of_config>, <list_of_profiles>
return "rolling", profiles
