{
  # Battery Options
  START_CHARGE_THRESH_BAT0 = 75;
  STOP_CHARGE_THRESH_BAT0 = 80;

  # Disk Options
  DISK_DEVICES = "nvme0n1 nvme1n1";
  DISK_IOSCHED = "mq-deadline deadline";
  AHCI_RUNTIME_PM_ON_AC = "on";
  AHCI_RUNTIME_PM_ON_BAT = "auto";

  # Graphics
  INTEL_GPU_MIN_FREQ_ON_AC = 550;
  INTEL_GPU_MIN_FREQ_ON_BAT = 550;

  INTEL_GPU_MAX_FREQ_ON_AC = 1550;
  INTEL_GPU_MAX_FREQ_ON_BAT = 1000;

  INTEL_GPU_BOOST_FREQ_ON_AC = 1550;
  INTEL_GPU_BOOST_FREQ_ON_BAT = 1000;

  # Networking
  WIFI_PWR_ON_AC = "off";
  WIFI_PWR_ON_BAT = "off";

  # Platform
  PLATFORM_PROFILE_ON_AC = "performance";
  PLATFORM_PROFILE_ON_BAT = "low-power";

  MEM_SLEEP_ON_AC = "s2idle";
  MEM_SLEEP_ON_BAT = "deep";

  # Processor
  CPU_DRIVER_OPMODE_ON_AC = "active";
  CPU_DRIVER_OPMODE_ON_BAT = "active";

  CPU_SCALING_GOVERNOR_ON_AC = "performance";
  CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

  CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
  CPU_ENERGY_PERF_POLICY_ON_BAT = "low-power";

  CPU_MIN_PERF_ON_AC = 0;
  CPU_MAX_PERF_ON_AC = 100;

  CPU_MIN_PERF_ON_BAT = 0;
  CPU_MAX_PERF_ON_BAT = 80;

  # USB
  USB_EXCLUDE_BTUSB = 1;
}
