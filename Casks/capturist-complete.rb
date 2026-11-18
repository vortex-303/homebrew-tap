cask "capturist-complete" do
  version "1.1.0,7"
  sha256 "9e245af651688de6d6f2685afc78ac961f83d8baae5a1e8cc61ef5280ed3c426"

  url "https://capturist.nodetools.org/download/CapturistComplete-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Capturist Complete"
  desc "Screenshot, snippet and clipboard library with on-device text search"
  homepage "https://capturist.nodetools.org/"

  livecheck do
    url "https://capturist.nodetools.org/capturist.json"
    strategy :json do |json|
      app = json.dig("app", "distribution", 0)
      "#{app["version"]},#{app["build"]}"
    end
  end

  depends_on macos: ">= :sonoma"

  app "Capturist Complete.app"

  zap trash: "~/Library/Containers/*.capturist.complete"
end
