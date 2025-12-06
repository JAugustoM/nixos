let
  inherit (builtins) map;
  subreddits = [
    {
      subreddit = "NixOS";
      title = "NixOS";
    }
    {
      subreddit = "kde";
      title = "KDE";
    }
    {
      subreddit = "linux_gaming";
      title = "Linux Gaming";
    }
    {
      subreddit = "rust";
      title = "Rust";
    }
  ];
in
{
  name = "Social";
  slug = "social";
  columns = [
    {
      size = "full";
      widgets = [
        {
          type = "videos";
          cache = "15m";
          style = "vertical-list";
          channels = [
            "UCB5zZAm0b5-EqWkOEwHBE_A"
            "UC3nPaf5MeeDTHA2JN7clidg"
            "UC7DS3FDcD3_5Gchp4MeJvRQ"
            "UCZXW8E1__d5tZb-wLFOt8TQ"
            "UCtrjFP7i92_30uv6IehwE5Q"
            "UC2C_jShtL725hvbm1arSV9w"
            "UCuxfOdbKQy0tgGXcm9sjHiw"
            "UCr3dtVIm3nL7I-Yjn2PxxIQ"
            "UCVo63lbKHjC04KqYhwSZ_Pg"
            "UCNaAppb_FDGLH3vLnUcY3Pg"
            "UCEf5U1dB5a2e2S-XUlnhxSA"
            "UC629vKGFPRc1rz6VDm6OZiQ"
            "UC0fdDmoOESMp9zuMMmRSmZw"
            "UCiP4JMEbjjmdjGuw7ZRFRPQ"
            "UCLYimOsgmIVf6KNjzXPkUwQ"
            "UCn_FAXem2-e3HQvmK-mOH4g"
            "UCOT2iLov0V7Re7ku_3UBtcQ"
            "UCkCGANrihzExmu9QiqZpPlQ"
            "UCVdDUN69YsAXPxh2y71sMtQ"
            "UC8Q7XEy86Q7T-3kNpNjYgwA"
            "UCR1D15p_vdP3HkrH8wgjQRw"
            "UCGwu0nbY2wSkW8N-cghnLpA"
            "UCkT7pg-YFt3k1N17q4vIAhg"
            "UCTvH45HvnOzqXvfNJqdc3xg"
            "UCUMwY9iS8oMyWDYIe6_RmoA"
            "UCxLYtICsUCWdr1YPrj5DtwA"
            "UCNIuvl7V8zACPpTmmNIqP2A"
            "UCKzJFdi57J53Vr_BkTfN3uQ"
            "UChmOR1T5ZNnbRUba3lHRTOg"
            "UC1DTYW241WD64ah5BFWn4JA"
            "UCK-GxvzttTnNhq3JPYpXhqg"
            "UCJm2TgUqtK1_NLBrjNQ1P-w"
            "UCYVrkMZdrjq5eICOG6Rxiwg"
            "UC5UAwBUum7CPN5buc-_N1Fw"
            "UC-eegKVWEgBCa4OzjnK_PtA"
            "UC-uhvujip5deVcEtLxnW8qg"
            "UC_zBdZ0_H_jn41FDRG7q4Tw"
            "UCzfyYtgvkx5mLy8nlLlayYg"
            "UCSDj6ttwzj2sr464jDdg_pA"
          ];
        }
      ];
    }
    {
      size = "full";
      widgets = [
        {
          type = "group";
          widgets = map (
            { subreddit, title }:
            {
              type = "reddit";
              cache = "15m";
              style = "vertical-cards";
              show-flairs = true;
              inherit subreddit title;
            }
          ) subreddits;
        }
      ];
    }
  ];
}
