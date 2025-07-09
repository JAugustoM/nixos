{
  # Disk Options
  DISK_IOSCHED = "mq-deadline deadline";
  AHCI_RUNTIME_PM_ON_AC = "on";
  AHCI_RUNTIME_PM_ON_BAT = "on";

  # Graphics
  RADEON_DPM_STATE_ON_AC = "perfomance";
  RADEON_DPM_STATE_ON_BAT = "battery";
  AMDGPU_ABM_LEVEL_ON_AC = 0;
  AMDGPU_ABM_LEVEL_ON_BAT = 3;

  # Networking
  WIFI_PWR_ON_AC = "off";
  WIFI_PWR_ON_BAT = "off";

  # Platform
  PLATFORM_PROFILE_ON_AC = "performance";
  PLATFORM_PROFILE_ON_BAT = "balanced";

  # Processor
  CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
  CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

  # USB
  USB_EXCLUDE_BTUSB = 1;

  USB_DENYLIST = "303a:1001";
}
