{ ... }:
{
  programs.freetube = {
    enable = true;
    settings = {
      baseTheme = "catppuccinMocha";
      mainColor = "CatppuccinMochaSapphire";
      secColor = "CatppuccinMochaSapphire";
      barColor = false;

      defaultViewingMode = "theatre";

      hideHeaderLogo = true;
      hideLabelsSideBar = true;
      hideTrendingVideos = true;
      hidePopularVideos = true;
      hideSubscriptionsShorts = true;
      hideSubscriptionsCommunity = true;
      hideChannelShorts = true;
      hideChannelCommunity = true;
      hideLiveChat = true;
      hideComments = true;

      useSponsorBlock = true;
    };
  };
}
