{ config, pkgs, ... }:

{
  programs.firefox.policies.ExtensionSettings = with builtins;
  let extension = shortId: uuid: {
    name = uuid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };
  in listToAttrs [
    (extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20@proton.me")
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
    (extension "gnome-shell-integration" "chrome-gnome-shell@gnome.org")
    (extension "multi-account-containers" "@testpilot-containers")
    (extension "facebook-container" "@contain-facebook")
    (extension "duckduckgo-for-firefox" "jid1-ZAdIEUB7XOzOJw@jetpack")
    (extension "adblock-for-firefox" "jid1-NIfFY2CA8fy1tg@jetpack")
    (extension "popup-blocker-ultimate" "{60B7679C-BED9-11E5-998D-8526BB8E7F8B}")
    (extension "momentumdash" "momentum@momentumdash.com")
  ];
  # To add additional extensions, find it on addons.mozilla.org, find
  # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
  # Then, download the XPI by filling it in to the install_url template, unzip it,
  # run `jq .browser_specific_settings.gecko.id manifest.json` or
  # `jq .applications.gecko.id manifest.json` to get the UUID
}