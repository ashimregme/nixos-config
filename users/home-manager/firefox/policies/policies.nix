{ config, pkgs, ... }:

{
  imports = [ ./preferences.nix ./extensions.nix ];

  programs.firefox.policies = {
    DisableTelemetry = true;
    DisableFirefoxStudies = true;

    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
      EmailTracking = true;
    };

    DisableFirefoxAccounts = false;
    DisableAccounts = false;
    DisableProfileImport = true;
    DisplayBookmarksToolbar = "newtab";
    HardwareAcceleration = true;

    DNSOverHTTPS = {
      Enabled = false; # Disabled in favor of router's https-dns-proxy
      Locked = true;
    };

    FirefoxHome = {
      TopSites = false;
      SponsoredTopSites = false;
      Highlights = false;
      Pocket = false;
      SponsoredPocket = false;
      Snippets = false;
      Locked = false;
    };

    FirefoxSuggest = {
      WebSuggestions = true;
      SponsoredSuggestions = false;
      ImproveSuggest = false;
      Locked = true;
    };

    OverrideFirstRunPage = "";
    OverridePostUpdatePage = "";
    DontCheckDefaultBrowser = true;
    DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
    SearchBar = "unified"; # alternative: "separate"
    HttpsOnlyMode = "force_enabled";
    NoDefaultBookmarks = true;
    OfferToSaveLogins = false;
    OfferToSaveLoginsDefault = false;
    PasswordManagerEnabled = false;
    DefaultDownloadDirectory = "\${home}/Downloads";
    PromptForDownloadLocation = false;
    RequestedLocales = "en-US";

    SanitizeOnShutdown = {
      Cookies = false;
      Downloads = true;
      FormData = true;
      Locked = true;
    };

    UserMessaging = {
      ExtensionRecommendations = false;
      FeatureRecommendations = false;
      UrlbarInterventions = false;
      SkipOnboarding = true;
      MoreFromMozilla = false;
      Locked = true;
    };

    Bookmarks = [ ];
    ManagedBookmarks = [ ];
  };
}