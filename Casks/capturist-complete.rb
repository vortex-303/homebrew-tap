cask "capturist-complete" do
  version "1.1.0,10"
  sha256 "7849da23904b4bc59d3066cd0d2c523f19dfa4d462d5a839605f829cc6996657"

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
