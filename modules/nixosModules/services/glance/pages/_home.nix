{
  name = "Home";
  slug = "";
  center-vertically = true;
  columns = [
    {
      size = "full";
      widgets = [
        {
          type = "server-stats";
          servers = [
            {
              type = "local";
              name = "Laptop";
              hide-swap = true;
            }
          ];
        }
        {
          type = "to-do";
        }
      ];
    }
    {
      size = "small";
      widgets = [
        {
          type = "weather";
          hide-header = true;
          location = "Brasília";
          hour-format = "24h";
        }
        {
          type = "calendar";
          hide-header = true;
          first-day-of-week = "sunday";
        }
      ];
    }
  ];
}
