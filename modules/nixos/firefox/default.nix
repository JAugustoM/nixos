{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "firefox";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable firefox";
    };
  };

  config = {
    programs.firefox = {
      enable = cfg.enable;

      # BetterFox Preferences
      preferences = {
        # Fastfox

        ## General
        "content.notify.interval" = 100000;

        ## GFX
        "gfx.canvas.accelerated.cache-size" = 512;
        "gfx.content.skia-font-cache-size" = 20;

        ## Disk Cache
        "browser.cache.disk.enable" = false;

        ## Memory Cache
        "browser.sessionhistory.max_total_viewers" = 4;

        ## Media Cache
        "media.memory_cache_max_size" = 65536;
        "media.cache_readahead_limit" = 7200;
        "media.cache_resume_threshold" = 3600;

        ## Image Cache
        "image.mem.decode_bytes_at_a_time" = 32768;

        ## Network
        "network.http.max-connections" = 1800;
        "network.http.max-persistent-connections-per-server" = 10;
        "network.http.max-urgent-start-excessive-connections-per-host" = 5;
        "network.http.pacing.requests.enabled" = false;
        "network.dnsCacheExpiration" = 3600;
        "network.ssl_tokens_cache_capacity" = 10240;

        ## Speculative Loading
        "network.http.speculative-parallel-limit" = 0;
        "network.dns.disablePrefetch" = true;
        "network.dns.disablePrefetchFromHTTPS" = true;
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.places.speculativeConnect.enabled" = false;
        "network.prefetch-next" = false;
        "network.predictor.enabled" = false;

        ## Experimental
        "layout.css.grid-template-masonry-value.enabled" = true;

        # Securefox

        ## Tracking Protection
        "browser.contentblocking.category" = "strict";
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.uitour.enabled" = false;
        "privacy.globalprivacycontrol.enabled" = true;

        ## OCSP & CERTS / HPKP
        "security.OCSP.enabled" = 0;
        "security.pki.crlite_mode" = 2;

        ## SSL / TLS
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        "security.tls.enable_0rtt_data" = false;

        ## Disk Avoidance
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "browser.sessionstore.interval" = 60000;

        ## Shutdown & Sanitizing
        "browser.privatebrowsing.resetPBM.enabled" = true;
        "privacy.history.custom" = true;

        ## Search / URL Bar
        "browser.urlbar.trimHttps" = true;
        "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.groupLabels.enabled" = false;
        "browser.formfill.enable" = false;
        "network.IDN_show_punycode" = true;

        ## Passwords
        "signon.formlessCapture.enabled" = false;
        "signon.privateBrowsingCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        "editor.truncate_user_pastes" = false;

        ## Mixed Content + Cross-site
        "security.mixed_content.block_display_content" = true;
        "pdfjs.enableScripting" = false;

        ## Extensions
        "extensions.enabledScopes" = 5;

        ## Headers / Referers
        "network.http.referer.XOriginTrimmingPolicy" = 2;

        ## Containers
        "privacy.userContext.ui.enabled" = true;

        ## Safe Browsing
        "browser.safebrowsing.downloads.remote.enabled" = false;

        ## Mozzila
        "permissions.default.desktop-notification" = 2;
        "permissions.default.geo" = 2;
        "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
        "browser.search.update" = false;
        "permissions.manager.defaultsUrl" = "";
        "extensions.getAddons.cache.enabled" = false;

        ## Telemetry
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "datareporting.usage.uploadEnabled" = false;

        ## Experiments
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";

        ## Crash Reports
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;

        # Peskyfox

        ## Mozilla UI
        "browser.privatebrowsing.vpnpromourl" = "";
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.preferences.moreFromMozilla" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.aboutwelcome.enabled" = false;
        "browser.profiles.enabled" = true;

        ## Theme Adjustments
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.compactmode.show" = true;
        "browser.privateWindowSeparation.enabled" = false;

        ## Fullscreen Notice
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.timeout" = 0;

        ## URL Bar
        "browser.urlbar.unitConversion.enabled" = true;
        "browser.urlbar.trending.featureGate" = false;

        ## New Tab Page
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;

        ## Pocket
        "extensions.pocket.enabled" = false;

        ## Downloads
        "browser.download.manager.addToRecentDocs" = false;

        ## PDF
        "browser.download.open_pdf_attachments_inline" = true;

        ## Tab Behavior
        "browser.bookmarks.openInTabClosesMenu" = false;
        "browser.menu.showViewImageInfo" = true;
        "findbar.highlightAll" = true;
        "layout.word_select.eat_space_to_next_word" = false;

        # Optional Hardening

        ## Secure DNS
        "network.trr.uri" = "https://dns.dnswarden.com/00000000000000000000048";
        "network.trr.mode" = 2;
        "network.trr.max-fails" = 5;

        ## Downloads
        "browser.download.useDownloadDir" = false;
        "browser.download.always_ask_before_handling_new_types" = true;
        "extensions.postDownloadThirdPartyPrompt" = false;

        ## Public Key Pinning
        "security.cert_pinning.enforcement_level" = 2;
      };

      policies = {
        "ExtensionSettings" = {
          "uBlock0@raymondhill.net" = {
            installation_mode = "normal_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
            updates_disabled = false;
            private_browsing = true;
          };
          "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
            installation_mode = "normal_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/78272b6fa58f4a1abaac99321d503a20@proton.me/latest.xpi";
            updates_disabled = false;
            private_browsing = true;
          };
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            installation_mode = "normal_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/jid1-MnnxcxisBPnSXQ@jetpack/latest.xpi";
            updates_disabled = false;
            private_browsing = true;
          };
          "plasma-browser-integration@kde.org" = {
            installation_mode = "normal_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-browser-integration@kde.org/latest.xpi";
            updates_disabled = false;
            private_browsing = false;
          };
          "languagetool-webextension@languagetool.org" = {
            installation_mode = "normal_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/languagetool-webextension@languagetool.org/latest.xpi";
            updates_disabled = false;
            private_browsing = false;
          };
        };
      };
    };
  };
}
