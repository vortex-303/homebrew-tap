cask "capturist-complete" do
  version "1.1.0,9"
  sha256 "0d46999402f31e17b24a3465d9f46b8177193ccca700db652cea5c7de1ceb46a"

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
