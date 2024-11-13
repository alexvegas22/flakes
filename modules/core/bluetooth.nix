{ ... }: {
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
	General = {
		Experimental = true;
    Enable = "Source,Sink,Media,Socket";
	};
};
}
