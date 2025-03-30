{ config, pkgs, ... }:

let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
  lock-empty-string = {
    Value = "";
    Status = "locked";
  };
in {
  # Check about:config for options.
  programs.firefox.policies.Preferences = {
    "browser.contentblocking.category" = { Value = "standard"; Status = "locked"; };
    "extensions.pocket.enabled" = lock-false;
    "extensions.screenshots.disabled" = lock-true;
    "browser.topsites.contile.enabled" = lock-false;
    "browser.formfill.enable" = lock-false;
    "browser.search.suggest.enabled" = lock-true;
    "browser.search.suggest.enabled.private" = lock-true;
    "browser.urlbar.suggest.searches" = lock-true;
    "browser.urlbar.showSearchSuggestionsFirst" = lock-true;
    "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
    "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
    "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
    "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
    "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
    "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
    "browser.newtabpage.activity-stream.showSponsored" = lock-false;
    "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
    "browser.tabs.warnOnClose" = lock-true;

    "browser.cache.disk.enable" = lock-false;
    "browser.cache.disk.smart_size.enabled" = lock-false;
    "browser.cache.disk_cache_ssl" = lock-false;
    "browser.cache.offline.enable" = lock-false;

    "browser.cache.memory.enable" = lock-true;
    "browser.cache.memory.capacity" = 2048000;
    "browser.cache.memory.max_entry_size" = 8192;
    "browser.privatebrowsing.forceMediaMemoryCache" = lock-true;
  };
}