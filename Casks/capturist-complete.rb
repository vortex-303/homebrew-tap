cask "capturist-complete" do
  version "1.1.0,8"
  sha256 "e3b3abd2d0f56bb166fa5cc6e925df4b9ef95b8843c9d58a51d2b7146e02f6ea"

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
